import 'package:flutter/material.dart';

class ChatHomeAppBar extends StatelessWidget {
  const ChatHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageSize = constraints.maxWidth * 0.08;
        double fontSize = constraints.maxWidth * 0.045;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/robot-assistant.png',
              width: imageSize.clamp(40, 50),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                'Chat With Gemini',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize.clamp(23, 24),
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
