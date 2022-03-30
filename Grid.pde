class Grid{
  ArrayList<Cell> cells;
  int rows;
  int cols;
  ArrayList<Cell> cellsWithParticle;
  Grid(){
    this.cells = new ArrayList<Cell>();
    this.cellsWithParticle = new ArrayList<Cell>();
    this.rows = int(height/w);
    this.cols = int(width/w);
    for(int i = 0; i < this.rows; i++){
      for(int j = 0; j < this.cols; j++){
        cells.add(new Cell(j , i));
      }
    }
  }
  
  void show(){
    for(Cell c : cells){
      c.show();
      if(c.hasParticle){
        c.showParticle();
      }else{
        
        if(this.cellsWithParticle.size() > 0){
          PVector emf = new PVector(0 , 0);
          for(Cell cwp : this.cellsWithParticle){
            PVector ob = new PVector((cwp.x * w) + w/2 , (cwp.y * w) + w/2);
            PVector oa = new PVector((c.x * w) + w/2 , (c.y * w) + w/2);
            PVector emf1 = PVector.sub(ob , oa);
            float r = emf1.mag();
            r = r * 0.1;

            emf1.normalize();
            float m = 5000 * ( (cwp.particle.charge)  / (r * r) );
            emf1.mult(m);
            emf.add(emf1);
          }
          drawArrow(emf , c);
          
        }
      }
    }
    
    
  }
  
  void checkMouse(int ch){
    for(Cell c : cells){
      if(c.hasMouse() && !c.hasParticle){
          c.addParticle(ch);
          this.cellsWithParticle.add(c);
      }
    }
  }
  
  void rem(){
    for(Cell c : cells){
      if(c.hasMouse() && c.hasParticle){
        c.removeParticle();
        this.cellsWithParticle.remove(c);
      }
    }
  }
  
  void setCharge(int a){
    for(Cell c : this.cellsWithParticle){
      if(c.hasMouse()){
        c.setCharge(a);
      }
    }
  }
  
  
}
