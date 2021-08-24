import 'package:chatui/page.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelListPage extends StatefulWidget {
  const ChannelListPage({Key? key}) : super(key: key);

  @override
  _ChannelListPageState createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChannelListView(
      // filter: {'members':{ '\$in': [StreamChat.of(context).user.id],}
      sort: [SortOption('last_messafe_at')],
      pagination: PaginationParams(limit: 20),
      channelWidget: ChannelPage(),
    ),
    );
  }
}
