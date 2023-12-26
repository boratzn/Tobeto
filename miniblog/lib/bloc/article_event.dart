part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {}

class FetchArticles extends ArticleEvent {
  @override
  List<Object?> get props => [];
}

class FetchArticleByID extends ArticleEvent {
  final String id;

  FetchArticleByID({required this.id});

  @override
  List<Object?> get props => [id];
}

class AddArticle extends ArticleEvent {
  final Article article;
  final BuildContext context;

  AddArticle({required this.article, required this.context});

  @override
  List<Object?> get props => [article, context];
}
