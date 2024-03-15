import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String reliesDate;
  final String rating;

  const MovieCard({super.key, required this.imgUrl, required this.title, required this.reliesDate, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Card(
          elevation: 18.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(0.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500$imgUrl}',
            fit: BoxFit.cover,
            height: 300.0,
            width: 130.0,
          ),
        ),
        ListTile(
          title: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis,),
          subtitle: Text(reliesDate),
          //trailing: Text('$rating'),
        ),
      ],
    );
  }
}
