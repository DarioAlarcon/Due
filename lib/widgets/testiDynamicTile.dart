import 'package:due/models/deudor.dart';
import 'package:due/widgets/dropdown.dart';
import 'package:due/widgets/slideshow.dart';
import 'package:due/widgets/deudorTile.dart';
import 'package:flutter/material.dart';

import 'slivers.dart';

class dynamicDeudorTile extends StatefulWidget {
  const dynamicDeudorTile({super.key, required this.name, required this.mount, required this.cambio});
  final String name;
  final double mount;
  final VoidCallback cambio;
  @override
  State<dynamicDeudorTile> createState() => _dynamicTileSDeudorTile();
}

class _dynamicTileSDeudorTile extends State<dynamicDeudorTile>with SingleTickerProviderStateMixin {
  
  
  double _height = 0.0;
  bool _isExpanded = false;
  bool get expanded => _isExpanded;
  

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
      _height = _isExpanded ? 190.0 : 0.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DeudorTile( expanded: expanded, name: widget.name, mount: widget.mount, toggleContainer: _toggleContainer, ),
          AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: double.infinity,
              constraints: BoxConstraints(
                    maxWidth: 450.0, // Establece el ancho máximo
              ),
              height: _height,
              margin: EdgeInsets.only(bottom: 0, left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.9,
                  color: Color(0xff262626)
                ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)
              )
              ),
              child: SingleChildScrollView(

                child: Container(
                  height: 185,
                  child: SlidesShow(slides: [
                    AbonoTarget(
                      toggleContainer:_toggleContainer, 
                      name: widget.name, 
                      cambio: widget.cambio, ),
                    AdeudoTarget(
                      toggleContainer:_toggleContainer, 
                      name: widget.name, 
                      cambio: widget.cambio,
                    )
                  ]
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class AbonoTarget extends StatelessWidget {
  final _numberController = TextEditingController();
  final String name;
  final VoidCallback cambio;
   AbonoTarget({
    
    super.key, required this.toggleContainer, required this.name, required this.cambio,
  });

  final VoidCallback toggleContainer;
  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('El cliente pagó todo?',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width<330? 12.5: 16,
                  color: Color(0xff262626)
                ),
                ),
                ElevatedButton(
                  onPressed:(){
                    eliminarDeudorr(name);
                    eliminarDeudor(name);
                    toggleContainer();
                    cambio();
                  }, 
                  child: 
                        Text('borrar cuenta',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width<330? 12.5:16,
                            color: Colors.white
                          ),
                        ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 45),
                    surfaceTintColor: Color(0xff262626),
                    backgroundColor: Color(0xff262626),
                    elevation:   1,   
                    shadowColor:   Color(0xffBDF2F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    )               
                  ) 
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('El cliente abonó?',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width<330? 12.5:16,
                  color: Color(0xff262626)
                ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 130,
                  height: 35,
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xffBDF2F2),
                  ),
                  child: TextField(
                    controller: _numberController,
                    cursorHeight: 15,
                    keyboardType: TextInputType.number, 
                    cursorColor: Color(0xff262626),
                    decoration: InputDecoration(
                    hintText: "cantidad",
                    enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent), // Cambia el color aquí
                    ),
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    double resta;  
                    resta = double.tryParse(_numberController.text)??0;
                    restarMonto(name, resta);
                    cambio();
                    toggleContainer();
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff262626)
                    ),
                    child: Icon(Icons.send, size: 15, color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class AdeudoTarget extends StatefulWidget {
  final String name;
  final VoidCallback cambio;
  final VoidCallback toggleContainer;
  AdeudoTarget({
    super.key, required this.name, required this.cambio, required this.toggleContainer,
  });

  @override
  State<AdeudoTarget> createState() => _AdeudoTargetState();
}

class _AdeudoTargetState extends State<AdeudoTarget> {
  final _numberController = TextEditingController();

  final _numberController2 = TextEditingController();
  double valueFromChild = 0;
  
  double val = 0;
  void valueChange(double value){
    setState(() {
      valueFromChild = value;
    });
  }
  late double cantidad;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Elije',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width<330? 12.5:16,
                  color: Color(0xff262626)
                ),
                ),
                Container(
                  height: 40,
                  width: 132,
                  child: dropdown(callback: valueChange )
                  
                ),
                 Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.only(left: 5, ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                    border: Border.all(color: Colors.lightBlueAccent)
                 
                  ),
                  child: TextField(
                    onChanged: parseo,
                    controller: _numberController2,
                    keyboardType: TextInputType.number, 
                    cursorHeight:25,
                    cursorColor: Color(0xff262626),
                    decoration: InputDecoration(
                    hintText: "can",
                    enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent), // Cambia el color aquí
                    ),
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    sumarMonto(widget.name, valueFromChild*val);
                    widget.cambio();
                    widget.toggleContainer();
                    _numberController2.clear();
                    valueFromChild =0;
                    
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff262626)
                    ),
                    child: Icon(Icons.send, size: 15, color: Colors.white,),
                  ),
                )
              ],
            ),
            Container(
              child:valueFromChild ==0?SizedBox(): Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 50),
                    alignment: Alignment.centerRight,
                    height: 20,
                    child: Text(
                      'total:${valueFromChild*val} \$',
                      
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('otro monto?',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width<330? 12.5:16,
                  color: Color(0xff262626)
                ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 35,
                  padding: EdgeInsets.only(left: 10, ),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xffBDF2F2),
                  ),
                  child: TextField(
                    controller: _numberController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,     
                    cursorHeight: 25,
                    cursorColor: Color(0xff262626),
                    decoration: InputDecoration(
                    hintText: "cantidad",
                    enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent), // Cambia el color aquí
                    ),
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    double suma;
                    suma = double.tryParse(_numberController.text)??0;
                    sumarMonto(widget.name, suma);
                    widget.cambio();
                    widget.toggleContainer();
                    _numberController.clear();
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff262626)
                    ),
                    child: Icon(Icons.send, size: 15, color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  void parseo(String texto){
    setState(() {
      val = double.tryParse(_numberController2.text)??0;
      print(val);
    });
  }

}
