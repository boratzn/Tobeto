import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;
  String title = '';
  String content = '';
  String author = '';

  openImagePicker() async {
    XFile? selectedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = selectedFile;
    });
  }

  submitForm() async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    var request = http.MultipartRequest("POST", url);

    if (selectedImage != null) {
      request.files
          .add(await http.MultipartFile.fromPath("File", selectedImage!.path));
    }

    request.fields['Title'] = title;
    request.fields['Content'] = content;
    request.fields['Author'] = author;

    final response = await request.send();

    if (response.statusCode == 201) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Blog Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Center(
            child: ListView(
              children: [
                if (selectedImage != null)
                  Image.file(File(selectedImage!.path),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fitHeight),
                ElevatedButton(
                    onPressed: () {
                      openImagePicker();
                    },
                    child: const Text("Resim Seç")),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Blog Başlığı"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Başlık alanı boş bırakılamaz.";
                    }
                    return null;
                  },
                  onSaved: (newValue) => title = newValue!,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Blog İçeriği"),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Blog İçeriği boş bırakılamaz.";
                    }
                    return null;
                  },
                  onSaved: (newValue) => content = newValue!,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Ad Soyad"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ad Soyad alanı boş bırakılamaz.";
                    }
                    return null;
                  },
                  onSaved: (newValue) => author = newValue!,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("GÖNDER"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
