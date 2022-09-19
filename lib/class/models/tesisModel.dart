class TesisModel {
  String name = '';
  String htmlURL = '';
  String description = '';
  String institucion = '';
  String facultad = '';
  String carrera = '';
  List<String> autores = [];
  List<String> tutores = [];
  String fecha = '';
  String resumen = '';

  TesisModel({String name = '', String htmlURL = '', String description = ''}) {
    this.name = name;
    this.htmlURL = htmlURL;
    this.description = description;

    String opciones = description;
    opciones.split("#");
    institucion = opciones[2];
    facultad = opciones[3];
    carrera = opciones[4];
    String aut = opciones[5];
    String tut = opciones[6];
    fecha = opciones[7];
    resumen = opciones[8];

    autores = aut.split('\n');
    tutores = tut.split('\n');
  }

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
