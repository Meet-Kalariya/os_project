
List<List> toprint = new List();
int hit = 0;
int miss = 0;

bool search(int key, List<int> fr) {
  for (int i = 0; i < fr.length; i++) {
    if (fr.elementAt(i) == key) return true;
  }
  return false;
}

int predict(List<int> pg, List<int> fr, int pn, int index) {
  int res = -1, farthest = index;
  for (int i = 0; i < fr.length; i++) {
    int j;
    for (j = index; j < pn; j++) {
      if (fr.elementAt(i) == pg.elementAt(j)) {
        if (j > farthest) {
          farthest = j;
          res = i;
        }
        break;
      }
    }
    if (j == pn) return i;
  }
  return (res == -1) ? 0 : res;
}

void optimalpage(List<int> pg, int pn, int fn) {
  List<int> fr = new List();
  for (int i = 0; i < pn; i++) {
    List<int> s1 = new List();
    if (search(pg.elementAt(i), fr)) {
      s1.addAll(fr);
      toprint.add(s1);
      hit++;
      continue;
    }
    if (fr.length < fn) {
      fr.add(pg.elementAt(i));
      s1.addAll(fr);
      toprint.add(s1);
    } else {
      int j = predict(pg, fr, pn, i + 1);
      fr.removeAt(j);
      fr.insert(j, pg.elementAt(i));
      s1.addAll(fr);
      toprint.add(s1);
    }
  }
  miss = pn - hit;
}
void main(){
  List<int> pgs = [1,4,2,6,8,7,3,2];
  optimalpage(pgs, pgs.length, 3);
  print(toprint);
}