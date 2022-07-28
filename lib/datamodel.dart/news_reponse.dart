import 'package:infinite_scroll/datamodel.dart/news.dart';

class GetNewsResponse {
  List<News> news = [];
  bool hasNextData = false;
  GetNewsResponse({required this.hasNextData, required this.news});
}
