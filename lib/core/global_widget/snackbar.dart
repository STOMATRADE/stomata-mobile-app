import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';

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
        color: ColorUtils.secondaryColors,
        message: message,
        contentType: ContentType.success,
        inMaterialBanner: false,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }

  static void showWarningSnackbar({
    required BuildContext context,
    required message,
  }) {
    final snackbar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Sorry',
        color: ColorUtils.fourGreenColors,
        message: message,
        contentType: ContentType.warning,
        inMaterialBanner: false,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
