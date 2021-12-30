import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSliderScreen extends StatelessWidget {
  //Parametros
  final List<Movie> movies;
  final String? title;

  const MovieSliderScreen({
    Key? key,
    required this.movies,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != "")
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          //Separacion
          const SizedBox(
            height: 5,
          ),

          //Elementos en horizontal
          _MoviePoster(movies),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatefulWidget {
  final List<Movie> movies;

  const _MoviePoster(this.movies);

  @override
  State<_MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<_MoviePoster> {
  final ScrollController scrollController = new ScrollController();

  //Codigo que se ejecuta cuando se contruya el widget
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(scrollController.position.pixels);
  }

  //Codigo que se ejecuta cuando se destruya el widget
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          final movie = widget.movies[index];
          return Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    'details',
                    arguments: 'movie-details',
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: const AssetImage(
                        'assets/no-image.jpg',
                      ),
                      image: NetworkImage(
                        movie.fullPosterImge,
                      ),
                      fit: BoxFit.cover,
                      width: 130,
                      height: 190,
                    ),
                  ),
                ),

                //Espacio
                const SizedBox(height: 5),

                //Nombre de la Pelicula
                Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
