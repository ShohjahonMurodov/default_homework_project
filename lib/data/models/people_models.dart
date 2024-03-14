class PeopleModels {
  final int id;
  final String name;
  final String userName;
  final String state;
  final String avatarUrl;

  PeopleModels({
    required this.id,
    required this.name,
    required this.userName,
    required this.state,
    required this.avatarUrl,
  });

  factory PeopleModels.fromJson(Map<String, dynamic> json) {
    return PeopleModels(
      id: json["ud"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      userName: json["username"] as String? ?? "",
      state: json["state"] as String? ?? "",
      avatarUrl: json["avatar_url"] as String? ?? "",
    );
  }
}
