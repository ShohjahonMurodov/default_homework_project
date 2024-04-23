import 'dart:io';
import 'dart:isolate';
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
    on<DownLoadEvent>(_downloadFile);
    on<CategoryBooksEvent>(categoryBook);
    on<SearchBooksEvent>(searchBooks);
  }

  Future<void> _downloadFile(DownLoadEvent event, emit) async {
    Dio dio = Dio();

    BookStatusModel fileStatusModel = await getStatus(event.bookModel);

    if (fileStatusModel.isExist) {
      OpenFilex.open(fileStatusModel.newFileLocation);
    } else {
      await dio.download(
        event.bookModel.bookUrl,
        fileStatusModel.newFileLocation,
        onReceiveProgress: (count, total) async {
          emit(state.copyWith(progress: count / total));
        },
      );
      await FileManagerService.init();
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: fileStatusModel.newFileLocation,
        ),
      );
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

  Future<BookStatusModel> getStatus(BookModel fileDataModel) async {
    final BookStatusModel fileStatusModel =
        await Isolate.run<BookStatusModel>(() async {
      return await FileManagerService.checkFile(fileDataModel);
    });
    return fileStatusModel;
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
}
