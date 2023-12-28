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
              //Navigator.push() ile bir sayfaya geçtiğimizde Appbar da otomatik çıkan back_arrow u pasif hale getirir.
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    //Anasayfaya geri dönerken Bloc'a FetchArticles eventi yollayarak bütün verileri tekrar çekiyoruz.
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
  }
}
