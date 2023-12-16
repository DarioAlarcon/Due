
import 'package:due/widgets/testiDynamicTile.dart';
import 'package:flutter/material.dart';

import '../models/deudor.dart';

class SliverFunction extends StatefulWidget {
   SliverFunction({super.key});

  @override
  State<SliverFunction> createState() => _SliverFunctionState();
}

class _SliverFunctionState extends State<SliverFunction> {
  void addItemToList() {
    setState(() {
    });
  }
  

  void filterList(String searchText) {
    setState(() {
      filteredList = deudores
          .where((item) =>
              item.nombre.contains(searchText))
          .toList();
    });
  }

  @override
  void initState() {
    deudores;
    filteredList = deudores;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        
        Center(
          child: Container(
            height: 110,
            padding: EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Center(
              child: Text(
                'Mis clientes', 
                style: TextStyle(
                  color: Color(0xff262626), 
                  fontSize: 35, fontWeight: FontWeight.w500
                ),
              )
            )
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                scrolledUnderElevation: 0,
                title: Center(
                  child: Container(
                    constraints:  BoxConstraints(
                                    maxWidth: 450.0, 
                                  ),
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10, 
                      bottom: 10, 
                      top: 10),
                    width: double.infinity,
                    height: 40,
                    
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child:  TextField(onChanged: (value) {
                        filterList(value);
                    },
                    cursorColor: Color(0xffBDF2F2),
                    decoration: InputDecoration(
                      hintText: "Buscar",
                      prefixIconColor: Colors.grey,
                      prefixIcon: Icon(Icons.search),
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
                backgroundColor: Color(0xffBDF2F2),
                floating: true,
              ),
              SliverList( 
              delegate: SliverChildBuilderDelegate((context, index) {
                return dynamicDeudorTile(
                  name: filteredList[index].nombre, 
                  mount: filteredList[index].monto, 
                  cambio: addItemToList,
                );
              },
              childCount: filteredList.length
              ),
              ),
              SliverToBoxAdapter(
              child: Container(
                height: 60.0, 
              ),
            ),
            ],
          ),
        ),
      ],
    );
  }
  
}
 List<Deudor> filteredList = [];
 
void eliminarDeudorr(String nombre) {
  filteredList.removeWhere((deudor) => deudor.nombre == nombre);
}
