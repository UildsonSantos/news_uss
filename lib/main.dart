import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_uss/config/routes/routes.dart';
import 'package:news_uss/config/theme/app_themes.dart';
import 'package:news_uss/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_uss/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_uss/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_uss/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const DailyNews()),
    );
  }
}
