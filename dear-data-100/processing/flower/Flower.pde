int petalCount=24;

//Flower configuration
float petalLength=100;
float petalWidth=28;
float petalDistance=90;

void setup(){
  size(700,700);
  smooth(8);
  noLoop();
}

void draw(){
  background(20,18,32);
  
  translate(width/2,height/2);
  drawFlower();
}

void drawFlower(){
  for (int i=0; i< petalCount; i++){
    
    float angle= TWO_PI *i/petalCount;
    
    drawPetal(angle,i);
  }
  
  noStroke
