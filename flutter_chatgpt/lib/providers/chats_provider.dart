import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/services/api_service.dart';
import '../models/chat_model.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelID}) async {
    chatList.addAll(
        await ApiService.sendMessage(message: msg, modelID: chosenModelID));
    notifyListeners();
  }
}
