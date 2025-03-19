
import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget{
  final void Function(String) onValue;
   const MessageFieldBox({super.key, required this.onValue});
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final colors = Theme.of(context).colorScheme;
    final FocusNode focusNode = FocusNode();
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: customInputDecoration(
        colors: colors,
        onPressed: (){
          final textValue = textController.value.text;
          if(textValue.isNotEmpty){
            final textValue = textController.value.text;
              if (textValue.isNotEmpty) {
                onValue(textValue);
                textController.clear();
                focusNode.requestFocus();
              }
          }
          print('Se submitio');
        }),
      onFieldSubmitted: (value){
        if (value.isNotEmpty) {
                onValue(value);
                textController.clear();
              }
      },
      onChanged: (value){
        print('aqui change');
      },
      onTapOutside: (event){
        focusNode.unfocus();
      },
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

InputDecoration customInputDecoration({required ColorScheme colors, required VoidCallback onPressed})=>
  InputDecoration(
        enabledBorder: customOutlineInputBorder(colors.primary),
        focusedBorder: customOutlineInputBorder(colors.primary),
        hintText: 'Escribe tu mensaje',
        filled: true,
        suffixIcon: IconButton(icon: Icon(Icons.send_and_archive_outlined),onPressed: onPressed,)
      );

OutlineInputBorder customOutlineInputBorder(Color color)=>
  OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: BorderRadius.circular(20));