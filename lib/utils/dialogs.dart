import 'package:converse_hub/constants/consts.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackbar(BuildContext context, String mg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mg),
      backgroundColor: snackBarColor,
      behavior: SnackBarBehavior.floating,
    ));
  }

  static void progressBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Center(child: CircularProgressIndicator()));
  }
}
