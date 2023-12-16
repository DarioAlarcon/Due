import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:due/models/producto.dart';
import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {
  const dropdown({super.key, required this.callback});
  final Function(double) callback;
  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
 
 final TextEditingController textEditingController = TextEditingController();

@override
void dispose() {
  textEditingController.dispose();
  super.dispose();
}

void performDefaultAction() {
    setState(() {
      selectedValue = null;
    });
  }
Producto? selectedValue;


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: DropdownButtonHideUnderline(
      child: DropdownButton2<Producto>(
        isExpanded: true,
        hint: Text(
          'Producto',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: productos
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.nombre+'\n${item.precio}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
            if (value!=null) {
             print(value.nombre); 
             widget.callback(value.precio);
            }
          });
        },
        buttonStyleData:  ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 147,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.lightBlueAccent)
          )
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
          elevation: 2,
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)
            )
          )
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 45,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              cursorColor: Colors.lightBlueAccent,
              maxLines: null,
              controller: textEditingController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'buscar producto',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            
            return item.value!.nombre.toString().contains(searchValue);
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    ),
  );
}
}