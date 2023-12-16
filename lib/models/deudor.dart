import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Deudor {
   String nombre;
   double monto;

Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'monto': monto,
    };
  }

factory Deudor.fromMap(Map<String, dynamic> map) {
    return Deudor(
       map['nombre'],
      map['monto'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());
  factory Deudor.fromJson(String source) => Deudor.fromMap(json.decode(source));

  Deudor(this.nombre, this.monto);
}

List<Deudor> deudores=[];

void agregardeudor(String nombre,double monto){
  Deudor nuevo= Deudor(nombre, monto);
  deudores.add(nuevo);
  guardarLista(deudores);
}

void eliminarDeudor(String nombre) {
  deudores.removeWhere((deudor) => deudor.nombre == nombre);
  guardarLista(deudores);
}


void restarMonto(String nombre, double nuevoMonto) {
  Deudor deudor = deudores.firstWhere((deudor) => deudor.nombre == nombre);
  deudor.monto = deudor.monto- nuevoMonto;
  if (deudor.monto == 0 || deudor.monto<0) {
    eliminarDeudor(nombre);
  }
  guardarLista(deudores);
}

void sumarMonto(String nombre, double nuevoMonto) {
  Deudor deudor = deudores.firstWhere((deudor) => deudor.nombre == nombre);
  deudor.monto = deudor.monto+ nuevoMonto;
  guardarLista(deudores);
}

void guardarLista(List<Deudor> lista) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> listaJson = lista.map((objeto) => objeto.toJson()).toList();
  await prefs.setStringList('mi_lista', listaJson);
}

Future<void> recuperarLista() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> listaJson = prefs.getStringList('mi_lista') ?? [];
  deudores= listaJson.map((json) => Deudor.fromJson(json)).toList();
}