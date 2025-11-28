import 'package:flutter/material.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';

class CSlidingUpPanel extends StatelessWidget {
  final Widget panel;
  final Widget body;
  final double minHeight;
  final double maxHeight;
  const CSlidingUpPanel({
    super.key,
    required this.panel,
    required this.body,
    this.minHeight = 100.0,
    this.maxHeight = 500.0,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      color: ColorUtils.secondaryBgColors,
      minHeight: minHeight,
      maxHeight: maxHeight,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      panelBuilder: () => panel,
      body: body,
    );
  }
}
