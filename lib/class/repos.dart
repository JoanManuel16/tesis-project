class Repo {
  String name;
  String htmlURL;

  Repo({this.name = '', this.htmlURL = ''});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(name: json['name'], htmlURL: json['html_url']);
  }
}

class All {
  List<Repo>? repos;
  All({this.repos});
  factory All.fromJson(List<dynamic> json) {
    List<Repo> repos = List.empty(growable: true);
    repos = json.map((r) => Repo.fromJson(r)).toList();
    return All(repos: repos);
  }
}
