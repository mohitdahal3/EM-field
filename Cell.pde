class Cell{
  Particle particle;
  int x;
  int y;
  boolean hasParticle;
  Cell(int x , int y){
    this.x = x;
    this.y = y;
    this.hasParticle = false;
  }
  
  void show(){
    noFill();
    stroke(69, 32, 219, 37);
    rect(this.x * w , this.y * w , w , w);
  }
  
  void showParticle(){
    if(this.hasParticle){
      this.particle.show();
    }
  }
  
  void addParticle(int c){
    if(!this.hasParticle){
      this.hasParticle = true;
      this.particle = new Particle(new PVector(this.x * w , this.y * w) , (c == 1)? 1 : -1);
    }
  }
  
  void removeParticle(){
    if(this.hasParticle){
      this.hasParticle = false;
      this.particle = null;
    }
  }
  
  boolean hasMouse(){
    return(((mouseX > this.x * w) && mouseX < (this.x * w) + w) && ((mouseY > this.y * w) && mouseY < (this.y * w) + w));
  }
  
  Cell copyCell(){
    Cell c = new Cell(this.x , this.y);
    return c;
  }
  
  void setCharge(int a){
    this.particle.charge = ( (this.particle.charge > 0)?a : (this.particle.charge < 0)?-a : 0 );
  }
}
