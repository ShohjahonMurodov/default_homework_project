import 'package:flutter/cupertino.dart';
import 'package:homework/data/models/people_models.dart';
import 'package:homework/data/repository/app_repository.dart';

class PeopleViewModel extends ChangeNotifier {
  PeopleViewModel({required this.appRepository});

  final AppRepository appRepository;

  bool isLoading = false;
  List<PeopleModels> allPerson = [];

  fetchAllPerson() async {
    isLoading = true;
    var people = await appRepository.getPeople();
    isLoading = false;
    notifyListeners();
    if (people.isEmpty) {
    } else {
      allPerson = people;
      notifyListeners();
    }
  }
}
