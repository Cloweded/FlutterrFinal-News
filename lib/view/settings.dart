import 'package:flutter/material.dart';
import 'package:proje/constants/parameters.dart';





class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("ayarlar"),
      ),



    body: ListView(
      padding: EdgeInsets.all(10),
      children: [
        ListTile(
          onTap: (){
            setState(() {
              themeIsLight = !themeIsLight;
            });
          },
          title: Text("Tema"),
          trailing: Text(themeIsLight?"Açık" : "Koyu"),
        ),
          Divider(),

          /*
         ListTile(

          title: Text("Dil"),
          trailing: Text("Türkçe"),
        ),*/
      ],
    ),

     
    );
  }
}