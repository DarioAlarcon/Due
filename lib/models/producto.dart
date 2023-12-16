class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);
}

List<Producto> productos=[
  
];
void agregarProducto(String nombre,double precio){
  Producto nuevo= Producto(nombre, precio);
  productos.add(nuevo);
}

void eliminarProducto(String nombre) {
  productos.removeWhere((producto) => producto.nombre == nombre);
}