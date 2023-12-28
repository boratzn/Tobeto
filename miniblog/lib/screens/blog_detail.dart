import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/bloc/article_bloc.dart';
import 'package:miniblog/models/article.dart';

class BlogDetail extends StatefulWidget {
  const BlogDetail({super.key, required this.id});

  final String id;

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleDetailInitial) {
          context.read<ArticleBloc>().add(FetchArticleByID(id: widget.id));
          return const Text("İstek atılıyor..");
        }
        if (state is ArticlesDetailLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ArticleDetailLoaded) {
          Article blog = state.blog;
          return Scaffold(
            appBar: AppBar(
              title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, child: Text(blog.title)),
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    context.read<ArticleBloc>().add(FetchArticles());
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(blog.thumbnail),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    blog.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    blog.content,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Yazar : ${blog.author}",
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 16))
                ],
              ),
            ),
          );
        }

        if (state is ArticlesDetailError) {
          return const Center(
            child: Text("Bloglar yüklenirken bir hata oluştu."),
          );
        }

        return const Center(
          child: Scaffold(body: Text("Unknown State")),
        );
      },
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: blog == null
    //         ? null
    //         : SingleChildScrollView(
    //             scrollDirection: Axis.horizontal, child: Text(blog.title)),
    //     automaticallyImplyLeading: true,
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back),
    //       onPressed: () {
    //         Navigator.pop(context,
    //             true); // Geri butonuna basıldığında önceki sayfaya dönme işlemi
    //       },
    //     ),
    //   ),
    //   body: BlocBuilder<ArticleBloc, ArticleState>(
    //     builder: (context, state) {
    //       if (state is ArticleInitial) {
    //         // bloc'a fetcharticles eventi göndermek
    //         context
    //             .read<ArticleBloc>()
    //             .add(FetchArticleByID(id: widget.id)); // UI'dan BLOC'a Event
    //         return const Center(child: Text("İstek atılıyor..."));
    //       }

    //       if (state is ArticleLoading) {
    //         return const Center(child: CircularProgressIndicator());
    //       }

    //       if (state is ArticleLoaded) {
    //         blog = state.blog;
    //         return Padding(
    //           padding: const EdgeInsets.all(16.0),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               AspectRatio(
    //                 aspectRatio: 4 / 3,
    //                 child: Image.network(blog.thumbnail),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Text(
    //                 blog.title,
    //                 style: const TextStyle(
    //                     fontSize: 22, fontWeight: FontWeight.bold),
    //               ),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Text(
    //                 blog.content,
    //                 style: const TextStyle(
    //                   fontSize: 18,
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Text("Yazar : ${blog.author}",
    //                   style: TextStyle(color: Colors.black54, fontSize: 16))
    //             ],
    //           ),
    //         );
    //       }

    //       if (state is ArticleError) {
    //         return const Center(
    //           child: Text("Bloglar yüklenirken bir hata oluştu."),
    //         );
    //       }

    //       return const Center(
    //         child: Text("Unknown State"),
    //       );
    //     },
    //   ),
    // );
  }
}
