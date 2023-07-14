import 'dart:ui';

import 'package:flutter/material.dart';

class AppDialog {
  final String? title;
  final Widget content;
  final BuildContext buildContext;
  final bool showActions;

  AppDialog({
    this.title,
    required this.content,
    required this.buildContext,
    this.showActions = true,
  });

  showAppDialog() {
    showGeneralDialog(
      context: buildContext,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black38,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: FadeTransition(
          opacity: anim1,
          child: child,
        ),
      ),
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialog(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          title: title != null
              ? Center(
                  child: Text(
                    title!,
                  ),
                )
              : null,
          content: content,
          actions: showActions
              ? <Widget>[
                  TextButton(
                    onPressed: () => {
                      Navigator.pop(
                        buildContext,
                      ),
                    },
                    child: const Text(
                      "Ok",
                    ),
                  )
                ]
              : null,
        );
      },
    );
  }
}
