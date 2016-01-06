 PVector loc, vel, g;   //declare a P
class Raindrop {
  color c;
  int diam;
 

  Raindrop(int tdiam) {
    diam=30;
    loc = new PVector(width/2, 50);
    c=color(0, random(150, 255), random(10, 100));
    vel= PVector.random2D();
    g= new PVector(0, .25);
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
}
  boolean isInContactWith(Catcher death) {
    if ( loc.dist(mouse)<diam/2) { //makes the catcher move
      return true; //makes the catcher do something
    } else {     //if it is not within the distance to the mouse
      return false; // then it does not catch
    }
  }

class Catcher {  // start the catcher class
  color c; // insert the variable for the class
  int diam;// insert the variable for the class
  PVector loc;// insert the variable for the class

  Catcher (int tdiam, float x, float y ) {//catcher builder
    c=color(0); // change the color 
    diam=tdiam; // makes the diam matter
    loc= new PVector(mouseX, mouseY); // set the pvector as the base for movement
  }

  void display() { // display function
    fill(c); // makesd the color to display it
    noStroke(); // makes the stroke gone so the edge is gone
    ellipse (mouseX, 380, diam*2, 20); // makes the catcher
  }
  void move() { // move function
    loc.set(mouseX, 380); // makes the catcher able to move
  }
}