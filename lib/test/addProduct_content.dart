import 'package:flutter/material.dart';

class Addproduct_content extends StatelessWidget {
  const Addproduct_content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Center(child: Text('Añadir Producto',textAlign: TextAlign.center,style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500, color: Color(0xff262626)))),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: const TextField(
                        cursorColor: Color.fromARGB(255, 69, 246, 246),
                        decoration: InputDecoration(
                        hintText: "Producto",
                        prefixIconColor: Colors.grey,
                        prefixIcon: Icon(Icons.dock_outlined),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Cambia el color aquí
                        ),
                        focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
                  ),
                  ),
                  
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: const TextField(
                    cursorColor: Color.fromARGB(255, 69, 246, 246),
                    decoration: InputDecoration(
                      hintText: "Monto",
                      prefixIconColor: Colors.grey,
                      prefixIcon: Icon(Icons.monetization_on_outlined),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent), // Cambia el color aquí
                      ),
                      focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff262626)),
                    ),
                    onPressed: () {  },
                    child: Text('Añadir', style: TextStyle(color: Colors.white),)
                    ),
                ),
              )
            ],
          ),
        ),
      ),
      );
  }
}