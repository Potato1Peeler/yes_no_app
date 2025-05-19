import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/Widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/Widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/Widgets/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://static.myfigurecollection.net/upload/items/1/2429499-6e943.jpg'),
          ),
        ),
        title: Text('mi amor'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Le pide que este pendiente de cambios
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  //enlaza el controlador creado en chatprovider
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      //instancia que sabra de quien es el mensaje
                      final message = chatProvider.messageList[index];

                      //si es par es de ella, si no, es mio 
                      //return (index %2 == 0)
                    return (message.fromWho == FromWho.hers) 
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                    })),
            //caja de texto de mensajes
            MessageFieldBox(onValue: chatProvider.sendMessage,),
          ],
        ),
      ),
    );
  }
}
