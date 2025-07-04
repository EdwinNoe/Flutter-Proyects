class Avion {
  int id;
  String imagen;
  String origen;
  String destino;
  String tipoAvion;
  int numeroAsientos;
  int numeroBanos;
  String tipoSnacks;
  String duracionVuelo;
  double cargosPorServicio;
  double precio;
  double isv;

  Avion({
    required this.id,
    required this.imagen,
    required this.origen,
    required this.destino,
    required this.tipoAvion,
    required this.numeroAsientos,
    required this.numeroBanos,
    required this.tipoSnacks,
    required this.duracionVuelo,
    required this.cargosPorServicio,
    required this.precio,
    required this.isv,
  });
}
