import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    // peliculas![index].uniqueId = '${peliculas![index].id}-tarjeta';
    // Navigator.pushNamed(context, 'detalle', arguments: peliculas![index]),
    return CarouselSlider.builder(
      itemCount: peliculas.length,
      itemBuilder: (context, index, realIndex) =>
          _CardImage(pelicula: peliculas[index]),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    Key? key,
    required this.pelicula,
  }) : super(key: key);

  final Pelicula? pelicula;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detalle', arguments: pelicula),
      child: Hero(
        tag: pelicula!.uniqueIdBanner,
        child: FadeInImage(
          image: NetworkImage(pelicula!.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
