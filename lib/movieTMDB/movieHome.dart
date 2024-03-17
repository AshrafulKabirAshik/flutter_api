import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DetailsPage/details.dart';
import '../web/apiService.dart';
import 'Results.dart';
import 'movie_card.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  late Future<List<Results>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = ApiService().getResults(1);
  }

  openPage(Results results) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Details(
          results: results,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        surfaceTintColor: Colors.grey.shade900,
        centerTitle: true,
        title: Text(
          'Top Rated Movies',
          style: GoogleFonts.shadowsIntoLight(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Results>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisExtent: 350,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {

                  print('Snapshot : ${snapshot.data}');

                  Results results = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      openPage(results);
                    },
                    child: MovieCard(
                      imgUrl: '${results.posterPath}',
                      title: '${results.title}',
                      reliesDate: '${results.releaseDate}',
                      rating: '${results.voteAverage}',
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return const CircularProgressIndicator(
              color: Colors.yellow,
            );
          },
        ),
      ),
    );
  }
}
