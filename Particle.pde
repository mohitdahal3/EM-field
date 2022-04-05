class Particle{
  PVector position;
  float charge;
  
  Particle(PVector _pos , float _c){
    this.position = _pos;
    this.charge = _c;
  }
  
  void show(){
    
    textSize(30);
    noStroke();
    if(charge > 0){
      fill(0 , 0 , 255);
      ellipse(this.position.x + w/2 , this.position.y + w/2, w/2 , w/2);
      drawPlusMinus(this.position.x + w/2 , this.position.y + w/2 , true);
    }else if(charge < 0){
      fill(255 , 0 , 0);
      ellipse(this.position.x + w/2 , this.position.y + w/2 , w/2 , w/2);
      drawPlusMinus(this.position.x + w/2 , this.position.y + w/2 , false);
    }else{
      noFill();
      stroke(1);
      strokeWeight(2);
      ellipse(this.position.x + w/2 , this.position.y + w/2 , w/2 , w/2);
    }
  }
  
  Particle copyParticle(){
    return new Particle(this.position.copy() , this.charge);
  }
}
