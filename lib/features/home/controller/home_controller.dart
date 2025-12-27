import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/project/project_detail_screen.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:stomata_app/repository/global_query_param/pagination_query.dart';
import 'package:stomata_app/repository/portofolio/portofolio_repository.dart';
import 'package:stomata_app/repository/portofolio/view/amount/portofolio_amount_view_model.dart';
import 'package:stomata_app/repository/project/project_repository.dart';
import 'package:stomata_app/repository/project/view/list/project_item_view_model.dart';
import 'package:stomata_app/repository/project/view/list/project_list_view_model.dart';
import 'package:stomata_app/repository/source_of_fund/source_of_fund_repository.dart';
import 'package:stomata_app/repository/source_of_fund/view/sof_view_model.dart';

class HomeController extends GetxController with CacheManager {
  BuildContext? context;

  RxInt totalAsset = 0.obs;
  RxInt totalCash = 0.obs;
  RxInt totalReturn = 0.obs;
  RxString percentage = "0".obs;

  RxBool loadingAsset = false.obs;
  RxBool loadingCash = false.obs;
  RxBool loadingProject = false.obs;

  RxList<ProjectItemViewModel> listProjects = <ProjectItemViewModel>[].obs;

  int page = 1;
  int limit = 10;

  ScrollController scrollController = ScrollController();

  HomeController({required this.context});

  @override
  void onInit() {
    getAsset(context);
    getSofData(context);
    getAllProject(context);
    super.onInit();
  }

  void getAsset(context) async {
    try {
      loadingAsset.value = true;
      UserViewModel userData = await getLoginData();

      var response = await PortofolioRepository().getTotalAsset(
        userData.id ?? "",
      );

      if (response.header.statusCode == 200) {
        loadingAsset.value = false;
        PortofolioAmountViewModel assetData = response.data;
        totalAsset.value = int.parse(assetData.amount ?? "0");
        totalReturn.value = int.parse(assetData.returnAmount ?? "0");
        percentage.value = assetData.percentage.toString();
      } else {
        loadingAsset.value = false;
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }
    } catch (e) {
      loadingAsset.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void getSofData(context) async {
    try {
      loadingCash.value = true;
      UserViewModel userData = await getLoginData();

      var response = await SourceOfFundRepository().getSourceOfFund(
        userData.id ?? "",
      );

      if (response.header.statusCode == 200) {
        loadingCash.value = false;
        SofViewModel sofData = response.data;
        totalCash.value = int.parse(sofData.amount ?? "0");
      } else {
        loadingCash.value = false;
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }
    } catch (e) {
      loadingCash.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void getAllProject(context) async {
    try {
      loadingProject.value = true;

      PaginationQuery query = PaginationQuery()
        ..limit = limit
        ..page = page;

      var response = await ProjectRepository().getOngoingProjects(query);

      loadingProject.value = false;
      if (response.header.statusCode == 200) {
        ProjectListViewModel projectListData = response.data;

        listProjects.addAll(projectListData.items ?? []);

        printLog("list project: $listProjects");
      } else {
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }

      page++;
    } catch (e) {
      loadingProject.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void goToDetail() {
    Get.to(() => ProjectDetailScreen());
  }
}
