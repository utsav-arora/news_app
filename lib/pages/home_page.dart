import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsgram/models/category_model.dart';
import 'package:newsgram/templates/category_template.dart';
import 'package:newsgram/templates/article_template.dart';
import 'package:newsgram/news_data.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List categories=[
    CategoryModel(categoryName: 'Business', imageUrl: "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"),
    CategoryModel(categoryName: 'Entertainment', imageUrl: "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
    CategoryModel(categoryName:'General', imageUrl: "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
    CategoryTemplate(categoryName: 'Health', imageUrl: "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"),
    CategoryTemplate(categoryName: 'Science', imageUrl: "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80"),
    CategoryTemplate(categoryName: 'Sports', imageUrl: "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"),
    CategoryTemplate(categoryName: 'Technology', imageUrl: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
  ];

  List articles=[];
  bool _loading=true;

  Future getNews() async{
    News newsData= News();
    await newsData.getNews();
    setState(() {
      articles= newsData.allNews;
      _loading= false;
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
        title: Text('Newsgram'),
        elevation: 0.0,
       centerTitle: true,
      ),
      body: _loading?Center(child:CircularProgressIndicator(),):SingleChildScrollView(
        child: SizedBox(

          child: Column(
            children: [
              SizedBox(
                height: 100,
                // padding: EdgeInsets.symmetric(horizontal: 10.0),

                // margin: EdgeInsets.symmetric(horizontal: 12.0,),
                child: ListView.builder(itemBuilder: (BuildContext , int index){
                  return CategoryTemplate(categoryName: categories[index].categoryName, imageUrl: categories[index].imageUrl);
                },
                itemCount: categories.length,
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
               Container(
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
            ],
          ),
        ),
      ),
    );
  }
}


