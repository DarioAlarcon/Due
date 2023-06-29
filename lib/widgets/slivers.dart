import 'package:due/listas/listasdeudore.dart';
import 'package:flutter/material.dart';

class SliverFunction extends StatelessWidget {
  const SliverFunction({super.key});

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
                title: Container(
                  margin: EdgeInsets.only(left: 10,right: 10, bottom: 10, top: 10),
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: const TextField(
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
                backgroundColor: Color(0xffBDF2F2),
                floating: true,
              ),
              SliverList(delegate: 
              SliverChildBuilderDelegate((context, index) {
                return deudores[index];
              },
              childCount: deudores.length
              )
              ),
              SliverToBoxAdapter(
              child: Container(
                height: 60.0, // Ajusta la altura del espacio deseado
              ),
            ),
            ],
          ),
        ),
      ],
    );
  }
}