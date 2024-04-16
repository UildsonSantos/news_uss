import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:news_uss/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? article;
  final DioException? error;

  const RemoteArticlesState({
    this.article,
    this.error,
  });

  @override
  List<Object> get props => [article!, error!];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> article)
      : super(article: article);
}

class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
