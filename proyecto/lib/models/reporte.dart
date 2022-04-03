
//String reportesToJson(List<Reportes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reportes {
  Reportes({
    required this.idReporte,
    required this.motivo,
    required this.fecha,
    required this.descripcion,
    required this.direccion,
    required this.lugar,
  });

  final int idReporte;
  final String motivo;
  final DateTime fecha;
  final String descripcion;
  final String direccion;
  final String lugar;

  factory Reportes.fromJson(Map<String, dynamic> json) => Reportes(
        idReporte: json["idReporte"],
        motivo: json["motivo"],
        fecha: DateTime.parse(json["fecha"]),
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        lugar: json["lugar"],
      );

  String get fullMotivo => '$motivo $lugar';

  Map<String, dynamic> toJson() => {
        "idReporte": idReporte,
        "motivo": motivo,
        "fecha": fecha.toIso8601String(),
        "descripcion": descripcion,
        "direccion": direccion,
        "lugar": lugar,
      };
}
