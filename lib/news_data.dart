import 'dart:convert';

import 'package:newsgram/models/article_model.dart';
import 'package:http/http.dart' as http ;

class News{
  List allNews=[];

  Future getNews() async{

    var response = await http.get(
        Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=7c31c72b31114b6999ff119153b3457b')
    );



    var jsonData = jsonDecode(response.body);

    jsonData['articles'].forEach((element){

      if(element['urlToImage']!=null && element['description']!=null){

      ArticleModel articleModel = ArticleModel(
          description: element['description'],
          title: element['title'],
          urlToImage: element['urlToImage'],
          url: element['url']);

      allNews.add(articleModel);}
    });

  }
}

class CategoryNews{
  List allCategoryNews=[];

  Future getNews(String category) async{

    var response = await http.get(
        Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=7c31c72b31114b6999ff119153b3457b')
    );




    var jsonData = jsonDecode(response.body);

    jsonData['articles'].forEach((element){

      if(element['urlToImage']!=null && element['description']!=null){

        ArticleModel articleModel = ArticleModel(
            description: element['description'],
            title: element['title'],
            urlToImage: element['urlToImage'],
            url: element['url']);

        allCategoryNews.add(articleModel);}
    });

  }
}