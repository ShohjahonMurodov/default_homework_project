import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:homework/data/models/place/place_model.dart';
import 'package:homework/utils/app_constants.dart';
import 'package:homework/utils/functions.dart';

class PlaceViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get getLoader => _isLoading;

  List<PlaceModel> categoryProduct = [];

  Stream<List<PlaceModel>> listenProducts() {
    return FirebaseFirestore.instance
        .collection(AppConstants.tableName)
        .snapshots()
        .map(
          (event) =>
              event.docs.map((doc) => PlaceModel.fromJson(doc.data())).toList(),
        );
  }

  Future<void> getProducts() async {
    _notify(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.tableName)
        .get()
        .then((value) {
      categoryProduct =
          value.docs.map((e) => PlaceModel.fromJson(e.data())).toList();
    });
    globalProducts = categoryProduct;
    _notify(false);
  }

  Future<void> getProductsByCategory(String categoryDocId) async {
    _notify(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.tableName)
        .where("category_id", isEqualTo: categoryDocId)
        .get()
        .then((snapshot) {
      categoryProduct =
          snapshot.docs.map((e) => PlaceModel.fromJson(e.data())).toList();
    });
    _notify(false);
  }

  insertProducts(PlaceModel placeModel, BuildContext context) async {
    try {
      _notify(true);
      var cf = await FirebaseFirestore.instance
          .collection(AppConstants.tableName)
          .add(placeModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.tableName)
          .doc(cf.id)
          .update({"doc_id": cf.id});

      _notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(
        context: context,
        message: error.code,
      );
    }
  }

  updateProduct(PlaceModel placeModel, BuildContext context) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.tableName)
          .doc(placeModel.docId)
          .update(placeModel.toUpdateJson());

      _notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(
        context: context,
        message: error.code,
      );
    }
  }

  deleteProduct(PlaceModel placeModel, BuildContext context) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.tableName)
          .doc(placeModel.docId)
          .delete();

      _notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(
        context: context,
        message: error.code,
      );
    }
  }

  _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }
}

List<PlaceModel> globalProducts = [];