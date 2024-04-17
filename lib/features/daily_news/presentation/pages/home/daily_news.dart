import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_uss/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_uss/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
          itemCount: state.article!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          },
        );
      }
      return const SizedBox();
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}