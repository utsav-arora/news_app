import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsgram/models/category_model.dart';
import 'package:newsgram/templates/category_template.dart';
import 'package:newsgram/templates/article_template.dart';
import 'package:newsgram/news_data.dart';

class CategoryPage extends StatefulWidget {

  String category;
   CategoryPage({required this.category});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List articles=[];
  bool _loading= true;

  Future getNews() async{
    CategoryNews newsData= CategoryNews();
    await newsData.getNews(widget.category);
    setState(() {
      articles= newsData.allCategoryNews;
      _loading=false;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toUpperCase()),
        elevation: 0.0,
        centerTitle: true,
      ),
      body:_loading?Center(child:CircularProgressIndicator(),):SingleChildScrollView(
        child: Container(
                height: MediaQuery.of(context).size.height,
          child: ListView.builder(itemBuilder: (BuildContext, int index){
            return Container(
              child: ArticleTemplate(
                title: articles[index].title,
                description: articles[index].description,
                url: articles[index].url,
                urlToImage: articles[index].urlToImage,
              ),
            );
          },
            shrinkWrap: true,
            itemCount: articles.length,
            physics: ClampingScrollPhysics(),
          ),
        ),
      ),

    );
  }
}
