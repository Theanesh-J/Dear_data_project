int petalCount=24;
float i;

//Flower configuration
float petalLength=600;
float petalWidth=500;
float petalDistance=22.5;

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
  rotateX(radians(60));
  rotateY(radians(20));
  rotateZ(radians(0));

  drawFlower();
  i++;
}

void drawFlower() {
  for (int i=0; i< petalCount; i++) {

    float angle= TWO_PI *i/petalCount;

    drawPetal(angle, i, i);
    drawFlowerCentre();
  }
}

void drawPetal(float angle, int index, int i) {
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
}

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
