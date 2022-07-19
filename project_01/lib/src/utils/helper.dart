import 'dart:math';

class Helper {
  static int generateRandomNumber() {
    var rng = Random();
    var rand = rng.nextInt(100);
    return rand.toInt();
  }
}
