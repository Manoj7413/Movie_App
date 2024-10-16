import 'dart:convert';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_rohit/Pages/List_all_movie.dart';
import 'package:movie_rohit/Pages/start_movie.dart';
import 'Profile.dart';

class MyApi {
  String apikey='d78e371a935bd40f2c8418704687ebd8';
  Future<dynamic> fetchMovieData() async {
    final res = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/week?api_key=$apikey'));
    final res1=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/latest?api_key=$apikey'));
    final res2=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apikey'));
    final res3=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey'));
    final res4 = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/day?api_key=$apikey'));

    if (res.statusCode == 200 && res1.statusCode == 200 && res2.statusCode == 200 && res3.statusCode == 200 && res4.statusCode == 200) {
      final dynamic temd = jsonDecode(res.body);
      final dynamic temd1 = jsonDecode(res1.body);
      final dynamic temd2 = jsonDecode(res2.body);
      final dynamic temd3 = jsonDecode(res3.body);
      final dynamic temd4 = jsonDecode(res4.body);

      final trendweekd = (temd['results'] ?? []) as List;
      final trendweekd1 = (temd1['results'] ?? []) as List;
      final trendweekd2 = (temd2['results'] ?? [])as List;
      final trendweekd3 = (temd3['results']  ?? []) as List;
      final trendweekd4 = (temd4['results']  ?? []) as List;

      final _trendlist = trendweekd.map((item) {
        return {
          'id': item['id'] ?? 'Unknown ID',
          'pos_path': item['poster_path'] ?? 'No Image',
          'rating': item['vote_average'] ?? 0.0,
          'title': item['title'] ?? 'NO TITLE',
          'language':item['original_language'] ?? 'unknown',
          'overview':item['overview'] ?? 'nahi',
          'popular':item['popularity'] ?? 'nahi hai',
          'Released':item['release_date'] ?? 'release nahi hui',
          'Views':item['vote_count'] ?? 'votKrow',
        };
      }).toList();
      final _trendlist1 = trendweekd1.map((item) {
        return {
          'id': item['id'] ?? 'Unknown ID',
          'pos_path': item['poster_path'] ?? 'No Image',
          'rating': item['vote_average'] ?? 0.0,
          'title': item['title'] ?? 'NO TITLE',
          'language':item['original_language'] ?? 'unknown',
          'overview':item['overview'] ?? 'nahi',
          'popular':item['popularity'] ?? 'nahi hai',
          'Released':item['release_date'] ?? 'release nahi hui',
          'Views':item['vote_count'] ?? 'votKrow',
        };
      }).toList();
      final _trendlist2 = trendweekd2.map((item) {
        return {
          'id': item['id'] ?? 'Unknown ID',
          'pos_path': item['poster_path'] ?? 'No Image',
          'rating': item['vote_average'] ?? 0.0,
          'title': item['title'] ?? 'NO TITLE',
          'language':item['original_language'] ?? 'unknown',
          'overview':item['overview'] ?? 'nahi',
          'popular':item['popularity'] ?? 'nahi hai',
          'Released':item['release_date'] ?? 'release nahi hui',
          'Views':item['vote_count'] ?? 'votKrow',
        };
      }).toList();
      final _trendlist3 = trendweekd3.map((item) {
        return {
          'id': item['id'] ?? 'Unknown ID',
          'pos_path': item['poster_path'] ?? 'No Image',
          'rating': item['vote_average'] ?? 0.0,
          'title': item['title'] ?? 'NO TITLE',
          'language':item['original_language'] ?? 'unknown',
          'overview':item['overview'] ?? 'nahi',
          'popular':item['popularity'] ?? 'nahi hai',
          'Released':item['release_date'] ?? 'release nahi hui',
          'Views':item['vote_count'] ?? 'votKrow',
        };
      }).toList();
      final _trendlist4 = trendweekd4.map((item) {
        return {
          'id': item['id'] ?? 'Unknown ID',
          'pos_path': item['poster_path'] ?? 'No Image',
          'rating': item['vote_average'] ?? 0.0,
          'title': item['title'] ?? item['name'],
          'language':item['original_language'] ?? 'unknown',
          'overview':item['overview'] ?? 'nahi',
          'popular':item['popularity'] ?? 'nahi hai',
          'Released':item['release_date'] ?? 'release nahi hui',
          'Views':item['vote_count'] ?? 'votKrow',
        };
      }).toList();

      return {
        'weekly': _trendlist,
        'latest': _trendlist1,
        'popular': _trendlist2,
        'top_rated': _trendlist3,
        'daily': _trendlist4,
      };
    };
  }
}


