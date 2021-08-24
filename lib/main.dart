import 'package:chatui/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  final client = StreamChatClient("hjr8jk78jest", logLevel: Level.INFO);
  await client.connectUser(User(id: 'flutter'),
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZmx1dHRlciJ9'
          '.2-q3sx4-_2Y7UxXpfHWc22eXfaZUCwE6yXpngeZQ2EQ');
  final channel = client.channel('messaging', id: 'flutter');
  channel.watch();

  runApp(
    MyApp(client: client, channel: channel),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client, required this.channel})
      : super(key: key);
  final StreamChatClient client;
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return StreamChat(
          child: child,
          client: client,
        );
      },
      home: StreamChannel(
        channel: channel,
        child: ChannelPage(),
      ),
    );
  }
}


 var id;
