import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miniblog/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/widgets/blog_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> blogs = [];

  Future<List<dynamic>> getArticles() async {
    final url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    final response = await http.get(url);
    final List jsonData = jsonDecode(response.body);

    return jsonData.map((e) => Article.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    getArticles().then((value) {
      setState(() {
        blogs = value;
      });
    });
  }

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

                if (result != null && result == true) getArticles();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: blogs.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder<List<dynamic>>(
              future: getArticles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Veri yüklenirken gösterilecek bir widget
                } else if (snapshot.hasError) {
                  return Text(
                      'Hata: ${snapshot.error}'); // Hata durumunda gösterilecek bir widget
                } else if (snapshot.hasData) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      getArticles();
                    },
                    child: ListView.builder(
                      itemCount: blogs.length,
                      itemBuilder: (context, index) {
                        Article blog = blogs[index];
                        return BlogItem(blog: blog);
                      },
                    ),
                  ); // Veri geldiğinde gösterilecek bir widget
                } else {
                  return const Text(
                      'Beklenmeyen bir durum oluştu'); // Beklenmeyen bir durumda gösterilecek bir widget
                }
              },
            ),
    );
  }
}
