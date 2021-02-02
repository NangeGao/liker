import 'dart:math';

const int MAX_AMOUNT = 120;

// 洗牌算法生成一个n位数组
List shuffle(n) {
  final initList = List.generate(MAX_AMOUNT, (i) {
    return i;
  }).toList();
  List.generate(MAX_AMOUNT, (i) {
    final rng = new Random();
    final fixedNum = rng.nextInt(MAX_AMOUNT - i) + i;
    final temp = initList[i];
    initList[i] = initList[fixedNum];
    initList[fixedNum] = temp;
  });

  // print('----------, $initList');
  return initList.take(n).toList();
}
