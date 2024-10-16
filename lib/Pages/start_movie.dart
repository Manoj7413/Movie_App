import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StartMovie extends StatefulWidget {
  final String moviename;
  final dynamic rating;
  final dynamic id;
  final dynamic language;
  final dynamic popular;
  final dynamic overview;
  final dynamic views;
  final dynamic released;
  final dynamic poster;
  const StartMovie({super.key, required this.moviename, required this.rating, required this.id, required this.popular, required this.language, required this.overview, required this.views, required this.released,required this.poster});

  @override
  State<StartMovie> createState() => _StartMovieState();
}

class _StartMovieState extends State<StartMovie> {
  String selectedValue = 'Season 1';
  String get moviename => moviename;
  dynamic get rating =>rating;
  dynamic get id => id;
  dynamic get media=>media;
  dynamic get language =>language;
  dynamic get popular => popular;
  dynamic get overview=>overview;
  dynamic get views => views;
  dynamic get released=>released;
  dynamic get poster=>poster;

  @override
  Widget build(BuildContext context) {
    // double scWidth = MediaQuery.of(context).size.width;
    // double scHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.download, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 300, // Set a fixed height for the container
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                    child: Stack(
                      fit: StackFit.expand, // Make Stack fill the entire ClipRRect
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${widget.poster}',
                          fit: BoxFit.cover,
                        ),
                        Center( // Center the play button
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_circle_outline, color: Colors.white, size: 50),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight, // Align the volume button to the bottom left
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.volume_up_outlined, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Text(widget.moviename, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(
                  "Released: ${widget.released},  Lang: ${widget.language},  Rating: ${widget.rating},  Views: ${widget.views} \nId: ${widget.id},  Popularity: ${widget.popular}",
                  style: TextStyle(color:Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Play', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Download S1:E1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15),
                Text(widget.overview,style: TextStyle(color: Colors.white70),),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add, color: Colors.white),
                        ),
                        Text('My List', style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.star, color: Colors.white),
                        ),
                        Text('Rate', style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share, color: Colors.white),
                        ),
                        Text('Share', style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.file_download, color: Colors.white),
                        ),
                        Text('Download\nSeason 1', style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: (){},
                          child: Text('Episodes',style: TextStyle(fontSize: 25,color: Colors.white70),)
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text('Collection',style: TextStyle(fontSize: 25,color: Colors.white70),)
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text('Trailer & More',style: TextStyle(fontSize: 25,color: Colors.white70),)
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text('Suggestion',style: TextStyle(fontSize: 25,color: Colors.white70),)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton<String>(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      dropdownColor: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15),
                      iconSize: 30,
                      underline: Container(
                        height: 2,
                        color: Colors.grey[800],
                      ),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue ?? "";
                        });
                      },
                      items: <String>['Season 1', 'Season 2', 'Season 3', 'Season 4']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 260,),
                    IconButton(onPressed: () {}, icon: Icon(Icons.notifications, color: Colors.white))
                  ],
                ),
                Container(
                  child: Column(
                    children: List.generate(30, (i) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${i+1}.Episode ${i+1}',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.bold),),
                                Text('${i+20}min', style: TextStyle(color: Colors.grey,)),
                              ],
                            ),
                            SizedBox(width: 40,),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.downloading,color: Colors.grey,size: 30,),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
