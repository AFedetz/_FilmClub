import 'package:flutter/material.dart';
import '../services/getMovieGS.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupMovie() async {
    getMovieDetails instance = getMovieDetails();
    await instance.getMovieGS();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'title': instance.title,
      'weekofdate': instance.weekofdate,
      'year': instance.year,
      'runtime': instance.runtime,
      'director': instance.director,
      'writer': instance.writer,
      'plot': instance.plot,
      'poster': instance.poster,
    });
    }


  @override
  void initState() {
    super.initState();
    setupMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/wolf_stencil.jpg')
        ),
      ),
    );
  }
}