import 'package:homework/data/models/book_models.dart';

abstract class BookEvent {}

class GetBookEvent extends BookEvent {}

class InsertBookEvent extends BookEvent {
  InsertBookEvent({required this.bookModels});

  final BookModels bookModels;
}

class DeleteBookEvent extends BookEvent {
  DeleteBookEvent({required this.uuid});

  final String uuid;
}

class UpdateBookEvent extends BookEvent {
  UpdateBookEvent({required this.bookModels});

  final BookModels bookModels;
}
