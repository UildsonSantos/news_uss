import 'package:news_uss/core/resouces/data_state.dart';
import 'package:news_uss/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> savedArticle(ArticleEntity articleEntity);

  Future<void> removeArticle(ArticleEntity articleEntity);
}
