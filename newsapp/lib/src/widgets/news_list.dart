import 'package:flutter/material.dart';
import 'package:newsapp/src/models/models.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
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
        _CardTopBar(news: news, index: index),
        _CardTitle(news: news),
        _CardImage(news: news),
        _CardBody(news: news),
        const SizedBox(height: 10),
        const Divider(),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(Icons.star_outline),
              ),
              const SizedBox(width: 8),
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(Icons.more),
              ),
              const SizedBox(width: 8),
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(Icons.share),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _CardBody extends StatelessWidget {
  const _CardBody({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(news.description ?? ''),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
          child: (news.urlToImage != null)
              ? FadeInImage(
                  image: NetworkImage(news.urlToImage!),
                  placeholder: const AssetImage('assets/giphy.gif'),
                )
              : const Image(
                  image: AssetImage('assets/no-image.png'),
                ),
        ),
      ),
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

class _CardTopBar extends StatelessWidget {
  final Article news;
  final int index;

  const _CardTopBar({
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
