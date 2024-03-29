import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/constants/constants.dart';
import 'package:flutter_chatgpt/services/assets_manager.dart';
import 'package:flutter_chatgpt/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});
  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? orangePeel : Color(0xFF052652),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.chatGhostinChat,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: chatIndex == 0
                        ? TextWidget(label: msg)
                        : DefaultTextStyle(
                            style: TextStyle(
                                color: Color(0xFFF3F6E8),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            child: AnimatedTextKit(
                                isRepeatingAnimation: false,
                                repeatForever: false,
                                displayFullTextOnTap: true,
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TyperAnimatedText(msg.trim(),
                                      speed: Duration(milliseconds: 30))
                                ]),
                          )),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.thumb_down_alt_outlined,
                              color: Colors.white),
                        ],
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}
