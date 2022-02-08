import 'package:flutter/material.dart';
import 'package:newsapp/src/services/services.dart';
import 'package:newsapp/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newsService.headlines.isNotEmpty)
          ? NewsList(news: newsService.headlines)
          : const Center(
              child: CircularProgressIndicator(color: Colors.red),
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
