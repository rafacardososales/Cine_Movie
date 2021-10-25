import 'package:cine_movie/helper/text.dart';
import 'package:flutter/material.dart';


class Description extends StatelessWidget {
  const Description({Key? key, this.name, this.description, this.bannerUrl, this.posterUrl, this.vote, this.launchOn}) : super(key: key);

  final String? name, description, bannerUrl, posterUrl, vote, launchOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff22353d),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: [0.1, 1],
            colors: [Color(0xff22353d), Colors.black]
        )),
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerUrl!, fit: BoxFit.cover,),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: EditText(text: " ⭐ Classificação - "+ vote!, size: 17,),
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: EditText(text: name!=null?name:"Not Loaded", size: 24,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: EditText(text: 'Data de lançamento - ' +launchOn!,size: 14,),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterUrl!),
                ),
                Flexible(
                  child: Container(
                    child: EditText(text: description,size: 14,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
