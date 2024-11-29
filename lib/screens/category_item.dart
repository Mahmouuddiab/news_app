import 'package:flutter/material.dart';
import 'package:news_bakry/models/category_data.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;
  void Function(CategoryData) onCategoryClicked;
   CategoryItem({super.key,required this.categoryData,required this.index,required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryClicked(categoryData);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryData.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(index%2==0? 25:0) ,
            bottomRight:Radius.circular(index%2==0? 0:25)
          )
        ),
        child: Column(
          children: [
            Image.asset(categoryData.imagePath,height:MediaQuery.of(context).size.height*0.15 ,),
            Text(categoryData.title,style:Theme.of(context).textTheme.titleLarge,)
          ],

        ),
      ),
    );
  }
}
