import 'package:flutter/material.dart';
import 'package:news_uss/features/daily_news/domain/entities/article.dart';
import 'package:news_uss/features/daily_news/presentation/pages/article_datail/article_detail.dart';
import 'package:news_uss/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_uss/features/daily_news/presentation/pages/saved_articles/saved_articles.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsView(
            articleEntity: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
