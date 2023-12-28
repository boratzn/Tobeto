part of 'article_bloc.dart';

abstract class ArticleEvent {}

class FetchArticles extends ArticleEvent {}

class FetchArticleByID extends ArticleEvent {
  final String id;

  FetchArticleByID({required this.id});
}

class AddArticle extends ArticleEvent {
  final Article article;
  final BuildContext context;

  AddArticle({required this.article, required this.context});
}

class ResetEvent extends ArticleEvent {
  final ArticleEvent event;

  ResetEvent({required this.event});
}
