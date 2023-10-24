void main() {
  asalSayilariBul(100);
  int sonuc = faktoriyelHesapla(2);
  print(sonuc);
}

void asalSayilariBul(int finish) {
  for (int i = 2; i <= finish; i++) {
    int kntrl = 0;

    for (int j = 2; j < i; j++) {
      if (i % j == 0) {
        kntrl = 1;
        break;
      }
    }

    if (kntrl == 0) {
      print(i);
    }
  }
}

int faktoriyelHesapla(int sayi) {
  if (sayi == 0 || sayi == 1) {
    return 1;
  }

  return sayi * faktoriyelHesapla(sayi - 1);
}
