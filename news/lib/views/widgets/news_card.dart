// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

String limitStringLength(String input, int maxLength) {
  if (input.length <= maxLength) {
    return input;
  } else {
    return "${input.substring(0, maxLength)}...";
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  String? content;
  final String imageUrl;

  NewsCard({
    super.key,
    required this.title,
    required String content,
    required this.imageUrl,
  }) {
    this.content = limitStringLength(content, 100);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(content!),
            ),
          ],
        ),
      ),
    );
  }
}
