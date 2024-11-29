import 'package:flutter/material.dart';
import 'package:news_bakry/utils/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  void Function() onCategoryChangedClicked;
   HomeDrawer({super.key,required this.onCategoryChangedClicked});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment:AlignmentDirectional.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.2,
            color:AppColors.primary,
            child: Text("News App!",style:Theme.of(context).textTheme.titleLarge,),
          ),
          InkWell(
            onTap: (){
              onCategoryChangedClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.list,size: 40,),
                  SizedBox(width: 15,),
                  Text("Categories",style:Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings,size: 40,),
                  SizedBox(width: 15,),
                  Text("Settings",style:Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
