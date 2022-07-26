import 'dart:math';

class CommonOps {
  static String generateId(List<String> ids) {
    String key = "0";
    do {
      Random rand = Random();
      key = rand.nextInt(500000).toString();
    } while (ids.contains(key) == true);
    return key;
  }
}
