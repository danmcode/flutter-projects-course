import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsapp/src/models/models.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _CategoryList(),
            Expanded(
              child: NewsList(news: newsService.getArticleByCategorySelected),
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesList = Provider.of<NewsService>(context);
    final newsService = Provider.of<NewsService>(context, listen: false);

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.categories.length,
        itemBuilder: (BuildContext context, int index) {
          String cName = categoriesList.categories[index].name;
          return Container(
            width: 105,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryButton(category: categoriesList.categories[index]),
                  const SizedBox(height: 4),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}',
                      style: TextStyle(
                        color: (newsService.selectedCategory == cName)
                            ? Colors.red
                            : Colors.white,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);
    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
        print(category.name);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          category.icon,
          color: (newsService.selectedCategory == category.name)
              ? Colors.red
              : Colors.black54,
        ),
      ),
    );
  }
}
