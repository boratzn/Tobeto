import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:miniblog/models/article.dart';

class ArticleRepository {
  Future<List<Article>> getArticles() async {
    final url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    final response = await http.get(url);
    final List jsonData = jsonDecode(response.body);

    return jsonData.map((e) => Article.fromJson(e)).toList();
  }

  Future<Article> getArticleById(String id) async {
    final url = Uri.parse(
      "https://tobetoapi.halitkalayci.com/api/Articles/$id",
    );
    final response = await http.get(url);
    final jsonData = jsonDecode(response.body);

    return Article.fromJson(jsonData);
  }

  submitForm(Article blog, BuildContext context) async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    var request = http.MultipartRequest("POST", url);

    request.files
        .add(await http.MultipartFile.fromPath("File", blog.thumbnail));

    request.fields['Title'] = blog.title;
    request.fields['Content'] = blog.content;
    request.fields['Author'] = blog.author;

    final response = await request.send();

    if (response.statusCode == 201) {
      Navigator.pop(context, true);
    }
  }
}
