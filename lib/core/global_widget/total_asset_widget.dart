import 'package:flutter/widgets.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';

class TotalAssetWidget extends StatelessWidget {
  final int totalAmount;
  final int totalReturn;
  final String percentageReturn;
  const TotalAssetWidget({
    super.key,
    required this.totalAmount,
    required this.totalReturn,
    required this.percentageReturn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CText(
          text: "Total Portofolio",
          fontSize: 12,
          textColor: ColorUtils.white,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.network(
                    "https://s3.ap-southeast-1.amazonaws.com/static.pintu.co.id/assets/images/logo/IDRX+-+IDRX.png",
                    scale: 30,
                  ),
                  const SizedBox(width: 8),
                  CText(
                    text: Helpers.formatAmount(totalAmount),
                    fontSize: 20,
                    textColor: ColorUtils.white,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            CText(
              text: "IDRX",
              fontSize: 20,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            CText(text: "Return", fontSize: 12, textColor: ColorUtils.white),
            const SizedBox(width: 5),
            CText(
              text:
                  "+${Helpers.formatAmount(totalReturn)} (+$percentageReturn%)",
              fontSize: 12,
              textColor: ColorUtils.primaryColors,
            ),
          ],
        ),
      ],
    );
  }
}
