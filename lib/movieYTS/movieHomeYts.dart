import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../web/apiService.dart';
import 'YtsData.dart';
import 'movie_card_yts.dart';

class MovieHomeYts extends StatefulWidget {
  const MovieHomeYts({super.key});

  @override
  State<MovieHomeYts> createState() => _MovieHomeYtsState();
}

class _MovieHomeYtsState extends State<MovieHomeYts> {
  late Future<YtsData> futureData;

  @override
  void initState() {
    super.initState();
    futureData = ApiService().getYtsResults();
  }

  /*openPage(Results results) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Details(
          results: results,
        ),
      ),
    );
  }*/

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
        child: FutureBuilder<YtsData>(
          future: futureData,
          builder: (context, snapshot) {
            print('Snapshot : ${snapshot.data}');
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
                itemCount: snapshot.data!.data!.movies!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: MovieCardYts(
                      imgUrl: snapshot
                          .data!.data!.movies![index].mediumCoverImage
                          .toString(),
                      title:
                          snapshot.data!.data!.movies![index].title.toString(),
                      reliesDate:
                          '${snapshot.data!.data!.movies![index].year.toString()}',
                      rating:
                          '${snapshot.data!.data!.movies![index].rating.toString()}',
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text(
                'Error',
                style: TextStyle(color: Colors.white),
              );
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
