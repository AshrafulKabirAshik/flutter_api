import 'package:flutter/material.dart';
import 'package:flutter_api/Results.dart';
import 'package:flutter_api/apiService.dart';
import 'package:flutter_api/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Top Rated Movies'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Results>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 320,
                  mainAxisExtent: 267,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Results results = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      openPage(results);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        fit: BoxFit.fitWidth,
                        height: 400,
                        'https://image.tmdb.org/t/p/w500'
                        '${results.posterPath}',
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

/*ListTile(
leading: Image.network(
'https://image.tmdb.org/t/p/w500' '${results.posterPath}',
),
title: Text('${results.title} '),
subtitle: Text('${results.releaseDate} '),
onTap: () => openPage(results),
trailing: const Icon(
Icons.navigate_next,
color: Colors.grey,
),
)*/
