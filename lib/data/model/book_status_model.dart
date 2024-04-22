class BookStatusModel {
  final bool isExist;
  final String newFileLocation;

  BookStatusModel({
    required this.newFileLocation,
    required this.isExist,
  });

  BookStatusModel copyWith({bool? isExist, String? newFileLocation}) =>
      BookStatusModel(
        newFileLocation: newFileLocation ?? this.newFileLocation,
        isExist: isExist ?? this.isExist,
      );
}
