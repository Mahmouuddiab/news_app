import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_bakry/models/ArticleData.dart';

class ArticleItem extends StatelessWidget {
  Articles articles;
   ArticleItem({super.key,required this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage??"",
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(articles.author??"",style:TextStyle(fontSize:18,fontWeight:FontWeight.w500,color:Colors.grey),textAlign:TextAlign.start,),
          Text(articles.title??"",style:TextStyle(fontSize:18,fontWeight:FontWeight.w500),textAlign:TextAlign.start),
          Text(articles.publishedAt??"",style:TextStyle(fontSize:18,fontWeight:FontWeight.w500,color:Colors.grey),textAlign:TextAlign.end),
        ],

      ),
    );
  }
}
