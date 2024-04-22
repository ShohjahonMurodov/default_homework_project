import 'package:equatable/equatable.dart';
import 'package:homework/data/model/book_model.dart';

class BookState extends Equatable {
  const BookState({
    required this.progress,
    required this.newFileLocation,
    required this.books,
    required this.searchBooks,
  });

  final double progress;
  final String newFileLocation;
  final List<BookModel> books;
  final List<BookModel> searchBooks;

  BookState copyWith({
    double? progress,
    String? newFileLocation,
    List<BookModel>? books,
    List<BookModel>? searchBooks,
  }) {
    return BookState(
      progress: progress ?? this.progress,
      newFileLocation: newFileLocation ?? this.newFileLocation,
      books: books ?? this.books,
      searchBooks: searchBooks ?? this.searchBooks,
    );
  }

  @override
  List<Object?> get props => [progress, newFileLocation, books, searchBooks];
}
