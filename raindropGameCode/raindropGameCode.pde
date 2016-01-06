int co=20; //initialize co
PVector mouse; // initialize mouse
int score; //initialize score
Raindrop[] r = new Raindrop[co]; // new raindrop array list
Catcher death;//makw catcher death

void setup() {
  size(600, 400);// size of background
  mouse = new PVector(); //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  death = new Catcher(30, mouseX, mouseY); // new catcher death is made
  int i=0;//declare i
  while (i<co) {
    r[i]= new Raindrop(100);// make one hundred raindrops
    i++;// add new i to keep the raindrops being made every so often frames
  }
  frameRate(50);// increase framerate to make the game more fluid
}
void draw() {
  mouse.set(mouseX, mouseY); //set mouse as a vector
  int i=0; //make i a zero for the block of code
  background(0, 100, 255); //set blue colored background
  while (i<co) {
    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();      //display the raindrop
    if (r[i].isInContactWith(death)) {      //check to see if the raindrop is in contact with the point represented by the Catcher called death
      r[i].reset();  //if it is, reset the raindrop
      score++; // add one to score for every raindrop caught
    }
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();  //if it does, reset the raindrop
    }
    i++; //add one to i to keep the raindrops functioning
    fill(0);                        //makes score black
    textSize(30);                      // asigns score text size
    text(score, width/2, height/2);      // writes score
    death.display(); // display the shape death
    death.move(); //make death move 
    if(score = 30){
      background(0);
      text("you win",300,200);
    }
  }
}