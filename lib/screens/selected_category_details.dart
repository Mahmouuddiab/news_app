import 'package:flutter/material.dart';
import 'package:news_bakry/data/api_manager.dart';
import 'package:news_bakry/models/ArticleData.dart';
import 'package:news_bakry/models/SourceData.dart';
import 'package:news_bakry/screens/article_item.dart';
import 'package:news_bakry/screens/tab_item.dart';

class SelectedCategoryDetails extends StatefulWidget {
  List<Sources> sourceList;
  SelectedCategoryDetails({super.key, required this.sourceList});

  @override
  State<SelectedCategoryDetails> createState() => _SelectedCategoryDetailsState();
}

class _SelectedCategoryDetailsState extends State<SelectedCategoryDetails> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       DefaultTabController(
           length: widget.sourceList.length,
           child: TabBar(
             onTap: (index){
               setState(() {
                 selectedIndex=index;
               });
             },
             padding: EdgeInsets.only(top: 10),
             isScrollable: true,
               indicatorColor: Colors.transparent,
               dividerColor: Colors.transparent,
               tabs:widget.sourceList.map((e)=>TabItem(isSelected:selectedIndex==widget.sourceList.indexOf(e), sources: e)).toList())
       ),
            FutureBuilder(future:ApiManager.fetchArticles(widget.sourceList[selectedIndex].id??""),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError){
              return Column(children: [
                Text("something went wrong")
              ],);
            }


            List<Articles>articleList = snapshot.data!.articles!;
            return Expanded(child: ListView.builder(itemCount: articleList.length,itemBuilder:(context, index) => ArticleItem(articles:articleList[index]),)) ;
          },)
      ],
    );
  }
}
