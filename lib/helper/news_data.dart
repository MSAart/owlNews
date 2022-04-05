import 'dart:convert';
import 'package:owlnews/models/article_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  String? category;
  Repository({required this.category});

  late String baseUrl =
      'https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=1e777845da78417faa241d5813a10c23';

  Future fetchArticle() async {
    try {
      final value = await http.get(Uri.parse(baseUrl));

      if (value.statusCode == 200) {
        Map<String, dynamic> response = json.decode(value.body);
        List<dynamic> listData = response["articles"];
        List<ArticleModel> listArticle =
            listData.map((e) => ArticleModel.fromJson(e)).toList();
        return listArticle;
      } else {
        throw Exception('Failed to Load Article');
      }
    } catch (e) {
      null;
    }
  }
}
