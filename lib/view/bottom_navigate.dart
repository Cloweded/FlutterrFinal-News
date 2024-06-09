import 'package:flutter/material.dart';
import 'package:proje/view/home_route.dart';
import 'package:proje/view/settings.dart';
import 'package:proje/view/mynews_route.dart';




class Bottom_Navigate extends StatefulWidget {
  const Bottom_Navigate({super.key});

  @override
  State<Bottom_Navigate> createState() => _Bottom_NavigateState();
}

class _Bottom_NavigateState extends State<Bottom_Navigate> {
  List pages =[Home_Route(), Mynews_Route(), Settings() ];
  int pagenum =0 ;
  @override
  Widget build(BuildContext context, ) {
  
    return Scaffold(
      

      body: pages[pagenum],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pagenum,
        onTap: (value) {
          setState(() {
            pagenum = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Haberler"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Haberlerim"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
          
          ],
      ),
    );
  }
}