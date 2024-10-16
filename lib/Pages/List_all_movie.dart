import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_rohit/Pages/start_movie.dart';

class all_movie extends StatelessWidget {
  final dynamic trend;
  final String category;
  const all_movie({required this.category,required this.trend});

  @override
  Widget build(BuildContext context) {

    double scWidth = MediaQuery.of(context).size.width;
    final List<dynamic> mydata = trend[category];

    List<List<Container>> containerGrid = List.generate((mydata.length/3+1).ceil(),(i) =>
        List.generate(3, (j) {
          if(3*i+j>=mydata.length)return Container();
          return Container(
          width: scWidth*0.275,
          height: scWidth*0.45,
          margin: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StartMovie(moviename: mydata[3*i+j]['title'], rating: mydata[3*i+j]['rating'], id: mydata[3*i+j]['id'], popular: mydata[3*i+j]['popular'], language: mydata[3*i+j]['language'], overview: mydata[3*i+j]['overview'], views: mydata[3*i+j]['Views'], released: mydata[3*i+j]['Released'], poster:mydata[3*i+j]['pos_path'],)));
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network('https://image.tmdb.org/t/p/w500${mydata[3*i+j]['pos_path']}',fit: BoxFit.cover,),
              ),
            ),
          ),
        );
        },
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if(category=="top_rated")
              Text('Top Rated Movies', style: TextStyle(fontSize: 20, color: Colors.white)),

              if(category=="popular")
                Text('Popular Movies', style: TextStyle(fontSize: 20, color: Colors.white)),

              if(category=="daily")
                Text('Daily Latest Movies', style: TextStyle(fontSize: 20, color: Colors.white)),

              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: containerGrid.map((row) => Row(
                      children: row,
                    )).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xff0e111e),
    );
  }
}