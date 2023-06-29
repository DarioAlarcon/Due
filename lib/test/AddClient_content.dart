import 'package:flutter/material.dart';

class AddClient_content extends StatelessWidget {
  const AddClient_content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: SingleChildScrollView(
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Center(
        
                child: Container(child: Text('Añadir cliente',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500, color: Color(0xff262626))))
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
                        hintText: "Nombre",
                        prefixIconColor: Colors.grey,
                        prefixIcon: Icon(Icons.person_outline),
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

