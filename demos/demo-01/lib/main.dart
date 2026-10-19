import 'dart:async';
import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/foundation.dart' show FlutterExceptionHandler;
import 'package:material_ui/material_ui.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

// Repro for https://github.com/flutter/flutter/issues/181169, fixed by
// https://github.com/flutter/flutter/pull/194721.
//
// A scrollable that a selection did not start in forwards its content origin
// to its children as the "before all content" position. A nested scrollable
// sitting exactly at that origin (the horizontal scrollable of a TableView,
// or a horizontal ListView that is the first child of a vertical one) saw that
// position as inside itself and recorded the drag as its own, so it auto
// scrolled a selection that never started in it.
//
// Scenario 1 is the issue as reported: the drag passes below the table, the
// nested scrollable receives Offset.infinite and builds a drag target at
// infinity. In a debug build that is an assertion (shown in the banner); in a
// release build nothing visible happens, which is why scenario 2 exists.
//
// Scenario 2 shows the same wrong flag acting with finite positions, in every
// build mode: hold the pointer beside a narrow horizontal list and it scrolls
// by itself.

final ValueNotifier<String?> firstError = ValueNotifier<String?>(null);

void _recordError(Object error) {
  if (firstError.value != null) {
    return;
  }
  final String text = error.toString().split('\n').first;
  // Errors can be reported mid-frame; update the banner after it.
  scheduleMicrotask(() => firstError.value ??= text);
}

void main() {
  final FlutterExceptionHandler? previous = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details) {
    _recordError(details.exception);
    previous?.call(details);
  };
  // The assertion in scenario 1 escapes from an un-awaited future.
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    _recordError(error);
    return false;
  };
  runApp(const MaterialApp(home: DemoPage()));
}

enum Scenario { table, sideways }

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  Scenario _scenario = Scenario.table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Material(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SegmentedButton<Scenario>(
                    segments: const <ButtonSegment<Scenario>>[
                      ButtonSegment<Scenario>(
                        value: Scenario.table,
                        label: Text('1. Drag across a TableView'),
                      ),
                      ButtonSegment<Scenario>(
                        value: Scenario.sideways,
                        label: Text('2. Hold beside a horizontal list'),
                      ),
                    ],
                    selected: <Scenario>{_scenario},
                    onSelectionChanged: (Set<Scenario> selected) {
                      setState(() {
                        _scenario = selected.single;
                        firstError.value = null;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    switch (_scenario) {
                      Scenario.table =>
                        'Mouse-drag a selection from "Above 1" down past the table into "Below 2". '
                            'Before: the table\'s horizontal scrollable believes the drag started inside '
                            'it and tries to auto scroll toward Offset.infinite (an assertion in debug '
                            'builds, shown below). After: no assertion, the table does not move, and the '
                            'text below the table is selected.',
                      Scenario.sideways =>
                        'Mouse-drag a selection from "Above 1" into the empty space to the right of the '
                            'horizontal list and hold the pointer there. Before: the horizontal list '
                            'scrolls sideways on its own (watch its offset). After: it stays at 0.',
                    },
                    style: const TextStyle(fontSize: 13),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: firstError,
                    builder: (BuildContext context, String? error, Widget? child) {
                      if (error == null) {
                        return const SizedBox(height: 4);
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          'First error: $error',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'monospace',
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: switch (_scenario) {
              Scenario.table => const TableScenario(),
              Scenario.sideways => const SidewaysScenario(),
            },
          ),
        ],
      ),
    );
  }
}

Widget _row(String label) {
  return Padding(padding: const EdgeInsets.all(16), child: Text(label));
}

class _Offsets extends StatelessWidget {
  const _Offsets(this.controllers);

  final Map<String, ScrollController> controllers;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge(controllers.values.toList()),
      builder: (BuildContext context, Widget? child) {
        final String text = controllers.entries
            .map((MapEntry<String, ScrollController> e) {
              final ScrollController c = e.value;
              return '${e.key}: ${c.hasClients ? c.offset.toStringAsFixed(0) : '-'}';
            })
            .join('    ');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            'offsets    $text',
            style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          ),
        );
      },
    );
  }
}

/// The issue's layout: a TableView inside a CustomScrollView inside a
/// SelectionArea, with text before and after it.
class TableScenario extends StatefulWidget {
  const TableScenario({super.key});

  @override
  State<TableScenario> createState() => _TableScenarioState();
}

class _TableScenarioState extends State<TableScenario> {
  final ScrollController _outer = ScrollController();
  final ScrollController _vertical = ScrollController();
  final ScrollController _horizontal = ScrollController();

  @override
  void dispose() {
    _outer.dispose();
    _vertical.dispose();
    _horizontal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Offsets(<String, ScrollController>{
          'page': _outer,
          'table vertical': _vertical,
          'table horizontal': _horizontal,
        }),
        Expanded(
          child: SelectionArea(
            child: CustomScrollView(
              controller: _outer,
              slivers: <Widget>[
                for (int i = 0; i < 3; i += 1) SliverToBoxAdapter(child: _row('Above $i')),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 300,
                    child: TableView.builder(
                      rowCount: 100,
                      columnCount: 100,
                      verticalDetails: ScrollableDetails.vertical(controller: _vertical),
                      horizontalDetails: ScrollableDetails.horizontal(controller: _horizontal),
                      columnBuilder: (int column) => const TableSpan(extent: FixedSpanExtent(100)),
                      rowBuilder: (int row) => const TableSpan(extent: FixedSpanExtent(100)),
                      cellBuilder: (BuildContext context, TableVicinity vicinity) {
                        return TableViewCell(
                          child: Container(
                            alignment: Alignment.center,
                            color: (vicinity.row + vicinity.column).isEven
                                ? Colors.yellow.shade300
                                : Colors.blue.shade300,
                            child: Text('(${vicinity.column},${vicinity.row})'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                for (int i = 0; i < 14; i += 1) SliverToBoxAdapter(child: _row('Below $i')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// The same wrong flag without any assertion involved: a 400px-wide horizontal
/// ListView that is the first child of a vertical ListView, with empty space
/// to its right.
class SidewaysScenario extends StatefulWidget {
  const SidewaysScenario({super.key});

  @override
  State<SidewaysScenario> createState() => _SidewaysScenarioState();
}

class _SidewaysScenarioState extends State<SidewaysScenario> {
  final ScrollController _vertical = ScrollController();
  final ScrollController _horizontal = ScrollController();

  @override
  void dispose() {
    _vertical.dispose();
    _horizontal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Offsets(<String, ScrollController>{
          'vertical list': _vertical,
          'horizontal list': _horizontal,
        }),
        Expanded(
          child: SelectionArea(
            child: ListView(
              children: <Widget>[
                for (int i = 0; i < 3; i += 1) _row('Above $i'),
                SizedBox(
                  height: 300,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: ListView(
                      controller: _vertical,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 100,
                            width: 400,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: _horizontal,
                              itemCount: 100,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  color: index.isEven ? Colors.yellow.shade300 : Colors.blue.shade300,
                                  child: Text('H $index'),
                                );
                              },
                            ),
                          ),
                        ),
                        for (int i = 0; i < 60; i += 1) _row('V $i'),
                      ],
                    ),
                  ),
                ),
                for (int i = 0; i < 6; i += 1) _row('Below $i'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
