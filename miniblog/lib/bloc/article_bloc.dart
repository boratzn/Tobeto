import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/models/article.dart';
import 'package:miniblog/repositories/article_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;

  ArticleBloc({required this.articleRepository}) : super(ArticleInitial()) {
    on<FetchArticles>(_onFetchArticles);
    on<FetchArticleByID>(_onFetchArticleById);
    on<AddArticle>(_onAddArticle);
  }

  _onFetchArticles(FetchArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());

    try {
      final articles = await articleRepository.getArticles();
      emit(ArticlesLoaded(blogs: articles));
    } catch (e) {
      emit(ArticleError());
    }
  }

  _onFetchArticleById(
      FetchArticleByID event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());

    try {
      final article = await articleRepository.getArticleById(event.id);
      emit(
        ArticleLoaded(blog: article),
      );
    } catch (e) {
      emit(ArticleError());
    }
  }

  _onAddArticle(AddArticle event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());

    try {
      await articleRepository.submitForm(event.article, event.context);
      final articles = await articleRepository.getArticles();
      emit(
        ArticlesLoaded(blogs: articles),
      );
    } catch (e) {
      emit(ArticleError());
    }
  }
}
