import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proje/constants/parameters.dart';
import 'package:proje/models/news_api_model.dart';
import 'package:proje/services/news_api.dart';



class News_Screen extends StatefulWidget {
  const News_Screen({super.key});

  @override
  State<News_Screen> createState() => _News_ScreenState();
}

class _News_ScreenState extends State<News_Screen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text("Haberler"),
      ),
    

      body:FutureBuilder(future: getNews(), builder:(context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("hata"),);
          }

         

      
         List<Article>? data =    NewsApi.fromJson(snapshot.data).articles;
          
        return  ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          Article news = data[index];
        
          return NewsCard(news: News(title: news.title.toString(), description: news.description.toString()  , imageUrl: news.urlToImage.toString(), publishedAt: news.publishedAt.toString()));
        },
      );
      },)
    );
  }
}


class News {
  final String title;
  final String description;
  final String imageUrl;
  final String publishedAt;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
  });
}

class NewsCard extends StatefulWidget {
  final News news;

  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
       setState(() {
         cachedData = widget.news;
       });
        context.go("/details");

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
           
           if(widget.news.imageUrl !="null")
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                widget.news.imageUrl,
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
                  Text(
                    'Yayınlanma Tarihi: ${widget.news.publishedAt}',
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
      ),
    );
  }
}