import 'package:bloc/bloc.dart';
import 'package:homework/blocs/book_event.dart';
import 'package:homework/blocs/book_state.dart';
import 'package:homework/data/models/api_repository.dart';
import 'package:homework/data/models/book_models.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc({required this.apiRepository}) : super(BookInitialState()) {
    on<GetBookEvent>((event, emit) async {
      emit(BookLoadingState());
      List<BookModels> list = await apiRepository.getAllBooks();
      if (list.isEmpty) {
        emit(BookErrorState(errorText: "Something went wrong"));
      } else {
        emit(BookSuccessState(books: list));
      }
    });
    on<InsertBookEvent>((event, emit) async {
      emit(BookLoadingState());
      await apiRepository.insertBook(event.bookModels);
      List<BookModels> list = await apiRepository.getAllBooks();
      emit(BookSuccessState(books: list));
    });

    on<DeleteBookEvent>((event, emit) async {
      emit(BookLoadingState());
      await apiRepository.deleteBook(event.uuid);
      List<BookModels> list = await apiRepository.getAllBooks();
      emit(BookSuccessState(books: list));
    });

    on<UpdateBookEvent>((event, emit) async {
      emit(BookLoadingState());
      await apiRepository.updateBook(event.bookModels);
      List<BookModels> list = await apiRepository.getAllBooks();
      emit(BookSuccessState(books: list));
    });
  }

  final ApiRepository apiRepository;
}
