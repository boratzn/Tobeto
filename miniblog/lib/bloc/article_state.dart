part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

final class ArticleInitial extends ArticleState {}

final class ArticleLoading extends ArticleState {}

final class ArticlesLoaded extends ArticleState {
  final List<Article> blogs;

  const ArticlesLoaded({required this.blogs});

  @override
  List<Object> get props => [blogs];
}

final class ArticleError extends ArticleState {}

final class ArticleDetailInitial extends ArticleState {}

class ArticlesDetailLoading extends ArticleState {}

final class ArticleDetailLoaded extends ArticleState {
  final Article blog;

  const ArticleDetailLoaded({required this.blog});

  @override
  List<Object> get props => [blog];
}

class ArticlesDetailError extends ArticleState {}
