class Raindrop {
  color c;
  int diam;
  PVector loc, vel, g;   //declare a P

  Raindrop(int tdiam) {
    diam=30;
    loc = new PVector(width/2, 50);
    c=color(0, random(255), random(255));
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
  boolean isInContactWith(PVector death) {
 if (loc.dist(death)<diam/2){
   return true;
 }else{return false;}
  }
}