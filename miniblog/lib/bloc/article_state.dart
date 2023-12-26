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

final class ArticleLoaded extends ArticleState {
  final Article blog;

  const ArticleLoaded({required this.blog});

  @override
  List<Object> get props => [blog];
}

final class ArticleError extends ArticleState {}
