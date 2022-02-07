
import 'package:flutter/material.dart';
import 'package:newsgram/pages/category_page.dart';


class CategoryTemplate extends StatelessWidget {


  String imageUrl;
  String categoryName;

  CategoryTemplate({required this.categoryName, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> CategoryPage(category: categoryName.toLowerCase())
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                image: NetworkImage(imageUrl),
                height: 80.0,
                width: 120.0,
              ),
            ),
            Container(
              height: 80.0,
              width: 120.0,
              child: Center(
                child: Text(categoryName,style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
