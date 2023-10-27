import 'dart:math';

void main() {
  armstrongNumber(407);
}

void armstrongNumber(int sayi) {
  int sum = 0;
  List<String> numList = sayi.toString().split('');
  int len = numList.length;

  for (String number in numList) {
    sum += pow(int.parse(number), len).toInt();
  }

  if (sum == sayi) {
    print("Bu bir Armstrong sayıdır.");
  } else {
    print("Bu bir Armstrong sayı değildir.");
  }
}
