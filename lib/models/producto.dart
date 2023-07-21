class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);
}

List<Producto> productos=[
  Producto("boli", 1500),
  Producto("hielo", 300),
  Producto("Agua 5l", 2500),
  Producto("salchipapa", 10000),
  Producto("hamburguesa", 9000)
];
void agregarProducto(String nombre,double precio){
  Producto nuevo= Producto(nombre, precio);
  productos.add(nuevo);
}

void eliminarProducto(String nombre) {
  productos.removeWhere((producto) => producto.nombre == nombre);
}