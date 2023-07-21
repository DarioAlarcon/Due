
import 'package:due/models/deudor.dart';
import 'package:flutter/material.dart';

class AddClient_content extends StatefulWidget {
  const AddClient_content({Key? key, required this.callback}) : super(key: key);
  final VoidCallback callback;
  @override
  State<AddClient_content> createState() => _AddClient_contentState();
}

class _AddClient_contentState extends State<AddClient_content> {
  final _montoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
  final _nombreController = new TextEditingController();
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
                      child:  TextField(
                        controller: _nombreController,
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
                  child:  TextField(
                    controller: _montoController,
                    keyboardType: TextInputType.number,
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
                    onPressed: () { 
                      double mont =double.tryParse(_montoController.text)??0;
                      setState(() {
                      agregardeudor(_nombreController.text, mont);
                      });
                      print(deudores.length);
                      widget.callback();
                      Navigator.pop(context);

                      },
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

