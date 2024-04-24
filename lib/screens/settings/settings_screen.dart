import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/book_bloc.dart';
import 'package:homework/bloc/book_event.dart';
import 'package:homework/bloc/book_state.dart';
import 'package:homework/data/model/book_model.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:open_filex/open_filex.dart';

import '../../services/book_manager_services.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("File Managaer Screen"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: List.generate(
          context.read<BookBloc>().state.books.length,
          (index) {
            BookModel fileDataModel =
                context.read<BookBloc>().state.books[index];

            BookBloc fileManagerBloc = BookBloc();

            return BlocProvider.value(
              value: fileManagerBloc,
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  debugPrint("CURRENT MB: ${state.progress}");
                  String filePath = FileManagerService.isExist(
                    fileDataModel.bookUrl,
                    fileDataModel.bookName,
                  );
                  return Column(
                    children: [
                      ListTile(
                        title: Text(fileDataModel.bookName),
                        subtitle: Text(fileDataModel.bookUrl),
                        trailing: IconButton(
                            onPressed: () async {
                              if (filePath.isNotEmpty) {
                                await OpenFilex.open(filePath);
                              } else {
                                fileManagerBloc.add(
                                  DownLoadEvent(
                                    bookModel: fileDataModel,
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              filePath.isNotEmpty
                                  ? Icons.check
                                  : Icons.download,
                              color: Colors.blue,
                            )),
                      ),
                      Visibility(
                        visible: state.progress != 0,
                        child: LinearProgressIndicator(
                          value: state.progress,
                          backgroundColor: Colors.grey,
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
