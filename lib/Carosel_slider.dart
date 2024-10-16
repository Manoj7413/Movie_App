import 'dart:convert';
import 'package:flutter/material.dart';

class apidata extends StatefulWidget {
  const apidata({super.key});
  @override
  State<apidata> createState() => _apidataState();
}
class _apidataState extends State<apidata> {
  get http => null;
  get apikey => apikey;
  List trendlist=[];

  @override
  void initState(){
    super.initState();
    fetchMovieData();
  }
  Future<void> fetchMovieData() async{
    final res=await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/week?api_key=$apikey'));
    if(res==200){
      var temd=jsonDecode(res.body);
      var trendweekd=temd['results'];

      setState(() {
        trendlist = trendweekd.map((item) {
          return {
            'id': item['id'],
            'pos_path':item['poster_path'],
            'rating':item['vote_average'],
            'media_type':item['media_type'],
            'index':trendweekd.indexof(item),
          };
        }).toList();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
