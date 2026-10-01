# Flutter before/after demos

Live web demos for Flutter pull requests. Each demo is one small app built
twice, against Flutter before and after a change, and published to GitHub
Pages:

    https://renzo-olivares.github.io/<demo>/before/
    https://renzo-olivares.github.io/<demo>/after/

The demo app's code is identical in both. Only the Flutter commit differs.

## Publishing a demo

1. Scaffold the app, write the repro in `lib/main.dart`, and push it to `main`:

       tool/new_demo.sh            # creates demos/demo-NN, or pass a name

2. Run the workflow, from the Actions tab or with:

       gh workflow run publish-demo.yml -f demo=demo-01 -f after=192664

   The run summary has the two links to paste into the PR description.

Running the workflow again for the same demo replaces that demo. Everything
else on the site is left as published.

### Choosing the Flutter commits

`after` (required) and `before` (optional) each take any of:

| Input | Meaning |
| --- | --- |
| `192664`, `#192664`, or a PR URL | A flutter/flutter PR: its head commit while open, its merge commit once merged |
| `owner:branch` | A branch on a fork |
| anything else | A SHA, branch, or tag in flutter/flutter |

Refs are resolved to commit SHAs when the workflow starts, so a published demo
always corresponds to exact commits. They are listed on the site's index page.

Without `before`, the baseline is the commit `after` forked from master, or
its parent if `after` is itself a commit on master. Either way the two builds
differ by exactly the change being demonstrated.

`build_args` is passed through to `flutter build web`, e.g. `--wasm`.

### Changes to the engine

Nothing here compiles the engine. Flutter downloads a prebuilt one, so a
commit that changes `engine/` can only be built once Flutter's CI has built it:

- Commits on master always work.
- A PR's head commit works once the PR's engine presubmit builds have finished.
  For an engine PR that means opening the PR first, then publishing the demo
  and adding the links to the description.
- A fork commit that changes the engine and has no PR can't be built.

Commits that only change the framework have none of these restrictions.

## Building locally

    tool/build_demo.sh <demo> <flutter-sha> <base-href> <out-dir>

does what one CI build job does, for example:

    eval "$(tool/resolve_refs.sh 192664)"
    tool/build_demo.sh example "$before" /example/before/ /tmp/site/example/before
    tool/build_demo.sh example "$after" /example/after/ /tmp/site/example/after
    python3 -m http.server -d /tmp/site

## Layout

    .github/workflows/publish-demo.yml   resolve refs, build twice, publish
    demos/<demo>/                        demo app sources
    tool/new_demo.sh                     scaffold a demo
    tool/resolve_refs.sh                 Flutter refs to commit SHAs
    tool/build_demo.sh                   one build against one Flutter commit
    tool/generate_index.py               the site's index page

The `gh-pages` branch holds the published site and is only written by the
workflow:

    index.html
    <demo>/demo.json                     the two Flutter commits
    <demo>/before/
    <demo>/after/

## Notes

- A demo's `pubspec.yaml` needs a Dart SDK constraint that the older of the two
  Flutter commits satisfies. `tool/new_demo.sh` sets it to the current Dart
  minor version. Lower it if the `before` build fails to resolve packages.
- GitHub Pages can't send the COOP/COEP headers that multi-threaded skwasm
  needs. `--wasm` builds still work: skwasm falls back to a single thread.
- Pages sites are limited to 1 GB. A build is about 3 MB when CanvasKit can be
  loaded from Google's CDN, which is the case for any engine built from master,
  and about 19 MB when it has to be bundled, which is the case for an open PR
  that changes the engine.
