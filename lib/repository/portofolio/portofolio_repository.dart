import 'package:stomata_app/core/config/services/base_services.dart';
import 'package:stomata_app/core/config/services/endpoint.dart';
import 'package:stomata_app/core/config/services/model/base_response_model.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/repository/portofolio/response/portofolio_amount_response.dart';
import 'package:stomata_app/repository/portofolio/view/portofolio_amount_view_model.dart';

class PortofolioRepository extends BaseServices {
  Future<BaseResponseModel> getTotalAsset(String userId) async {
    try {
      var response = await getApi(
        endpoint: Endpoint.getUserPortofolioAmount(userId),
      );

      printLog("data: ${response.data}");

      BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(
        response.data,
      );

      if (baseResponseModel.data != null) {
        PortofolioAmountResponse portoResponse =
            PortofolioAmountResponse.fromJson(baseResponseModel.data);

        PortofolioAmountViewModel portoViewModel = PortofolioAmountViewModel();
        portoViewModel.amount = portoResponse.amount;
        portoViewModel.returnAmount = portoResponse.returnAmount;
        portoViewModel.percentage = portoResponse.percentage;
        portoViewModel.userId = portoResponse.userId;
        portoViewModel.totalInvested = portoResponse.totalInvested;
        portoViewModel.totalProfit = portoResponse.totalProfit;

        baseResponseModel.data = portoViewModel;

        return baseResponseModel;
      } else {
        return baseResponseModel;
      }
    } catch (e) {
      printLog("error : $e");
      rethrow;
    }
  }
}
