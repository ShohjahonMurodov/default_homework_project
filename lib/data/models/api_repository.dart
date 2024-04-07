import 'package:homework/data/api_provider/api_provider.dart';
import 'package:homework/data/models/book_models.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<BookModels>> getAllBooks() => apiProvider.getAllBooks();

  Future<String> insertBook(BookModels bookModels) =>
      apiProvider.insertBooks(bookModels);

  Future<String> deleteBook(String uuid) => apiProvider.deleteBooks(uuid);

  Future<String> updateBook(BookModels bookModels) =>
      apiProvider.updateBooks(bookModels);
}
