import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class SnackbarComponent {
  static void showErrorSnackbar({
    required BuildContext context,
    required message,
  }) {
    final snackbar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Failed',
        message: message,
        contentType: ContentType.failure,
        inMaterialBanner: false,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }

  static void showSuccesSnackbar({
    required BuildContext context,
    required message,
  }) {
    final snackbar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Success',
        message: message,
        contentType: ContentType.success,
        inMaterialBanner: false,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
