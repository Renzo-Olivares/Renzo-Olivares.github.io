# demo-194826

Repro for [flutter/flutter#185614](https://github.com/flutter/flutter/issues/185614),
fixed by [flutter/flutter#194826](https://github.com/flutter/flutter/pull/194826):
on web, clicking an option of a `RawAutocomplete` inside a `SelectionArea` closed
the options without selecting anything, because the `SelectionArea` unfocused
itself on the pointer down and took the field's focus with it. The demo is the
issue's sample plus a "Selected:" line; the comment in `lib/main.dart` lists the
two things to try.
