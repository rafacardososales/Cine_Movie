import 'package:cine_movie/helper/text.dart';
import 'package:cine_movie/widgets/topMovies.dart';
import 'package:cine_movie/widgets/trending.dart';
import 'package:cine_movie/widgets/PopList.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';


void main (){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark,
    primaryColor: Color(0xff22353d)
    ),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingMovies = [];
  List topRateMovies = [];
  List pop = [];
  final String apiKey = "e07a73ba920ad5ee23b6b3c775be5d51";
  final token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMDdhNzNiYTkyMGFkNWVlMjNiNmIzYzc3NWJlNWQ1MSIsInN1YiI6IjYxNzRkM2FlZTcyZmU4MDAyYjUyMDBiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hWZoiSI1OQNtzZHnQjJLsbWIuZXawIIa6P1xQQAUAWc";

  loadMovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, token),
    logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true
      )
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRateResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map popResult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    setState(() {
      trendingMovies = trendingResult["results"];
      topRateMovies = topRateResult["results"];
      pop = popResult["results"];
    });
    print(pop);
  }

  @override
  void initState() {
    super.initState();
    loadMovies();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: getAppBar(),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: [0.1, 1],
            colors: [Color(0xff22353d), Colors.black]
        )),
        child: ListView(
          children: [
            TrendingMovies(trending: trendingMovies),
            PopList(popList: pop),
            TopMovies(bestMovies: topRateMovies)
          ],
        ),
      )
    );
  }

  getAppBar() => AppBar(
    backgroundColor: Color(0xff22353d),
    title: EditText(text: "Cine Movie"),
    centerTitle: true,
    leading: IconButton(
      padding: EdgeInsets.only(left: 10.0),
      onPressed: () => {},
      icon: Icon(
        Icons.sort,
        color: Colors.white,
        size: 25.0,
      ),
      iconSize: 30.0,
      color: Colors.white,
    ),
    actions: <Widget>[
      IconButton(
        padding: EdgeInsets.only(right: 30.0),
        icon: Icon(Icons.search),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: () {

        },
      ),
    ],
  );
}
