class Endpoint {
  static const String getOngoingProject = "/";
  static const String login = "/auth/verify";
  static const String ongoingProject = "/projects/ongoing";

  static projectDetail(String projectId) {
    return "/projects/$projectId/detail";
  }

  static getUserPortofolioAmount(String userId) {
    return "/user-dashboard/$userId/assets";
  }

  static getUserPortoSummary(String userId) {
    return "/portfolios/user/$userId";
  }

  static getSourceOfFundEndpoint(String userId) {
    return "/user-dashboard/$userId/cash";
  }
}
