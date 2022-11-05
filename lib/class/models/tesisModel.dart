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
    var opc = opciones.split("#");
    var temp = opc[2].split(":");
    institucion = temp[1];
    temp = opc[2].split(":");
    facultad = temp[1];
    temp = opc[3].split(":");
    carrera = temp[1];
    temp = opc[4].split(":");
    String aut = opc[5];
    String tut = opc[6];
    temp = opc[7].split(":");
    fecha = temp[1];
    temp = opc[8].split(":");
    resumen = temp[1];

    autores = aut.split(';');
    var fAutor = autores[0].split(": ");
    autores[0] = fAutor[1];
    tutores = tut.split(';');
    var fTutor = tutores[0].split(": ");
    tutores[0] = fTutor[1];
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
