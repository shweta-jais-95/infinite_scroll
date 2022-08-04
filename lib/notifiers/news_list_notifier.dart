// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll/datamodel.dart/news.dart';
import 'package:infinite_scroll/services/api_services.dart';

class NewsListNotifier extends ChangeNotifier {
  final List<News> _news = <News>[];
  bool _hasNext = false;
  bool? _isFetchingNews;
  BigInt? _currentPage;
  int? _pageNo;

  bool get hasNext => _hasNext;
  int get currentPage => _pageNo ?? 1;
  bool? get isFetchingActivity => _isFetchingNews;

  setSearchBy(String? search) {
    refresh();
  }

  setFilter(var filter) {}

  init() {
    _pageNo = null;
    _hasNext = false;
    _news.clear();
    _isFetchingNews = null;
  }

  List<News> get news => _news;

  Future refresh() async {
    _hasNext = false;
    _pageNo = null;
    _currentPage = null;
    _isFetchingNews = false;
    fetchNextNews();
  }

  setFetchActivity(bool value) {
    _isFetchingNews = value;
    notifyListeners();
  }

  Future fetchNextNews() async {
    if (_isFetchingNews == true) {
      return;
    }
    BigInt? pageNo = _currentPage;
    if (pageNo == null) {
      _currentPage = BigInt.one;
    } else {
      _currentPage = pageNo + BigInt.one;
    }

    int? pNo = _pageNo;
    if (pNo == null) {
      pNo = 1;
    } else {
      pNo = pNo + 1;
    }
    _isFetchingNews = true;
    try {
      var newsResponse = await ApiService.fetchNews(
        pNo,
      );

      if (pNo == 1) {
        _news.clear();
      }
      _news.addAll(newsResponse.news);
      _hasNext = newsResponse.hasNextData;
      _pageNo = pNo;
      // ignore: empty_catches
    } catch (e) {}
    _isFetchingNews = false;
    notifyListeners();
  }
}
