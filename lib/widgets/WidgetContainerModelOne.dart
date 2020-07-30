import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class WidgetContainerModelOne extends StatelessWidget {
  final String konten;

  WidgetContainerModelOne({this.konten});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Markdown(
        data: konten,
      ),
    );
  }
}
