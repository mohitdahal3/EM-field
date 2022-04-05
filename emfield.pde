int w = 41;
Grid grid;

void setup(){
  //size(640 , 360);
  fullScreen();
  grid = new Grid();
}

void draw(){
  background(255);
  grid.show();
}

void keyPressed(){
  if(key == '='){
    grid.checkMouse(1);
  }else if(key == '-'){
    grid.checkMouse(-1);
  }else if(key == ' '){
    grid = new Grid();
  }else if(key == 'x'){
    grid.rem();
  }else if(key == '1'){
    grid.setCharge(1);
  }else if(key == '2'){
    grid.setCharge(2);
  }else if(key == '3'){
    grid.setCharge(3);
  }else if(key == '4'){
    grid.setCharge(4);
  }else if(key == '5'){
    grid.setCharge(5);
  }else if(key == '6'){
    grid.setCharge(6);
  }else if(key == '7'){
    grid.setCharge(7);
  }else if(key == '8'){
    grid.setCharge(8);
  }else if(key == '9'){
    grid.setCharge(9);
  }else if(key == '0'){
    grid.setCharge(0);
  }
}

void drawArrow(PVector vec , Cell c){
  Cell cell = c.copyCell();
  stroke(0);
  fill(0);
  
  strokeWeight(2);
  int x = cell.x * w;
  int y = cell.y * w;
  int sp = int(w / 3);
  float m = vec.mag();
  m = constrain(map(m,0,55,0,1) , 0 , 1);
  sp *= m;
  
  
  pushMatrix();
  translate(x + w/2 , y + w/2);
  rotate(vec.heading());
  line(-sp , 0 , sp , 0);
  triangle(sp , 0 , sp/2 , -sp/2 , sp/2 , sp/2);
  popMatrix();
}

void drawPlusMinus(float x , float y , boolean plus){
  stroke(255);
  strokeWeight(1);
  int s = int(w/8);
  x = int(x);
  y = int(y);
  line(x-s , y , x+s , y);
  if(plus){
    line(x , y-s , x , y+s);
  }
  
}
