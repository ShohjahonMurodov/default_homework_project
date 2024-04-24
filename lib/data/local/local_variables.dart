import 'package:homework/data/model/book_model.dart';
import 'package:homework/data/model/category_model.dart';

List<BookModel> books = [
  BookModel(
    imagePath:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1200px-Python-logo-notext.svg.png",
    bookName: "PythonBooks",
    bookUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
    categoryModel: CategoryModel.lesson,
  ),
  BookModel(
    imagePath:
        "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",
    bookName: "Mountains7",
    bookUrl:
        "https://cdn.pixabay.com/video/2020/09/02/48873-457671829_large.mp4",
    categoryModel: CategoryModel.action,
  ),
];
