import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proje/view/home_routes/news.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyNews_Screen extends StatefulWidget {
  const MyNews_Screen({super.key});

  @override
  State<MyNews_Screen> createState() => _MyNews_ScreenState();
}

class _MyNews_ScreenState extends State<MyNews_Screen> {

  List myNews =[];

  getMyNews()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, String>> data = [];

          String jsonData = prefs.getString('mynews') ?? '[]';
    List<dynamic> tempData = jsonDecode(jsonData);
    setState(() {
      data = tempData.map((item) => Map<String, String>.from(item)).toList();
    });
    
    

    setState(() {
      myNews = data;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 0), (timer) { setState(() {
      getMyNews();
    });});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Haberlerim"),
        
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        context.go("/create");
      },
      child: Icon(Icons.add),),


      body: ListView.builder(


        itemCount: myNews.length,

        itemBuilder:(context, i) {
          
          return MyNewsCard(news: News(title: myNews[i]["title"], description: myNews[i]["description"], imageUrl: myNews[i]["image"], publishedAt: ""));
        },
      ),
    );
  }
}


class MyNewsCard extends StatefulWidget {
  final News news;

  const MyNewsCard({Key? key, required this.news}) : super(key: key);

  @override
  State<MyNewsCard> createState() => _MyNewsCardState();
}

class _MyNewsCardState extends State<MyNewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
     
      },
      child: Card(
        
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
           if(widget.news.imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.file(
               File( widget.news.imageUrl,),
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.news.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.news.description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}