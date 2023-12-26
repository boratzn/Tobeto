import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/bloc/article_bloc.dart';
import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/widgets/blog_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloglar"),
        actions: [
          IconButton(
              onPressed: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddBlog()));

                if (result != null && result == true) {
                  context.read<ArticleBloc>().add(FetchArticles());
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleInitial) {
            // bloc'a fetcharticles eventi göndermek
            context
                .read<ArticleBloc>()
                .add(FetchArticles()); // UI'dan BLOC'a Event
            return const Center(child: Text("İstek atılıyor..."));
          }

          if (state is ArticleLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ArticlesLoaded) {
            return ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) =>
                    BlogItem(blog: state.blogs[index]));
          }

          if (state is ArticleError) {
            return const Center(
              child: Text("Bloglar yüklenirken bir hata oluştu."),
            );
          }

          return const Center(
            child: Text("Unknown State"),
          );
        },
      ),
    );
  }
}
