import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:homework/data/models/book_models.dart';
import 'package:homework/utils/app_constants.dart';

class ApiProvider {
  Future<List<BookModels>> getAllBooks() async {
    List<BookModels> list = [];

    Dio dio = Dio();

    try {
      Response response = await dio.get(
        "https://crudapi.co.uk/api/v1/book",
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        list = (response.data["items"] as List?)
                ?.map((e) => BookModels.fromJson(e))
                .toList() ??
            [];
        return list;
      }
    } catch (error) {
      debugPrint("Error: $error");
    }
    return list;
  }

  Future<String> insertBooks(BookModels bookModels) async {
    Dio dio = Dio();

    String text = "";

    try {
      Response response = await dio.post(
        "https://crudapi.co.uk/api/v1/book",
        data: jsonEncode([bookModels.toJson()]),
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 201) {
        text = "Created model";
      }
    } catch (error) {
      debugPrint("Error: $error");
    }
    return text;
  }

  Future<String> deleteBooks(String uuid) async {
    Dio dio = Dio();

    String text = "";

    try {
      Response response = await dio.delete(
        "https://crudapi.co.uk/api/v1/book",
        data: jsonEncode([
          {"_uuid": uuid}
        ]),
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        text = "Delete model";
      }
    } catch (error) {
      debugPrint("Error: $error");
    }
    return text;
  }

  Future<String> updateBooks(BookModels bookModels) async {
    Dio dio = Dio();

    String text = "";

    try {
      Response response = await dio.put(
        "https://crudapi.co.uk/api/v1/book",
        data: jsonEncode([bookModels.toJsonForUpdate()]),
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        text = "Created model";
      }
    } catch (error) {
      debugPrint("Error: $error");
    }
    return text;
  }
}
