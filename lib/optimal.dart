bool search(int key, List<int> fr){
  for(int i=0; i<fr.length; i++){
    if(fr.elementAt(i) == key)
      return true;
  }
  return false;
}

int predict(List<int> pg, List<int> fr, int pn, int index){
  int res = -1, farthest = index;
  for(int i=0; i<fr.length; i++){
    int j;
    for(j=index ; j<pn; j++){
      if(fr.elementAt(i) == pg.elementAt(j)){
        if( j > farthest){
          farthest = j;
          res = i;
        }
        break;
      }
    }
    if(j == pn)
      return i;
  }
  return (res == -1) ? 0 : res;
}

void optimalpage(List<int> pg, int pn, int fn){
  List<int> fr = new List();

  int hit=0;
  int miss=0;
  for(int i=0; i<pn; i++){
    print(fr);
    if(search(pg.elementAt(i),fr)){
      hit ++;
      continue;
    }
    if(fr.length < fn){
      fr.add(pg.elementAt(i));
    }
    else{
      int j = predict(pg, fr, pn, i+1);
      fr.removeAt(j);
      fr.insert(j, pg.elementAt(i));

    }
  }
  miss = pn - hit;
  print("No of hits = $hit");
  print("No of miss = $miss");
}
void main() {
  List<int> pages = [7, 0, 1, 2, 0, 3, 0, 4,
    2, 3, 0, 3, 2];

  int capacity = 4;
  optimalpage(pages, pages.length, capacity);
}