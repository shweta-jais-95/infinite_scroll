import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll/components/circular_progressbar_indicator_view.dart';
import 'package:infinite_scroll/components/no_data_show_view.dart';
import 'package:infinite_scroll/datamodel.dart/news.dart';
import 'package:infinite_scroll/notifiers/news_list_notifier.dart';
import 'package:infinite_scroll/screens/view_screen.dart';
import 'package:infinite_scroll/utils/fontsizes.dart';
import 'package:infinite_scroll/utils/palette.dart';

class NewsListViewWidget extends StatefulWidget {
  final NewsListNotifier? newsNotifier;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  const NewsListViewWidget({
    required this.newsNotifier,
    Key? key,
    required this.refreshIndicatorKey,
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
    widget.newsNotifier?.fetchNextNews();
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
    return RefreshIndicator(
        key: widget.refreshIndicatorKey,
        onRefresh: () {
          return _refresh();
        },
        child: widget.newsNotifier?.isFetchingActivity != false
            ? const CircularProgressBarIndicatorView()
            : ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: length + 1,
                itemBuilder: (context, i) {
                  if (widget.newsNotifier?.news.isEmpty == true) {
                    return const NoDataToShowView();
                  }
                  if (i == length) {
                    if (widget.newsNotifier?.hasNext == true) {
                      return const Center(
                        child: CircularProgressBar(),
                      );
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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (selectEntryContext) => const ViewScreen()));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Card(
          child: Column(
            children: <Widget>[
              if (news?.urlToImage?.isNotEmpty == true)
                CachedNetworkImage(
                  imageUrl: news?.urlToImage ?? "",
                  placeholder: (context, url) => const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: CircularProgressBar(),
                  ),
                  errorWidget: (context, url, error) => Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Icon(
                        Icons.error,
                        color: Palette.textColor,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text("${news?.title}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Palette.textColor,
                        fontSize: FontSizes.subtitle1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
