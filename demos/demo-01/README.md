# demo-01

Repro for [flutter/flutter#181169](https://github.com/flutter/flutter/issues/181169),
fixed by [flutter/flutter#194721](https://github.com/flutter/flutter/pull/194721):
a nested scrollable at its parent's content origin auto scrolled selections that
started outside it. Scenario 1 is the issue's `TableView` layout (assertion in
debug builds); scenario 2 is the same wrong flag visible in every build mode.
