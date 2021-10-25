import 'package:cine_movie/helper/text.dart';
import 'package:cine_movie/telas/description.dart';
import 'package:flutter/material.dart';


class TopMovies extends StatelessWidget {
  const TopMovies({Key? key, this.bestMovies}) : super(key: key);

  final List? bestMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditText(text: "Melhores Filmes", size: 26,),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: bestMovies!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Description(name: bestMovies![index]["title"],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500'+bestMovies![index]["backdrop_path"],
                          posterUrl: 'https://image.tmdb.org/t/p/w500'+bestMovies![index]["poster_path"],
                          description: bestMovies![index]["overview"],
                          vote: bestMovies![index]["vote_average"].toString(),
                          launchOn: bestMovies![index]["release_date"],
                        ))
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height:200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+bestMovies![index]['poster_path']
                                  )
                              )
                          ),
                        ),
                        Container(
                          child: EditText(text: bestMovies![index]['title'] !=null?
                          bestMovies![index]['title']:'Loading...'),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
