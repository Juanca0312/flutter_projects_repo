import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with ?',
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('boton $textValue');
            textController.clear();
          },
        ),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder);

    return TextFormField(
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('submit');
        textController.clear();
        focusNode.requestFocus();
      },
      controller: textController,
      onTapOutside: (event) => focusNode.unfocus(),
    );
  }
}
