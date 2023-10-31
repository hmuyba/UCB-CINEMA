// Archivo: home.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_cubit.dart';
import 'summary.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  fetchMovies() async {
    var url = 'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3';
    var response = await http.get(Uri.parse(url));
    var result = jsonDecode(response.body);
    setState(() {
      movies = result['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Ticket Booking'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.network('https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}'),
                Text(movies[index]['title']),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        context.read<CartCubit>().addToCart(movies[index]['id'].toString());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        context.read<CartCubit>().removeFromCart(movies[index]['id'].toString());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Summary(movieId: movies[index]['id'].toString(), tickets: context.read<CartCubit>().state[movies[index]['id'].toString()] ?? 0, movie: movies[index])));
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
