import 'package:news_uss/core/resouces/data_state.dart';
import 'package:news_uss/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
