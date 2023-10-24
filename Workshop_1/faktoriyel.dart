void main() {
  int sonuc = faktoriyelHesapla(2);
  print(sonuc);
}

int faktoriyelHesapla(int sayi) {
  if (sayi == 0 || sayi == 1) {
    return 1;
  }

  return sayi * faktoriyelHesapla(sayi - 1);
}
