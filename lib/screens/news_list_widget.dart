import 'package:flutter/material.dart';
import 'package:infinite_scroll/datamodel.dart/news.dart';
import 'package:infinite_scroll/notifiers/news_list_notifier.dart';

class NewsListViewWidget extends StatefulWidget {
  final NewsListNotifier? newsNotifier;
  final bool showWebView;
  final bool showCustomer;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  const NewsListViewWidget({
    required this.newsNotifier,
    Key? key,
    required this.showWebView,
    required this.refreshIndicatorKey,
    required this.showCustomer,
  }) : super(key: key);

  @override
  NewsListViewWidgetState createState() => NewsListViewWidgetState();
}

class NewsListViewWidgetState extends State<NewsListViewWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.newsNotifier?.init();
    _fetchList();
    _scrollController.addListener(scrollListener);
  }

  _fetchList() {
    widget.newsNotifier?.fetchNextNews(widget.showWebView);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        widget.newsNotifier?.hasNext == true) {
      _fetchList();
    }
  }

  _refresh() async {
    await widget.newsNotifier?.refresh();
    return;
  }

  @override
  Widget build(BuildContext context) {
    var length = widget.newsNotifier?.news.length ?? 0;
    bool isLoading = widget.newsNotifier?.isFetchingActivity != false;
    return RefreshIndicator(
        key: widget.refreshIndicatorKey,
        onRefresh: () {
          return _refresh();
        },
        child: isLoading
            ? Text("Loading")
            : ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: length + 1,
                itemBuilder: (context, i) {
                  if (widget.newsNotifier?.news.isEmpty == true) {
                    return Text("No data");
                  }
                  if (i == length) {
                    if (widget.newsNotifier?.hasNext == true) {
                      return Text("Loading more data");
                    } else {
                      return Container();
                    }
                  }
                  return NewsListItemView(news: widget.newsNotifier?.news[i]);
                }));
  }
}

class NewsListItemView extends StatelessWidget {
  final News? news;
  const NewsListItemView({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("item");
  }
}
