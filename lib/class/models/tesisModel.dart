class TesisModel {
  String name;
  String htmlURL;
  String description;
  TesisModel({this.name = '', this.htmlURL = '', this.description = ''});

  factory TesisModel.fromJson(Map<String, dynamic> json) {
    return TesisModel(
        name: json['name'],
        htmlURL: json['html_url'],
        description: json['description']);
  }
}

class All {
  List<TesisModel>? repos;
  All({this.repos});
  factory All.fromJson(List<dynamic> json) {
    List<TesisModel> repos = List.empty(growable: true);
    repos = json.map((r) => TesisModel.fromJson(r)).toList();
    return All(repos: repos);
  }
}
