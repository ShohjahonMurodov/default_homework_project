class PlaceModel {
  PlaceModel({
    required this.placeCategory,
    required this.latLng,
    required this.placeName,
    required this.entrance,
    required this.flatNumber,
    required this.orientAddress,
    required this.stage,
    required this.docId,
    required this.latLong,
  });

  final String docId;
  final double latLng;
  final double latLong;
  final String placeName;
  final String placeCategory;
  final String entrance;
  final String stage;
  final String flatNumber;
  final String orientAddress;

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      docId: json["doc_id"] as String? ?? "",
      placeCategory: json["place_category"] as String? ?? "",
      latLng: json["latLng"],
      latLong: json["latLong"],
      placeName: json["place_name"] as String? ?? "",
      entrance: json["entrance"] as String? ?? "",
      flatNumber: json["flat_number"] as String? ?? "",
      orientAddress: json["orient_address"],
      stage: json["stage"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "place_category": placeCategory,
      "latLng": latLng,
      "latLong": latLong,
      "place_name": placeName,
      "entrance": entrance,
      "flat_number": flatNumber,
      "orient_address": orientAddress,
      "stage": stage,
      "doc_id": docId,
    };
  }

  Map<String, dynamic> toUpdateJson() {
    return {
      "place_category": placeCategory,
      "latLng": latLng,
      "latLong": latLong,
      "place_name": placeName,
      "entrance": entrance,
      "flat_number": flatNumber,
      "orient_address": orientAddress,
      "stage": stage,
    };
  }
}
