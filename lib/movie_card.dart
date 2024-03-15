import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String reliesDate;
  final String rating;

  const MovieCard(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.reliesDate,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Card(
          elevation: 8.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(0.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500$imgUrl}',
            fit: BoxFit.cover,
            height: 260.0,
            width: 130.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cormorant(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 2, 4, 0),
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            reliesDate.substring(0,4),
            style: GoogleFonts.alata(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
        /*ListTile(
          title: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis,),
          subtitle: Text(reliesDate),
          //trailing: Text('$rating'),
        ),*/
      ],
    );
  }
}
