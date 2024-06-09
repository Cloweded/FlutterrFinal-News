

import 'package:flutter/material.dart';
import 'package:proje/constants/parameters.dart';
import 'package:proje/view/home_routes/news.dart';




class news_Details extends StatefulWidget {
  News news;
   news_Details({super.key, required this.news});

  @override
  State<news_Details> createState() => _news_DetailsState(news);
}

class _news_DetailsState extends State<news_Details> {
  News news;

  _news_DetailsState(this.news);


 
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(

        title: Text(news.title),
      ),

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
           if(news.imageUrl !="null")
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                news.imageUrl,
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
                    news.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    news.description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Yayınlanma Tarihi: ${news.publishedAt}',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}