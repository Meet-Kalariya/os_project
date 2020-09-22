import 'dart:math';
int randompage(List<int> pages,int n, int capacity){
  List<int> frame = new List();
  int fault=0;
  int hit=0;
  var j = new Random();
  for(int i=0; i < n; i++){
    int n = j.nextInt(capacity);
    //print(n);
    if(frame.length < capacity){
      if(!frame.contains(pages[i])){
        print(frame);
        frame.add(pages[i]);
        fault++;
      }
    }
    else{
      if(frame.contains(pages[i])){
        print(frame);
        hit++;
      }
      else{
        frame.removeAt(n);
        frame.insert(n, pages[i]);
        print(frame);
        fault++;

      }
    }
  }
  print(hit);
  return fault;
}
void main() {
  List<int> pages = [7, 0, 1, 2, 0, 3, 0, 4,
    2, 3, 0, 3, 2];

  int capacity = 4;
  print(randompage(pages,pages.length, capacity));
}