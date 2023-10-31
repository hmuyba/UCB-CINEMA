import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final String movieId;
  final int tickets;
  final Map<String, dynamic> movie;

  Summary({required this.movieId, required this.tickets, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
            ),
            Text(movie['title']),
            Text(movie['overview']),
            Text('Tickets: $tickets'),
            Text('Total: ${tickets * 30}'),
          ],
        ),
      ),
    );
  }
}
