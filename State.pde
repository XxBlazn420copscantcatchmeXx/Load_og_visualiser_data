class State {
  private String name;
  private int area;
  
  public State(String name, int area){
    this.name = name;
    this.area = area;
  }
  
  public String getName(){
    return this.name;
  }
  
  
  public int getArea(){
    return this.area; 
  }
  
  public void draw(int x, float scale){
    text(name, x + 50 - textWidth(name)/2, height - 40);
    int h = ceil(area * scale);
    String a = "Area: " + area;
    text(a, x + 50 - textWidth(a)/2,height - 75 - h);

    rect(x, height - h - 70, 100, area * scale);
  }
}
