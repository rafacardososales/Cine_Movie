import 'package:cine_movie/helper/text.dart';
import 'package:cine_movie/telas/description.dart';
import 'package:flutter/material.dart';


class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, this.trending}) : super(key: key);

  final List? trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditText(text: "Em Cartaz", size: 26,),
          SizedBox(height: 2,),
          Container(
            height: 210,
            child: ListView.builder(
              itemCount: trending!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Description(name: trending![index]["title"],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500'+trending![index]["backdrop_path"],
                          posterUrl: 'https://image.tmdb.org/t/p/w500'+trending![index]["poster_path"],
                          description: trending![index]["overview"],
                          vote: trending![index]["vote_average"].toString(),
                          launchOn: trending![index]["release_date"],
                        ))
                    );
                  },
                  child: trending![index]['title']!=null?
                  Container(
                    width: 260,
                    child: Column(
                      children: [
                        Container(
                          height:180,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+trending![index]['backdrop_path']
                              )
                            )
                          ),
                        ),
                        SizedBox(height: 1.0,),
                        Container(
                          child: EditText(text: trending![index]['title'] !=null?
                          trending![index]['title']:'Loading...', size: 20,),
                        )
                      ],
                    ),
                  ):Container()
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
