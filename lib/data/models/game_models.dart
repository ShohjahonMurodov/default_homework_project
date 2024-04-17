class GameModels {
  GameModels({required this.riddle, required this.result});

  final String riddle;
  final String result;
}

List<GameModels> riddles = [
  GameModels(
    riddle: "Alisherning ismi nima?",
    result: "alisher",
  ),
  GameModels(
    riddle: "Suhrobning ismi nima?",
    result: "suhrob",
  ),
  GameModels(
    riddle: "Shohjahonning ismi nima?",
    result: "shohjahon",
  ),
  GameModels(
    riddle: "Abubakrning ismi nima?",
    result: "abubakr",
  ),
];
