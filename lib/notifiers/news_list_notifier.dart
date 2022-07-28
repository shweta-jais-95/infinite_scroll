// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll/datamodel.dart/news.dart';
import 'package:infinite_scroll/services/api_services.dart';

class NewsListNotifier extends ChangeNotifier {
  final List<News> _news = <News>[];
  bool _hasNext = false;
  bool _hasPrevious = false;
  bool? _isFetchingNews;
  BigInt? _currentPage;
  int? _pageNo;

  bool get hasNext => _hasNext;
  bool get hasPrevious => _hasPrevious;
  int get currentPage => _pageNo ?? 1;
  bool? get isFetchingActivity => _isFetchingNews;
  String? _customerId;
  String? _opportunityId;

  String? _searchString;

  setSearchBy(String? search) {
    _searchString = search;
    refresh();
  }

  setFilter(var filter) {}

  setCustomerId(String? id) {
    _customerId = id;
  }

  setOpportunityId(String? id) {
    _opportunityId = id;
  }

  init() {
    _pageNo = null;
    _hasNext = false;
    _hasPrevious = false;
    _searchString = null;
    _news.clear();
  }

  List<News> get news => _news;

  Future refresh() async {
    _hasNext = false;
    _hasPrevious = false;
    _pageNo = null;
    _currentPage = null;
    var newsResponse = await ApiService.fetchNews(
      1,
    );
    _news.clear();
    _news.addAll(newsResponse.news);
    _hasNext = newsResponse.hasNextData;
    _pageNo = 1;
    _isFetchingNews = false;
    notifyListeners();
  }

  setFetchActivity(bool value) {
    _isFetchingNews = value;
    notifyListeners();
  }

  Future fetchNextNews(bool showWebView) async {
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
    if (pNo == 1 &&
        _customerId == null &&
        _searchString == null &&
        _opportunityId == null) {
      _isFetchingNews = false;
    } else {
      _isFetchingNews = true;
    }
    try {
      var newsResponse = await ApiService.fetchNews(
        pNo,
      );

      if (pNo == 1 &&
          _customerId == null &&
          _searchString == null &&
          _opportunityId == null) {
        _news.clear();
      }
      if (showWebView) {
        _news.clear();
      }
      _news.addAll(newsResponse.news);
      _hasNext = newsResponse.hasNextData;
      _hasPrevious = !(pNo == 1);
      _pageNo = pNo;
      // ignore: empty_catches
    } catch (e) {}
    _isFetchingNews = false;
    notifyListeners();
  }
}
