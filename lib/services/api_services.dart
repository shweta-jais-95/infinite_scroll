import 'package:infinite_scroll/datamodel.dart/news.dart';
import 'package:infinite_scroll/datamodel.dart/news_reponse.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  static Future<GetNewsResponse> fetchNews(int pageNumber) async {
    try {
      const pageSize = 15;
      final response = await get(
        Uri.parse(
            "https://newsapi.org/v2/everything?q=bitcoin&apiKey=598e0b586c33478abbb6ec3b409b1937&pageSize=${pageSize + 1}&page=$pageNumber"),
      );
      var data = json.decode(response.body);
      List<News> fetchedNews = News.parseList(data);
      bool hasNextData = false;
      if (fetchedNews.length > pageSize) {
        hasNextData = true;
      }
      var news = fetchedNews.sublist(
          0, pageSize > fetchedNews.length ? fetchedNews.length : pageSize);
      return GetNewsResponse(news: news, hasNextData: hasNextData);
    } catch (e) {
      return GetNewsResponse(news: [], hasNextData: false);
    }
  }
}
