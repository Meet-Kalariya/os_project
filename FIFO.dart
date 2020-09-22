

int hit = 0;
int fault = 0;
List<int> toprint = new List();
int intpageFaults(List<int> pages, int n, int capcity){
//   int hit = 0;
//   int fault = 0;
  int frameSize = capcity;
  int position = -1;
  List<int> frame =  new List(frameSize);
  int i = 0;
  
  for(i=0;i<n;i++)
  {
    if(!(frame.contains(pages[i])))
    {
      position++;
      if(position>(frameSize-1))
        position=0;
      frame[position] = pages[i];
      print(frame);
      toprint.addAll(frame);
      fault++;
      
    }
    else if(frame.contains(pages[i]))
    {
      print(frame);
      toprint.addAll(frame);
      hit++;
    }
  }
  return fault;
}

void main() {
  List<int> pages = [7, 0, 1, 2, 0, 3, 0, 4, 
                        2, 3, 0, 3, 2];
  
  
  int capacity = 4;
  print(intpageFaults(pages, pages.length, capacity));
  print(hit);
  print(toprint);
  print(toprint[1]);
 }
