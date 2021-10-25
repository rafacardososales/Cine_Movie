import 'package:cine_movie/helper/text.dart';
import 'package:cine_movie/telas/description.dart';
import 'package:flutter/material.dart';


class PopList extends StatelessWidget {
  const PopList({Key? key,  this.popList}) : super(key: key);

  final List? popList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditText(text: "Populares", size: 26,),
          SizedBox(height: 10,),
          Container(
            height: 260,
            child: ListView.builder(
              itemCount: popList!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Description(name: popList![index]["title"],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500'+popList![index]["backdrop_path"],
                          posterUrl: 'https://image.tmdb.org/t/p/w500'+popList![index]["poster_path"],
                          description: popList![index]["overview"],
                          vote: popList![index]["vote_average"].toString(),
                          launchOn: popList![index]["first_air_date"],
                        ))
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height:200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+popList![index]['poster_path']
                                  ),
                                fit: BoxFit.cover
                              )
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          child: EditText(text: popList![index]['original_name'] !=null?
                          popList![index]['original_name']:'Loading...',
                          size: 15,
                          ),
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
