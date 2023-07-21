
class Deudor {
   String nombre;
   double monto;

  Deudor(this.nombre, this.monto);
}

List<Deudor> deudores=[
    Deudor('Dario', 10000),
    Deudor('maria', 5000),
    Deudor('carlos', 20000),
    Deudor('jose', 15000),
    Deudor('julian', 500),
    
];

void agregardeudor(String nombre,double monto){
  Deudor nuevo= Deudor(nombre, monto);
  deudores.add(nuevo);
}

void eliminarDeudor(String nombre) {
  deudores.removeWhere((deudor) => deudor.nombre == nombre);
}


void restarMonto(String nombre, double nuevoMonto) {
  Deudor deudor = deudores.firstWhere((deudor) => deudor.nombre == nombre);
  deudor.monto = deudor.monto- nuevoMonto;
  if (deudor.monto == 0 || deudor.monto<0) {
    eliminarDeudor(nombre);
  }
}

void sumarMonto(String nombre, double nuevoMonto) {
  Deudor deudor = deudores.firstWhere((deudor) => deudor.nombre == nombre);
  deudor.monto = deudor.monto+ nuevoMonto;
  
}