//Main home file///////
class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> trendlist = {};
  bool isLoading=true;

  //Navigate on navigation bar
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
      // Navigate to Home
        break;
      case 1:
      // Navigate to Category
        break;
      case 2:
      // Navigate to Favorite
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Profile()),
        );
        break;
    }
  }


  @override
  void initState(){
    super.initState();
    _fetchdata();
  }
  void _fetchdata() async {
    final data = await MyApi().fetchMovieData();
    if (mounted) {
      setState(() {
        if (data != null) {
          trendlist = data;
        }
        isLoading = false;
      });
    }
    else{
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    // double scHeight = MediaQuery.of(context).size.height;
    final List<dynamic> mydat = trendlist['top_rated'] ?? [];
    final List<dynamic> mydat1 = trendlist['popular'] ?? [];
    final List<dynamic> mydat2 = trendlist['daily'] ?? [];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello Movie Fans',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('What To Watch?',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize:15,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child:CircleAvatar(
                        backgroundImage: AssetImage('Assets/image/man.jpg'),
                        radius: 25,
                      ),
                    ),
                  ],
                ),
              ),


              TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle:TextStyle(color: Colors.white54,),
                  prefixIcon:InkWell(child: Icon(Icons.search_rounded,color: Colors.white54)),
                  filled: true,
                  fillColor: Color(0xff292c39),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                cursorColor: Colors.white54,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),

              SizedBox(height: 20,),

              if (isLoading) CircularProgressIndicator() else CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: (trendlist['weekly'] ?? []).map<Widget>((item) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      child:
                      Stack(
                          children: [
                            Image.network('https://image.tmdb.org/t/p/w500${item['pos_path']}',fit: BoxFit.cover ,width: scWidth*0.9,height: 1000,),
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust the sigma values for more or less blur
                              child: Container(
                                color: Colors.black.withOpacity(0), // Transparent color to just apply the blur
                              ),
                            ),
                            Align(alignment:Alignment.center, child: Image.network('https://image.tmdb.org/t/p/w500${item['pos_path']}',fit: BoxFit.cover ,)),
                      ]),
                    ),
                  );
                }).toList(),
              ),


              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Rated Movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>all_movie(category: 'top_rated', trend: trendlist)),
                        );
                      },
                      child: Text('See All',style: TextStyle(color: Colors.white54,fontSize: 12),),
                  ),
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [...List.generate(mydat.length, (ind) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: (){
                            String moviename=mydat[ind]['title'];
                            dynamic rating=mydat[ind]['rating'];
                            dynamic id=mydat[ind]['id'];
                            dynamic Popular=mydat[ind]['popular'];
                            dynamic lang=mydat[ind]['language'];
                            dynamic overview=mydat[ind]['overview'];
                            dynamic views=mydat[ind]['Views'];
                            dynamic redate=mydat[ind]['Released'];
                            dynamic poster=mydat[ind]['pos_path'];

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>StartMovie(moviename: moviename,rating: rating,id:id,popular:Popular,language:lang,overview:overview,views:views,released:redate, poster: poster,),),);
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Stack(
                                children: [
                                  Image.network('https://image.tmdb.org/t/p/w500${mydat[ind]['pos_path']}',fit: BoxFit.cover ,width: 300,height: 450,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    ],
                  ),
              ),



              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>all_movie(category: 'popular', trend: trendlist,)),
                      );
                    },
                    child: Text('See All',style: TextStyle(color: Colors.white54,fontSize: 12),),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [...List.generate(mydat1.length, (ind) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: GestureDetector(
                        onTap: (){
                          String moviename=mydat1[ind]['title'];
                          dynamic rating=mydat1[ind]['rating'];
                          dynamic id=mydat1[ind]['id'];
                          dynamic Popular=mydat1[ind]['popular'];
                          dynamic lang=mydat1[ind]['language'];
                          dynamic overview=mydat1[ind]['overview'];
                          dynamic views=mydat1[ind]['Views'];
                          dynamic redate=mydat1[ind]['Released'];
                          dynamic poster=mydat1[ind]['pos_path'];
                          
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StartMovie(moviename: moviename, rating: rating,id:id,popular:Popular,language:lang,overview:overview,views:views,released:redate, poster: poster,),),);
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network('https://image.tmdb.org/t/p/w500${mydat1[ind]['pos_path']}',fit: BoxFit.cover,width: 120,height: 180),
                          ),
                        ),
                      ),
                    );
                  }),
                  ],
                ),
              ),


              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Daily',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>all_movie(category: 'daily', trend: trendlist,)),
                      );
                    },
                    child: Text('See All',style: TextStyle(color: Colors.white54,fontSize: 12),),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [...List.generate(mydat1.length, (ind) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: GestureDetector(
                        onTap: (){
                          String moviename=mydat2[ind]['title'];
                          dynamic rating=mydat2[ind]['rating'];
                          dynamic id=mydat2[ind]['id'];
                          dynamic Popular=mydat2[ind]['popular'];
                          dynamic lang=mydat2[ind]['language'];
                          dynamic overview=mydat2[ind]['overview'];
                          dynamic views=mydat2[ind]['Views'];
                          dynamic redate=mydat2[ind]['Released'];
                          dynamic poster=mydat2[ind]['pos_path'];

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StartMovie(moviename: moviename, rating: rating,id:id,popular:Popular,language:lang,overview:overview,views:views,released:redate, poster: poster,),),);
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network('https://image.tmdb.org/t/p/w500${mydat2[ind]['pos_path']}',fit: BoxFit.cover,width: 120,height: 155),
                          ),
                        ),
                      ),
                    );
                  }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items:const[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,size: 20,color: Colors.white,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category,size: 20,color: Colors.white),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined,size: 20,color: Colors.white),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 20,color: Colors.white),
              label: 'Me',
            ),
          ],
          backgroundColor: Color(0xff292c39), // Background color
          selectedItemColor: Colors.blue, // Selected item color
          unselectedItemColor: Colors.white54,
          onTap: _onItemTapped,
        ),
      backgroundColor: Color(0xff0e111e),
    );
  }
}
