class Endpoint {
  static const String getOngoingProject = "/";
  static const String login = "/auth/verify";
  static const String ongoingProject = "/projects/ongoing";

  static getUserPortofolioAmount(String userId) {
    return "/user-dashboard/$userId/assets";
  }

  static getSourceOfFundEndpoint(String userId) {
    return "/user-dashboard/$userId/cash";
  }
}
