import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/project/project_detail_screen.dart';
import 'package:stomata_app/repository/global_query_param/pagination_query.dart';
import 'package:stomata_app/repository/project/project_repository.dart';
import 'package:stomata_app/repository/project/view/list/project_item_view_model.dart';
import 'package:stomata_app/repository/project/view/list/project_list_view_model.dart';

class ProjectController extends GetxController {
  BuildContext? context;

  RxBool loadingProject = false.obs;
  int page = 1;
  int limit = 10;

  RxList<ProjectItemViewModel> listProjects = <ProjectItemViewModel>[].obs;

  ProjectController({required this.context});

  @override
  void onInit() {
    getAllProject(context);
    super.onInit();
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

  void goToDetail(ProjectItemViewModel data) {
    Get.to(() => ProjectDetailScreen(projectData: data));
  }
}
