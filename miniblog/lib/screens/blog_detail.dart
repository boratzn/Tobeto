import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miniblog/models/article.dart';
import 'package:http/http.dart' as http;

class BlogDetail extends StatefulWidget {
  const BlogDetail({super.key, required this.id});

  final String id;

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  var blog;

  getArticleById() async {
    final url = Uri.parse(
        "https://tobetoapi.halitkalayci.com/api/Articles/${widget.id}");
    final response = await http.get(url);
    final jsonData = jsonDecode(response.body);

    setState(() {
      blog = Article.fromJson(jsonData);
    });
  }

  @override
  void initState() {
    super.initState();
    getArticleById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: blog == null
            ? null
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: Text(blog.title)),
      ),
      body: blog == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                      style: TextStyle(color: Colors.black54, fontSize: 16))
                ],
              ),
            ),
    );
  }
}
