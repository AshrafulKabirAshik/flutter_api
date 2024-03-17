import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../movieTMDB/Results.dart';

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
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500'
                '${widget.results.posterPath}',
              ),
              Text(
                '${widget.results.adult}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.backdropPath}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.genreIds}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.id}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.originalLanguage}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.originalTitle}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.overview}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.popularity}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.posterPath}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.releaseDate}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.title}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.video}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.voteAverage}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${widget.results.voteCount}',
                style: GoogleFonts.cormorant(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
