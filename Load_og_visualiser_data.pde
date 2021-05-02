import java.util.Collections;

Table table;
ArrayList<State> states;
float scrollX;
int maxArea;
float scale;
int sortMode;


void setup(){
  table = loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv", "header");
  states = new ArrayList<State>();
  scrollX = 0;
  maxArea = 0;
  sortMode = 0;
  
  for(TableRow r:table.rows ()){
    String s = r.getString("state");
    int area = r.getInt("area (sq. mi)");
    State state = new State(s, area);
    states.add(state);
    if(area > maxArea){
      maxArea = area;
    }
  }
  
  size(1280, 720);
  scale = float(height - 150)/maxArea;
  println("Height: " + height);
  println("Max Area: " + maxArea);
  println("Scale: " + scale);
}

void mouseWheel(MouseEvent event) {
  scrollX += event.getCount() * 30;
}

void keyPressed() {
  if(key == '+'){
    scale *= 1.05f;
  }
  if(key == '-'){
    scale *= 0.95f;
  }
  if(key == ' '){
    sortMode = (sortMode + 1) % 2;
    sort();
  }
}

void sort(){
  if(sortMode == 0){
    Collections.sort(states, new AlphabeticComparator());
  }
  else if(sortMode == 1){
    Collections.sort(states, new AreaComparator());
  }
}

void draw(){
  background(55);
  textSize(32);
  fill(255);
  String sortText = "Sorting: " + (sortMode == 0 ? "Alphabetic" : "Area");
  text(sortText, 20, 30);

  float formattedScale = scale*1000f;
  String scaleText = "Scale: " + formattedScale;
  text(scaleText, width - 20 - textWidth(scaleText), 30);
  int x = 0;
  for(State s : states){
    s.draw(int(x + scrollX), scale);
    x += 300;
  }
}
