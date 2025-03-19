import 'package:flutter/material.dart';
import 'package:toxica_2/domain/entities/message.dart';
import 'package:toxica_2/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier{
  final List<Message> messages = [
    Message(fromWho: FromWho.me, text: "quieres tacos?"),
    Message(imageUrl: 'https://yesno.wtf/assets/no/8-5e08abbe5aacd2cf531948145b787e9a.gif', fromWho: FromWho.hers, text: "Nel")
  ];
  
  Future<void> herReply() async{
    final herMessage = await GetYesNoAnswer().GetAnswer();
    messages.add(herMessage);
    notifyListeners();
  }
  Future<void> sendMessage(String message) async{
    messages.add(Message(text: message,fromWho:FromWho.me));
    notifyListeners();
  }
}