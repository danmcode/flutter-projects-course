import 'package:flutter/material.dart';
import 'package:newsapp/src/models/models.dart';
import 'package:newsapp/src/theme/dark_teme.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(news: news[index], index: index);
      },
    );
  }
}

class _New extends StatelessWidget {
  final Article news;
  final int index;

  const _New({
    Key? key,
    required this.news,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarTarget(news: news, index: index),
        _CardTitle(news: news)
      ],
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title ?? '',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _TopBarTarget extends StatelessWidget {
  final Article news;
  final int index;

  const _TopBarTarget({
    Key? key,
    required this.news,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: const TextStyle(color: Colors.red)),
          Text('${news.source.name}. '),
        ],
      ),
    );
  }
}
