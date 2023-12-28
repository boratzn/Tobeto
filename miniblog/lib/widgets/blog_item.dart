import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/bloc/article_bloc.dart';
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
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (ctx, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () {
              if (state is! ArticleInitial) {
                ctx
                    .read<ArticleBloc>()
                    .add(ResetEvent(event: FetchArticleByID(id: blog.id)));
              }
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
                      aspectRatio: 4 / 2,
                      child: Hero(
                          tag: blog.id, child: Image.network(blog.thumbnail))),
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
      },
    );
  }
}
