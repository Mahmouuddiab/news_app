import 'package:flutter/material.dart';
import 'package:news_bakry/models/SourceData.dart';
import 'package:news_bakry/utils/app_colors.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Sources sources;
   TabItem({super.key,required this.isSelected,required this.sources});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color:AppColors.primary,width: 2),
        color: isSelected?AppColors.primary:Colors.transparent
      ) ,
      child: Text(sources.name!,style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: isSelected?Colors.white:AppColors.primary
      ),),
    );
  }
}
