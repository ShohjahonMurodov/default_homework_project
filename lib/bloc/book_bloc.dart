import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/book_event.dart';
import 'package:homework/bloc/book_state.dart';
import 'package:homework/data/model/book_model.dart';
import 'package:homework/data/model/book_status_model.dart';
import 'package:homework/data/model/category_model.dart';
import 'package:homework/services/book_manager_services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/local/local_variables.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc()
      : super(BookState(
          progress: 0,
          newFileLocation: "",
          books: books,
          searchBooks: books,
        )) {
    on<DownLoadEvent>(downloadBook);
    on<CategoryBooksEvent>(categoryBook);
    on<SearchBooksEvent>(searchBooks);
  }

  Future<void> downloadBook(DownLoadEvent event, emit) async {
    Dio dio = Dio();

    BookStatusModel bookStatusModel =
        await FileManagerService().checkFile(event.bookModel);

    if (bookStatusModel.isExist) {
      OpenFilex.open(bookStatusModel.newFileLocation);
    } else {
      await dio.download(
        event.bookModel.bookUrl,
        bookStatusModel.newFileLocation,
        onReceiveProgress: (count, total) async {
          emit(state.copyWith(progress: count / total));
        },
      );
      emit(state.copyWith(
        progress: 1,
        newFileLocation: bookStatusModel.newFileLocation,
      ));
    }
  }

  Future<void> categoryBook(CategoryBooksEvent event, emit) async {
    List<BookModel> booksModel = [];

    if (event.categoryModel == CategoryModel.all) {
      emit(state.copyWith(books: books));
    } else {
      booksModel = books
          .where((element) =>
              element.categoryModel.name == event.categoryModel.name)
          .toList();
      emit(state.copyWith(books: booksModel));
    }
  }

  Future<void> searchBooks(SearchBooksEvent event, emit) async {
    List<BookModel> searchBooks = [];

    if (event.value.isEmpty) {
      emit(state.copyWith(searchBooks: books));
    } else {
      searchBooks = books
          .where((element) => element.bookName
              .toLowerCase()
              .contains(event.value.toLowerCase()))
          .toList();
      emit(state.copyWith(searchBooks: searchBooks));
    }
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;

    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory("/storage/emulated/0/Download");
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (error) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }
}
