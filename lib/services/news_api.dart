import 'dart:convert';

import 'package:http/http.dart' as http;


Future getNews() async {
  var request = http.Request('GET', Uri.parse('https://newsapi.org/v2/everything?q=türkiye&from=2024-05-08&sortBy=publishedAt&apiKey=40dfe066bb614365ae44c1551d96f9da'));


http.StreamedResponse response = await request.send();

if (response.statusCode == 200) { 
  

      // Yanıtın gövdesini dize olarak almak
    final responseBody = await response.stream.bytesToString();

    // Dizeyi JSON'a dönüştürmek
    final jsonResponse = await jsonDecode(responseBody);

    // JSON nesnesini kullanma

    print(jsonResponse);

    
   
    return jsonResponse;
}
else {
  print(response.reasonPhrase);
  return null;
} 

}