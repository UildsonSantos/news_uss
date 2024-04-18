import 'package:equatable/equatable.dart';

import 'package:news_uss/features/daily_news/domain/entities/article.dart';

sealed class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

final class LocalArticleInitial extends LocalArticleState {}

class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone(List<ArticleEntity> articles)
      : super(articles: articles);
}
