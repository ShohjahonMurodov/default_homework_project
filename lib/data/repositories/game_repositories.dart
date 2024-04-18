import 'package:homework/data/models/game_models.dart';

class GameRepository {
  GameRepository();

  List<GameModels> questions = [
    GameModels(
      trueAnswer: "sut",
      images: [
        "https://s0.rbk.ru/v6_top_pics/media/img/0/78/756801770042780.webp",
        "https://c.files.bbci.co.uk/517E/production/_109926802_milkcow.jpg",
        "https://thumbs.dreamstime.com/b/goat-11661115.jpg",
        "https://cdn.cdnparenting.com/articles/2018/01/158543912-H-1024x700.webp",
      ],
    ),
    GameModels(
      trueAnswer: "avtomobil",
      images: [
        "https://img.freepik.com/free-photo/sports-car-driving-asphalt-road-night-generative-ai_188544-8052.jpg",
        "https://media.architecturaldigest.com/photos/63079fc7b4858efb76814bd2/16:9/w_4000,h_2250,c_limit/9.%20DeLorean-Alpha-5%20%5BDeLorean%5D.jpg",
        "https://www.rbc.ua/static/img/t/u/tusimple_autonomous_truck_1200x675.jpg",
        "https://s0.rbk.ru/v6_top_pics/media/img/7/70/755254270044707.jpg",
      ],
    ),
  ];

  GameRepository.createEmpty() {
    questions = [];
  }
}
