// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor:model.type.color(),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;
  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });
  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.erro;
  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType { erro, info }

extension MessageTypeExtension on MessageType {
  Color color() {
    switch (this) {
      case MessageType.erro:
        return Colors.red[400] ?? Colors.red;

      case MessageType.info:
        return Colors.blue[200] ?? Colors.blue;
    }
  }
}
