import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Pelicula';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black26,
        size: 200,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final List<Movie>? movies = snapshot.data;

        return ListView.builder(
          itemCount: movies?.length,
          itemBuilder: (_, int index) => _MovieItem(
            movie: movies![index],
          ),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage(
          'assets/no-image.jpg',
        ),
        image: NetworkImage(movie.fullPosterImge),
        fit: BoxFit.contain,
        width: 50,
      ),
    );
  }
}
