int petalCount=12;
//float i;

//Flower configuration
float petalLength=600;
float petalWidth=500;
float petalDistance=22.5;

//mouse drag sensitivity
float sensitivityX=0.005;
float sensitivityY=0.005;
float sensitivityZ=10;
float rotX;
float rotY;
float rotZ=0.1;
boolean axes=false;

void setup() {
  size(700, 700, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  smooth(8);
  //noLoop();
}

void draw() {
  background(20);

  lights();

  translate(width/2, height/2);


  pushMatrix();

  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  rotateOnZ();
  draw3DFlower();
  drawAxes(700);
  popMatrix();



  //i++;
}

/*void drawFlower() {
  for (int i=0; i< petalCount; i++) {

    float angle= TWO_PI *i/petalCount;

    drawPetal(angle, i, i);
    drawFlowerCentre();
  }
}*/

void draw3DFlower() {


  for (int i=0; i<petalCount; i++) {
    float angle =TWO_PI*i/petalCount;
    float petalTilt=-10+5*sin(angle*2);//control how steep the cone of the flower is


    pushMatrix();
    rotateZ(angle);
    translate(0, -petalDistance, 0);
    rotateX(radians(petalTilt));
    draw3DPetal(210, 290);
    drawFlowerCentre();
    popMatrix();
  }

  int innerPetalCount= petalCount/2;

  for (int i=0; i< innerPetalCount; i++) {
    float angle =TWO_PI * i / innerPetalCount + PI/petalCount;
    float petalTilt=-25+3*sin(angle*2);


    pushMatrix();
    rotateZ(angle);
    translate(0, -petalDistance, 18);
    rotateX(radians(petalTilt));
    draw3DPetal(150, 210);
    popMatrix();
  }
}

/*void drawPetal(float angle, int index, int i) {// redundant code used for the 2d petal however salvage the hue properties
 pushMatrix();
 
 rotateZ(angle);
 float zOffset = 0;
 translate(0, -petalDistance, zOffset);
 
 
 
 float hue= map(index, 0, petalCount, 190, 330);
 
 fill(hue, 65, 95, 85);
 noStroke();
 
 float variedLength = petalLength + sin(i * 1.7) * 12;
 
 float variedWidth = petalWidth * (0.88 + 0.12 * cos(i * 2.1));
 
 drawPetalShape(variedWidth, variedLength);
 
 popMatrix();
 }*/

void drawFlowerCentre() {
  //flower centre
  //pushMatrix();

  noStroke();
  fill(45, 90, 100);
  sphereDetail(24);
  sphere(35);

  //popMatrix();
}

void drawPetalShape(float w, float len) {
  beginShape();

  vertex(0, 0);

  bezierVertex((w*0.55), (-len*0.78), (w*0.55), (-len*0.25), 0, 0);

  endShape(CLOSE);
}



void scroll3D() {
  if (mousePressed==true) {

    rotateX(radians(mouseY/4));

    rotateY(radians(mouseX/4));
  }
}

void mouseDragged() {
  rotY+=((mouseX-pmouseX)*sensitivityX);
  rotX+=-((mouseY-pmouseY)*sensitivityY);
}

void rotateOnZ() {
  if (keyPressed) {
    if (key=='z' ||key=='Z') {
      rotZ+=(radians(sensitivityZ));
    }
  }
}

//code below toggles axes on/off when spacebar is pressed
void keyPressed() {
  if (key==' ') {
    axes=!axes;
  }
}

void drawAxes(float len) {//change varaible name as len is also flower petal length
  if (!axes) {
    return;
  }
  pushStyle();

  colorMode(RGB);
  strokeWeight(3);

  // X axis
  stroke(255, 0, 0);
  line(0, 0, 0, len, 0, 0);

  // Y axis
  stroke(0, 255, 0);
  line(0, 0, 0, 0, len, 0);

  // Z axis
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, len);

  popStyle();
}
// end of axes toggle and drawing
