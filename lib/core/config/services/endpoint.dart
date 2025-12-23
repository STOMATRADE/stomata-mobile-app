class Endpoint {
  static const String getOngoingProject = "/";
  static const String login = "/auth/verify";

  static getUserTotal(String userId) {
    return "/user-dashboard/$userId/total";
  }
}
