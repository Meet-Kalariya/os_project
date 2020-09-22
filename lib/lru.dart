
List<int> toprint = new List();
void main() {
  List<int> pages = [7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2];

  int capacity = 3;
  print(lru(pages, pages.length, capacity));
  print(toprint);
}

int lru(List<int> pages, int n, int capacity) {
  List<int> frame = new List();
  List<int> st = new List();
  int fault = 0;
  int hit = 0;
  for (int i = 0; i < n; i++) {
    if (!frame.contains(pages[i])) {
      if (frame.length < capacity) {
        frame.add(pages[i]);
        st.add((frame.length) - 1);
        if(frame.length<=capacity)
        {
          toprint.addAll(frame);
          for(int j=0;j<(capacity-frame.length);j++)
          {
            toprint.add(null);
          }

        }

        print("F - $frame");
        print("ST - $st");
        //  print(toprint);
      } else {
        int ind = st.removeAt(0);

        frame[ind] = pages[i];

        st.add(ind);
        toprint.addAll(frame);

        print("F - $frame");
        print("ST - $st");
        //print(toprint);

        fault += 1;
      }
    } else {
      st.add(st.removeAt(st.indexOf(frame.indexOf(pages[i]))));
      if(frame.length<=capacity)
      {
        toprint.addAll(frame);
        for(int j=0;j<(capacity-frame.length);j++)
        {
          toprint.add(null);
        }

      }
      else
        toprint.addAll(frame);

      hit++;
      print("F - $frame");
      print("ST - $st");
//        print(toprint);
    }
  }
  return fault;
}
