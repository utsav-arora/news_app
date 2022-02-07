
import 'package:flutter/material.dart';
import 'package:newsgram/pages/article_view_page.dart';

class ArticleTemplate extends StatelessWidget {

  String title , description , url , urlToImage;
  ArticleTemplate({required this.url, required this.urlToImage, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> ArticleViewPage(blogUrl: url)
        ));
      },
      child: Container(
        margin: EdgeInsets.all(12.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image(image: NetworkImage(urlToImage,),
                height: 200,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Colors.black),),
            SizedBox(height: 10.0,),
            Text(title,style: TextStyle( fontSize: 15.0,color: Colors.grey[800]),),
          ],
        ),
      ),
    );
  }
}
