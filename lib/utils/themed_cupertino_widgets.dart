import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemedCupertinoWidgets {
  static Widget getProgressIndicator({bool? darkTheme}) {
    return Theme(
      data: ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: darkTheme != null
              ? darkTheme
                  ? Brightness.dark
                  : Brightness.light
              : Brightness.dark,
        ),
      ),
      child: const CupertinoActivityIndicator(
        animating: true,
        radius: 20.0,
      ),
    );
  }
}
