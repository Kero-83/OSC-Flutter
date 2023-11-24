import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/data_reciving_cubit.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_service.dart';
import 'package:news/views/home_screen.dart';
import 'package:news/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => DataRecivingCubit(),
    child: NewsApp(),
  ));
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    final futureTech =
        await NewsService(Dio()).getTopHeadlines(category: 'technology');
    articleTechList = futureTech;
    articleSportsList =
        await NewsService(Dio()).getTopHeadlines(category: 'sports');
    articleHealthList =
        await NewsService(Dio()).getTopHeadlines(category: 'health');
    articleScienceList =
        await NewsService(Dio()).getTopHeadlines(category: 'science');
    context.read<DataRecivingCubit>().dataRecived();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
