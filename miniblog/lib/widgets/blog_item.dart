import 'package:flutter/material.dart';
import 'package:miniblog/screens/blog_detail.dart';

import '../models/article.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({
    super.key,
    required this.blog,
  });

  final Article blog;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogDetail(id: blog.id),
              ));
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 4 / 2, child: Image.network(blog.thumbnail)),
              ListTile(
                title: Text(
                  blog.title,
                ),
                subtitle: Text(blog.author),
              )
            ],
          ),
        ),
      ),
    );
  }
}
