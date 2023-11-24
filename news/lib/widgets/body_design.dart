import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/data_reciving_cubit.dart';
import 'package:news/models/article_model.dart';
import 'package:news/widgets/loading_screen.dart';
import 'package:news/widgets/news_card.dart';
import 'package:news/widgets/news_element.dart';

class BodyDesign extends StatelessWidget {
  final String category;

  const BodyDesign({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataRecivingCubit, DataRecivingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return (state.isLoading)
              ? const LoadingScreen()
              : ListView.builder(
                  itemCount: articleList(category).length,
                  itemBuilder: (context, index) {
                    if (articleList(category)[index].title != '' &&
                        articleList(category)[index].title != "[Removed]") {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            elevation: MaterialStatePropertyAll(0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsElement(
                                    title: articleList(category)[index].title,
                                    content:
                                        articleList(category)[index].subTitle ??
                                            '',
                                    imageUrl:
                                        articleList(category)[index].image ??
                                            emptyImage(category),
                                  ),
                                ));
                          },
                          child: NewsCard(
                            content:
                                articleList(category)[index].subTitle ?? '',
                            title: articleList(category)[index].title,
                            imageUrl: articleList(category)[index].image ??
                                emptyImage(category),
                          ),
                        ),
                      );
                    }
                    return null;
                  });
        });
  }

  List<ArticleModel> articleList(String category) {
    if (category == 'Sports') {
      return articleSportsList;
    } else if (category == 'Tech') {
      return articleTechList;
    } else if (category == 'Health') {
      return articleHealthList;
    }
    return articleScienceList;
  }

  String emptyImage(String category) {
    switch (category) {
      case 'Sports':
        return 'https://media.istockphoto.com/id/1141191007/vector/sports-set-of-athletes-of-various-sports-disciplines-isolated-vector-silhouettes-run-soccer.jpg?s=612x612&w=0&k=20&c=SEabW4SHZ7blMHJPxZNSTl_anOMHO3whQI7HIMxFpSg=';
      case 'Health':
        return 'https://st.depositphotos.com/1028979/4049/i/450/depositphotos_40493159-stock-photo-doctor-working-with-healthcare-icons.jpg';
      case 'Science':
        return 'https://img.freepik.com/premium-vector/abstract-biology-pharmaceutical-technology-background-health-care-medical-background-with-hexagons-shapes-flowing-wave-lines-hexagons-vector-illustration_230610-1303.jpg?size=626&ext=jpg&ga=GA1.1.867424154.1698451200&semt=ais';
      case 'Tech':
        return 'https://media.istockphoto.com/id/1439425791/photo/digital-technology-software-development-concept-coding-programmer-working-on-laptop-with.webp?b=1&s=170667a&w=0&k=20&c=c0Q8u1Y5yFJCDxltBZd0RAn1g01Se6qCjZGS5q9XLZs=';
      default:
        return 'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg';
    }
  }
}
