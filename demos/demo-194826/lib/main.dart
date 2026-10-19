import 'package:material_ui/material_ui.dart';

// Repro for https://github.com/flutter/flutter/issues/185614, fixed by
// https://github.com/flutter/flutter/pull/194826.
//
// A RawAutocomplete inside a SelectionArea, on web. The options view lives in
// the app Overlay, outside the SelectionArea's render subtree, so a click on
// an option counted as a tap outside the region. On web the region unfocused
// itself on that pointer down, which took the focus away from the field; the
// options closed on the focus loss before the pointer came back up, and the
// option was never selected.
//
// 1. Type "test" in the field and click an option.
//    Before: the options close and nothing is selected.
//    After:  the option fills the field and "Selected:" updates.
//
// 2. Drag to select some of the text above the field, then click into the
//    field.
//    Before: the highlight stays while you edit the field.
//    After:  the highlight is dismissed, as a browser does when the focus
//            enters an editable element. Focusing a button keeps it.
//
// The widget tree is the sample from the issue, plus the "Selected:" line.

void main() => runApp(const AutocompleteExampleApp());

class AutocompleteExampleApp extends StatelessWidget {
  const AutocompleteExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('RawAutocomplete inside SelectionArea (#185614)')),
        body: const Center(child: AutocompleteFormExample()),
      ),
    );
  }
}

class AutocompleteFormExample extends StatefulWidget {
  const AutocompleteFormExample({super.key});

  @override
  AutocompleteFormExampleState createState() => AutocompleteFormExampleState();
}

class AutocompleteFormExampleState extends State<AutocompleteFormExample> {
  String? _autocompleteSelection;

  static const List<String> _options = <String>[
    'test 1',
    'test 2',
    'test 3',
    'test 4',
    'test 5',
    'test 6',
    'test 7',
    'test 8',
    'test 9',
    'test 10',
  ];

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Description: This example shows a RawAutocomplete form field.'),
            const SizedBox(height: 16.0),
            const Text('Try typing "test" in the field below to see the autocomplete options.'),
            RawAutocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                return _options.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                setState(() {
                  _autocompleteSelection = selection;
                });
              },
              fieldViewBuilder:
                  (
                    BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted,
                  ) {
                    return TextFormField(
                      controller: textEditingController,
                      decoration: const InputDecoration(hintText: 'This is a RawAutocomplete!'),
                      focusNode: focusNode,
                      onFieldSubmitted: (String value) {
                        onFieldSubmitted();
                      },
                      validator: (String? value) {
                        if (!_options.contains(value)) {
                          return 'Nothing selected.';
                        }
                        return null;
                      },
                    );
                  },
              optionsViewBuilder:
                  (
                    BuildContext context,
                    AutocompleteOnSelected<String> onSelected,
                    Iterable<String> options,
                  ) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 4.0,
                        child: SizedBox(
                          height: 300.0,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String option = options.elementAt(index);
                              return ListTile(
                                title: Text(option),
                                onTap: () {
                                  onSelected(option);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
            ),
            const SizedBox(height: 16.0),
            Text('Selected: ${_autocompleteSelection ?? '(nothing yet)'}'),
          ],
        ),
      ),
    );
  }
}
