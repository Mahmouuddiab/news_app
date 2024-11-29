import 'dart:ui';

import 'package:news_bakry/utils/app_colors.dart';

class CategoryData{
  String id;
  String title;
  String imagePath;
  Color color;

  CategoryData({required this.id,required this.title,required this.imagePath,required this.color});

 static List<CategoryData>getCategories(){
    return [
      CategoryData(id: "sports", title: "Sports", imagePath: "assets/images/sports.png", color:AppColors.red),
      CategoryData(id: "health", title: "Health", imagePath: "assets/images/health.png", color:AppColors.pink),
      CategoryData(id: "business", title: "Business", imagePath: "assets/images/bussines.png", color:AppColors.brown),
      CategoryData(id: "science", title: "Science", imagePath:"assets/images/science1.png", color:AppColors.yellow),
      CategoryData(id: "general", title: "General", imagePath:"assets/images/Politics.png", color:AppColors.darkBlue),
      CategoryData(id:"entertainment", title:"Entertainment", imagePath:"assets/images/environment1.png", color:AppColors.lightBlue),
    ];
  }
}