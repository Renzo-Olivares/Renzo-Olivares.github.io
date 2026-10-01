import 'package:material_ui/material_ui.dart';

// Repro for https://github.com/flutter/flutter/issues/188874, fixed by
// https://github.com/flutter/flutter/pull/192664.
//
// 'Test Text' wraps after 'Test ', so offset 5 is both the end of line 1 and
// the start of line 2. With the default downstream affinity it means line 2,
// but web used to answer with line 1.

void main() {
  runApp(const MaterialApp(home: Scaffold(body: Center(child: LineBoundary()))));
}

class LineBoundary extends StatelessWidget {
  const LineBoundary({super.key});

  @override
  Widget build(BuildContext context) {
    final TextSpan text = TextSpan(
      text: 'Test Text',
      style: DefaultTextStyle.of(context).style.copyWith(fontSize: 48),
    );
    final TextPainter painter = TextPainter(text: text, textDirection: TextDirection.ltr)
      ..layout();
    // One pixel too narrow for a single line, which forces the soft wrap.
    final double width = painter.width - 1;
    painter.layout(maxWidth: width);
    final TextRange line = painter.getLineBoundary(const TextPosition(offset: 5));
    painter.dispose();

    final bool correct = line == const TextRange(start: 5, end: 9);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(width: width, child: Text.rich(text)),
        const SizedBox(height: 24),
        Text('getLineBoundary(offset: 5) returns ${line.start}..${line.end}'),
        Text(
          correct ? 'Line 2: correct' : 'Line 1: wrong',
          style: TextStyle(fontSize: 24, color: correct ? Colors.green : Colors.red),
        ),
      ],
    );
  }
}
