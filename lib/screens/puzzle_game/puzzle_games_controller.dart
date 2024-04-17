import 'package:get/get.dart';
import 'package:homework/data/local/local_database.dart';
import 'package:homework/data/models/puzzle_model.dart';

class PuzzleController extends GetxController {
  var tiles = List<int>.generate(16, (index) => index).obs;

  RxInt counter = 0.obs;
  RxInt datetime = 0.obs;
  bool isTrue = true;

  @override
  void onInit() {
    super.onInit();
    tiles.shuffle();
  }

  bool isSorted() {
    for (int i = 0; i < tiles.length - 1; i++) {
      if (tiles[i] != i) {
        return false;
      }
    }
    isTrue = false;
    datetime = 0.obs;
    counter = 0.obs;
    return true;
  }

  void moveTile(int index) {
    if (index - 1 >= 0 && (index - 1) % 4 != 3 && tiles[index - 1] == 15) {
      counter++;
      swap(index, index - 1);
    } else if (index + 1 < 16 && index % 4 != 3 && tiles[index + 1] == 15) {
      counter++;
      swap(index, index + 1);
    } else if (index - 4 >= 0 && tiles[index - 4] == 15) {
      counter++;
      swap(index, index - 4);
    } else if (index + 4 < 16 && tiles[index + 4] == 15) {
      counter++;
      swap(index, index + 4);
    } else if (index - 1 >= 0 &&
        (index - 1) % 4 != 3 &&
        tiles[index - 1] == 15) {
      counter++;
      swap(index, index - 1);
    }
  }

  void swap(int i, int j) {
    int temp = tiles[i];
    tiles[i] = tiles[j];
    tiles[j] = temp;
  }

  Future<void> timerLogic() async {
    while (isTrue) {
      await Future.delayed(const Duration(seconds: 1));
      datetime++;
    }
  }

  getMinutelyText(int datetime) {
    int min = datetime ~/ 60;
    int sec = datetime % 60;

    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";

    return "$minute : $second";
  }
}
