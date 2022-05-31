import 'package:clean_architechture/app/app.dart';
import 'package:clean_architechture/app/managers/constant_manager.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static void get hideLoadingDialog {
    if (_dialogIsVisible(NavigationUtil.currentContext!)) {
      Navigator.of(NavigationUtil.currentContext!).pop();
    }
  }

  static bool _dialogIsVisible(BuildContext context) {
    bool isVisible = false;
    Navigator.popUntil(context, (route) {
      isVisible = route is PopupRoute;
      return !isVisible;
    });
    return isVisible;
  }

  static void showLoadingDialog(BuildContext context) {
    final alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: PaddingManager.p16),
              child: const Text("Loading...")),
        ],
      ),
    );
    if (!_dialogIsVisible(NavigationUtil.currentContext!)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
