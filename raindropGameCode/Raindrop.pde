class Raindrop {
  color c;
  int diam;
  PVector loc, vel, g;   //declare a P

  Raindrop(int tdiam) {
    diam=30;
    loc = new PVector(width/2, 50);
    c=color(0, random(150,255), random(10,100));
    vel= PVector.random2D();
    g= new PVector(0,.25);
  }
  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void fall() {
 loc.add(vel);
 vel.add(g);
  }
  void reset() {
    loc.x=random(width);
    loc.y=0;
    vel= PVector.random2D();
  }
  boolean isInContactWith(Catcher death) {
 if ( loc.dist()<diam/2){//this shit
   return true;
 }else{
   return false;
    }
  }
}

class Catcher{
  color c;
  int diam;
  PVector loc;
   
   Catcher (int tdiam,float x,float y ){
     c=color(0);
     diam=tdiam;
    loc= new PVector(mouseX,mouseY);

     
   }
   
   void display(){
     fill(c);
     noStroke();
     ellipse (mouseX,380,diam*2,20);
   }
  void move(){
    loc.set(mouseX,380);
  }
}