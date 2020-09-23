import 'dart:math';

List<List> toprint = new List();
int randompage(List<int> pages, int n, int capacity) {
  List<int> s = new List();
  int pagefault = 0;
  int hit = 0;
  var j = new Random();
  for (int i = 0; i < n; i++) {
    List<int> s1 = new List();
    int n = j.nextInt(capacity);
    if (s.length < capacity) {
      if (!s.contains(pages[i])) {
        print(s);
        s.add(pages[i]);
        s1.addAll(s);
        toprint.add(s1);
        pagefault++;
      }
    } else {
      if (s.contains(pages[i])) {
        s1.addAll(s);
        toprint.add(s1);
        hit++;
      } else {
        s.removeAt(n);
        s.insert(n, pages[i]);
        s1.addAll(s);
        toprint.add(s1);
        pagefault++;
      }
    }
  }
  print(hit);
  return pagefault;
}
void main(){
  List<int> pgs = [1,4,2,6,8,7,3,2];
  randompage(pgs, pgs.length, 3);
  print(toprint);
}