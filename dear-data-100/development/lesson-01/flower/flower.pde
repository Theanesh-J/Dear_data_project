int petalCount=48;

//Flower configuration
float petalLength=200;
float petalWidth=40;
float petalDistance=70;

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
    drawFlowerCentre();
  }
  
}

void drawPetal(float angle,int index){
  pushMatrix();
  
  rotate(angle);
  translate(0,-petalDistance);
  
  colorMode(HSB, 360,100,100,100);
  
  float hue= map(index, 0, petalCount, 190,330);
  
  fill(hue,65,95,85);
  noStroke();
  
  ellipse(0, -petalLength/2,petalWidth,petalLength);
  
  popMatrix();
  
  colorMode(RGB, 255);
}

void drawFlowerCentre(){
  //flower centre
  noStroke();
  fill(255,210,130);
  circle(0,0,65);
}
  
  

  
  
 
