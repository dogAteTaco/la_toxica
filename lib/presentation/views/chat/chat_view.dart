import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toxica_2/domain/entities/message.dart';
import 'package:toxica_2/presentation/views/chat/her_message_bubble_view.dart';
import 'package:toxica_2/presentation/views/chat/my_message_bubble_view.dart';
import 'package:toxica_2/presentation/widgets/message_field_box.dart';
import 'package:toxica_2/providers/chat_provider.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatProvider chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: chatProvider.scrollController,
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    return _generateBubble(chatProvider.messages[index],
                        Theme.of(context).colorScheme);
                  }),
            ),
            Padding(
              child: MessageFieldBox(
                onValue: (String value) => chatProvider.sendMessage(value)),
              padding: EdgeInsets.only(bottom:8),// Mueve el text box un poco arriba para evitar ser cortado por la pantalla
            )
            
          ],
        ),
      ),
    );
  }

  Widget _generateBubble(Message message, ColorScheme colorScheme) {
    return message.fromWho == FromWho.me
        ? MyMessageBubbleView(colors: colorScheme, msg: message)
        : HerMessageBubbleView(colors: colorScheme, msg: message);
  }
}
