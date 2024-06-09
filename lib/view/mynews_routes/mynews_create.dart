import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MyNews_Create_Screen extends StatefulWidget {
  const MyNews_Create_Screen({super.key});

  @override
  State<MyNews_Create_Screen> createState() => _MyNews_Create_ScreenState();
}

class _MyNews_Create_ScreenState extends State<MyNews_Create_Screen> {

    String path = "";
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "Haber Oluştur",),
      ),



      body: ListView(
        padding: EdgeInsets.only(left: 20 , right: 20, top: 20),
        children: [
         
          path.isNotEmpty? Container(
            
          height: 200,
          margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
          
                image: DecorationImage(image: FileImage(File(path)),fit: BoxFit.cover)
                
              ),
          
             
            ) :    GestureDetector(
            onTap: () async {
             
              final XFile? file = await ImagePicker().pickImage(
           source: ImageSource.gallery);

           if (file != null) {
             print(file.path);
            
             setState(() {
               path = file.path ;
             });
           }else {
            print("fotoğraf alınamadı");
           }
            },
            child: Container(
            
          height: 200,
          margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
          
                color: Colors.grey.shade400,
          
              ),
          
              child: Center(child: Icon(Icons.image, size: 60,),),
            ),
          ),
        


          Text("Başlık", style: TextStyle(fontSize: 20, ),),
        
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(

            controller:  title,
            
            decoration: InputDecoration(

              border: InputBorder.none,

              hintText: "Başlık Giriniz"
            ),
          ),
        ),
         Text("Açıklama", style: TextStyle(fontSize: 20, ),),
        
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: description,
            decoration: InputDecoration(

              border: InputBorder.none,

              hintText: "Başlık Giriniz"
            ),
          ),
        ),

        ElevatedButton(onPressed: () async {
        if (title.text.isNotEmpty) {
           SharedPreferences prefs = await SharedPreferences.getInstance();
 
         
           List<Map<String, String>> data = [];

          String jsonData = prefs.getString('mynews') ?? '[]';
    List<dynamic> tempData = jsonDecode(jsonData);
    setState(() {
      data = tempData.map((item) => Map<String, String>.from(item)).toList();
    });
    
    print(data);
    List newData = data;

      newData.add({"title":title.text, "description":description.text, "image":path});

     
    String newJsonData = jsonEncode(data);
    await prefs.setString('mynews', newJsonData);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Veriler Kaydedildi')),
    );
        }


       
        }, child: Text("Kaydet"))

          

      ],),
    );
  }
}
