import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_bakry/data/constants.dart';
import 'package:news_bakry/models/ArticleData.dart';
import 'package:news_bakry/models/SourceData.dart';
class ApiManager{

  static Future<SourceData> fetchSources(String categoryId)async{
    Uri url = Uri.https(Constants.domain,"v2/top-headlines/sources",{
      "apiKey":Constants.apiKey,
      "category":categoryId
    });
    var response= await http.get(url);
    var json = jsonDecode(response.body);

    return SourceData.fromJson(json) ;

  }

  static Future<ArticleData> fetchArticles(String sourceId)async{
    Uri url =Uri.https(Constants.domain,"/v2/everything",{
      "apiKey":Constants.apiKey,
      "sources":sourceId
    });
    var response= await http.get(url);
    var json=jsonDecode(response.body);
    return ArticleData.fromJson(json) ;
  }




}