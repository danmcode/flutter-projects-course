import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print('deatils screen: ${movie.heroId}');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            movie.title,
            movie.fullBackdropPath,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(
                  movieId: movie.id,
                  title: movie.title,
                  originalTitle: movie.originalTitle,
                  voteAvrage: movie.voteAverage.toString(),
                  posterPath: movie.fullPosterImge,
                  heroId: movie.heroId!,
                ),
                _Overview(movie.overview),
                _Overview(movie.overview),
                CastingCards(movieId: movie.id),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final String title;
  final String fullBackdropPath;
  const _CustomAppBar(this.title, this.fullBackdropPath);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black45,
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final int movieId;
  final String title;
  final String originalTitle;
  final String voteAvrage;
  final String posterPath;
  final String heroId;

  const _PosterAndTitle({
    required this.movieId,
    required this.title,
    required this.originalTitle,
    required this.voteAvrage,
    required this.posterPath,
    required this.heroId,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: heroId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage(
                  'assets/no-image.jpg',
                ),
                image: NetworkImage(posterPath),
                fit: BoxFit.cover,
                //width: 130,
                height: 150,
              ),
            ),
          ),

          //Separacion
          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 200),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),

              //Titulo Original
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 200),
                child: Text(
                  originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),

              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.yellow,
                  ),
                  //
                  const SizedBox(width: 5),
                  //
                  Text(
                    voteAvrage,
                    style: textTheme.caption,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String overView;
  const _Overview(
    this.overView,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        overView,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
