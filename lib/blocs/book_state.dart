import 'package:homework/data/models/book_models.dart';

abstract class BookState {}

class BookInitialState extends BookState {}

class BookLoadingState extends BookState {}

class BookErrorState extends BookState {
  BookErrorState({required this.errorText});

  final String errorText;
}

class BookSuccessState extends BookState {
  BookSuccessState({required this.books});

  final List<BookModels> books;
}

class BookInsertState extends BookState {
  BookInsertState({required this.bookModels});

  final BookModels bookModels;
}

class BookDeleteState extends BookState {
  BookDeleteState({required this.uuid});

  final String uuid;
}

class BookUpdateState extends BookState {
  BookUpdateState({required this.bookModels});

  final BookModels bookModels;
}
