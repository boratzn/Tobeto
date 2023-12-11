import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/details.dart';
import 'package:meal_app/repo/yemekler_dao_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class MealView extends StatelessWidget {
  const MealView({
    Key? key,
    required String idMeal,
    required YemeklerDaoRepository repository,
    required this.appBarTitle,
  })  : _repository = repository,
        _idMeal = idMeal,
        super(key: key);

  final YemeklerDaoRepository _repository;
  final String _idMeal;
  final String appBarTitle;

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 16,
      ),
      textAlign: TextAlign.justify,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Center(
        child: FutureBuilder<List<MealDetails>>(
          future: _repository.yemekDetayi(_idMeal),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var newItem = snapshot.data;
              var tags = newItem![0].strTags != null
                  ? newItem[0].strTags!.split(',')
                  : [];
              return ListView(
                padding: const EdgeInsets.all(14.0),
                children: [
                  Image.network('${newItem[0].strMealThumb}'),
                  const SizedBox(
                    height: 12.0,
                  ),
                  tags.isNotEmpty
                      ? Row(
                          children: [
                            for (var tag in tags)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  backgroundColor: Colors.black12,
                                  label: Text(tag),
                                ),
                              )
                          ],
                        )
                      : Center(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${newItem[0].strMeal}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      _buildSubtitle('Categoria: '),
                      _buildDescription(newItem[0].strCategory ?? ""),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      _buildSubtitle('Área: '),
                      _buildDescription(newItem[0].strArea ?? ""),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      _buildSubtitle('YouTube: '),
                      Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: RichText(
                              text: TextSpan(
                                text: newItem[0].strYoutube,
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL(newItem[0].strYoutube!);
                                  },
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _buildSubtitle('Instruction:'),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildDescription(newItem[0].strInstructions ?? ""),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
