import 'package:flutter/material.dart';

class MovieSliderScreen extends StatelessWidget {
  const MovieSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Populares',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Separacion
          SizedBox(
            height: 10,
          ),

          //Elementos en horizontal
          _MoviePoster(),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.popAndPushNamed(
                    context,
                    'details',
                    arguments: 'movie-details',
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const FadeInImage(
                      placeholder: AssetImage(
                        'assets/no-image.jpg',
                      ),
                      image: NetworkImage(
                        'https://via.placeholder.com/300x400',
                      ),
                      fit: BoxFit.cover,
                      width: 130,
                      height: 190,
                    ),
                  ),
                ),

                //Espacio
                const SizedBox(
                  height: 5,
                ),

                //Nombre de la Pelicula
                const Text(
                  'Una Pelicula',
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
