import 'dart:collection';

int hit = 0;
int fault = 0;
var toprint = <List>[];
List intpageFaults(List<int> pages, int n, int capcity) {
//   int hit = 0;
//   int fault = 0;

  var frameSize = capcity;
  var position = -1;
  List<int> frame = new List(capcity);
  var i = 0;
  for (i = 0; i < n; i++) {
    List<int> s1 = new List();
    if (!(frame.contains(pages[i]))) {
      position++;
      if (position > (frameSize - 1)) {
        position = 0;
      }
      frame[position] = pages[i];
      print("f1");
      print(frame);
      s1.addAll(frame);
      toprint.add(s1);
      fault++;
    } else if (frame.contains(pages[i])) {
      print("f2");
      s1.addAll(frame);
      print(frame);
      toprint.add(s1);
      hit++;
    }
  }
  return toprint;
}
void main()
{
  List<int> pgs = [1,4,2,6,8,7,3,2];
  intpageFaults(pgs, pgs.length, 3);
  print(toprint);
}

//test