import 'dart:html' as html;

class UrlLauncher {
  static void launchURL(String url, String name) {
    html.window.open(url, name);
  }
}
