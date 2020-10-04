import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

class getMovieDetails {

  String title;
  String weekofdate;
  String year;
  String runtime;
  String director;
  String writer;
  String plot;
  String poster;


  Future<void> getMovieGS() async {
    var url_gs = 'https://script.google.com/macros/s/AKfycbxXJEZiNyqbhy3wxgHoP441mfJRtjfThG-Y5APFWzZqR_7owixF/exec';
    var urlmd_search = 'http://www.omdbapi.com/?apikey=6209ccda&s=';
    var urlmd_id = 'http://www.omdbapi.com/?apikey=6209ccda&i=';


    // get google sheet movie of week (title and date)
    http.Response responsegs = await http.get(url_gs);
    var datags = json.decode(responsegs.body);
    var listform = datags.entries.toList();
    title = listform[0].key;

    // API search for movie title and get imdbID
    http.Response responsemd_search = await http.get(urlmd_search + title);
    var searchmd = json.decode(responsemd_search.body);
    var imdb_id = searchmd['Search'][0]['imdbID'];

    // API get movie details
    http.Response responsemd = await http.get(urlmd_id + imdb_id);
    var datamd = json.decode(responsemd.body);
    year = datamd['Year'];
    runtime = datamd['Runtime'];
    poster = datamd['Poster'].replaceAll('SX300', 'SX600');
    director = datamd['Director'];
    writer = datamd['Writer'];
    plot = datamd['Plot'];


    // format movie club date
    var weekmovie = datags[title];
    var dt = DateTime.parse(weekmovie['date']);
    weekofdate = DateFormat("MMMd").format(dt).toUpperCase();


    //print(title);
    //print(date);
    //print(year);
    //print(runtime);
    //print(poster);
    //print(director);
    //print(writer);
    //print(plot);
  }


}




