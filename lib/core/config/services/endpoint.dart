class Endpoint {
  static const String getOngoingProject = "/";
  static const String login = "/auth/verify";

  static getUserPortofolioAmount(String userId) {
    return "/user-dashboard/$userId/assets";
  }
}
