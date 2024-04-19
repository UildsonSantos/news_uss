import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_uss/features/daily_news/domain/entities/article.dart';
import 'package:news_uss/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_uss/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_uss/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  BlocBuilder<RemoteArticlesBloc, RemoteArticlesState> _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticlesError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteArticlesDone) {
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index],
              onArticlePressed: (article) =>
                  _onArticlePressed(context, article),
            );
          },
        );
      }
      return const SizedBox();
    });
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticleViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity articleEntity) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: articleEntity);
  }

  void _onShowSavedArticleViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
