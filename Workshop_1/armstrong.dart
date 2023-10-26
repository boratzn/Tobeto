import 'dart:ffi';
import 'dart:math';

void main() {
  armstrongNumber(407);
}

void armstrongNumber(int sayi) {
  int sum = 0;
  List<String> numList = sayi.toString().split('');
  int len = numList.length;

  for (int i = 0; i < len; i++) {
    int currNum = int.parse(numList[i]);
    sum += pow(currNum, len).toInt();
  }

  if (sum == sayi) {
    print("Bu bir Armstrong sayıdır.");
  } else {
    print("Bu bir Armstrong sayı değildir.");
  }
}
