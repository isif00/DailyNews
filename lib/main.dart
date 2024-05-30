import 'package:daily_news/config/theme/app_theme.dart';
import 'package:daily_news/features/daily_news/persentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:daily_news/features/daily_news/persentation/bloc/article/remote/remote_article_event.dart';
import 'package:daily_news/features/daily_news/persentation/pages/home/daily_news.dart';
import 'package:daily_news/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticle()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const DailyNews(),
        theme: theme(),
      ),
    );
  }
}


