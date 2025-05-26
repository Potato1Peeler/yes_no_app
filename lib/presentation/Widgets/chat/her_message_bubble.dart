import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    DateTime ahora = DateTime.now();
    String horaCompleta = "${ahora.hour}:${ahora.minute}";


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  message.text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Icon(Icons.check_circle_rounded,
                color: Colors.blue,
                size: 30,),
                ),
            ),
            SizedBox(width: 20),
            Container(
              child: Text(
                horaCompleta,
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        
        //Signo de exclamación: que siempre va a devolver una image
        _ImageBubble(imageUrl: message.imageUrl!,),
        
        const SizedBox(height: 5,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
  
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
            imageUrl,
            width: size.width*0.7,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                width: size.width*0.7,
                height: 150,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text('Mi amor esta enviando una imagen'),
              );
              
            },
            ));
  }
}
