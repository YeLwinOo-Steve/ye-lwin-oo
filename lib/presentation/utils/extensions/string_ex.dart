import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringEx on String {
  Size textSize({
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: this, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  String prefixZero() {
    return '0$this';
  }

  String prefixHash(){
    return """#   $this""";
  }
  String prefixDash(){
    return """-   $this""";
  }

  String prefixLink(){
    return """🔗   $this""";
  }

  String prefixSlash(){
    return """/   $this""";
  }

  String addDoubleQuote() {
    return "“$this”";
  }

  void launchWebsite() async {
    Uri url = Uri.parse(this);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        webOnlyWindowName: this,
      );
    } else {
      throw Exception('Could not launch $this');
    }
  }

  void launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: this,
      query: _encodeQueryParameters(<String, String>{
        'subject': 'I have a freelance job offer!',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
