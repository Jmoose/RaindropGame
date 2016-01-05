int co=20;
PVector mouse;
int score;
Raindrop[] r = new Raindrop[co];
Catcher death;
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(600, 400);
  mouse = new PVector(); //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  death = new Catcher(30,mouseX, mouseY);
  int i=0;
  while (i<co) {
    r[i]= new Raindrop(100);
    i++;
  }
  frameRate(50);
}
void draw() {
  mouse.set(mouseX, mouseY);
  int i=0;
  r[i].reset();
  background(0, 100, 255);
  while (i<co) {
    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();      //display the raindrop
    if (r[i].isInContactWith(death)) {      //check to see if the raindrop is in contact with the point represented by the Catcher called death
      r[i].reset();  //if it is, reset the raindrop
      score++;
    
    }
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();  //if it does, reset the raindrop
    }
    i++;
    fill(0);                        //makes score black
    textSize(30);                      // asigns score text size
    text(score, width/2, height/2);      // writes score
 death.display();
 death.move();
}
}