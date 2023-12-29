import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'hola', fromWho: FromWho.me),
    Message(text: 'hola causa', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {}
}
