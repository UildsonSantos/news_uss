import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_uss/features/daily_news/domain/entities/article.dart';
import 'package:news_uss/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_uss/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_uss/injection_container.dart';

class ArticleDetailsView extends HookWidget {
  final ArticleEntity? articleEntity;

  const ArticleDetailsView({super.key, this.articleEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        leading: Builder(
            builder: (context) => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _onBackButtonTapped(context),
                  child: const Icon(
                    Ionicons.chevron_back,
                    color: Colors.black,
                  ),
                )));
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(),
          _buildArticleImage(),
          _buildArticleDescription()
        ],
      ),
    );
  }

  Padding _buildArticleTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            articleEntity!.title!,
            style: const TextStyle(
              fontFamily: 'Butler',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          // DateTime
          Row(
            children: [
              const Icon(
                Ionicons.time_outline,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                articleEntity!.publishedAt!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(
        articleEntity!.urlToImage!,
        fit: BoxFit.cover,
      ),
    );
  }

  Text _buildArticleDescription() {
    return Text(
      '${articleEntity!.description ?? ''}\n\n${articleEntity!.content ?? ''}',
      style: const TextStyle(fontSize: 16.0),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  Builder _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatinActionButtonPress(context),
        child: const Icon(
          Ionicons.bookmark,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onFloatinActionButtonPress(BuildContext context) {
    BlocProvider.of<LocalArticleBloc>(context).add(SaveArticle(articleEntity!));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text('Article saved successfully.'),
    ));
  }
}
