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

  getArticleById(String id) async {
    final url =
        Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles/$id");
    final response = await http.get(url);
    final jsonData = jsonDecode(response.body);

    setState(() {
      blog = Article.fromJson(jsonData);
    });
  }

  @override
  void initState() {
    super.initState();
    getArticleById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: blog == null ? null : Text(blog.title),
      ),
      body: blog == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Card(
              child: Column(
                children: [Image.network(blog.thumbnail)],
              ),
            ),
    );
  }
}
