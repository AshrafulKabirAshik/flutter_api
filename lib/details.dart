import 'package:flutter/material.dart';
import 'package:flutter_api/Results.dart';

class Details extends StatefulWidget {

  final Results results;

  const Details({super.key, required this.results});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500' '${widget.results.posterPath}',
            ),
            Text('${widget.results.adult}'),
            Text('${widget.results.backdropPath}'),
            Text('${widget.results.genreIds}'),
            Text('${widget.results.id}'),
            Text('${widget.results.originalLanguage}'),
            Text('${widget.results.originalTitle}'),
            Text('${widget.results.overview}'),
            Text('${widget.results.popularity}'),
            Text('${widget.results.posterPath}'),
            Text('${widget.results.releaseDate}'),
            Text('${widget.results.title}'),
            Text('${widget.results.video}'),
            Text('${widget.results.voteAverage}'),
            Text('${widget.results.voteCount}'),
          ],
        ),
      ),
    );
  }
}
