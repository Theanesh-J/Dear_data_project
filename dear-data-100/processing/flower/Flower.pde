int petalCount=24;

//Flower configuration
float petalLength=600;
float petalWidth=500;
float petalDistance=22.5;

void setup() {
  size(700, 700);
  smooth(8);
  noLoop();
}

void draw() {
  background(20, 18, 32);

  translate(width/2, height/2);
  drawFlower();
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

  rotate(angle);
  translate(0, -petalDistance);

  colorMode(HSB, 360, 100, 100, 100);

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
  fill(255, 190, 40);
  noStroke();
  ellipse(0, 0, 45, 45);
}

void drawPetalShape(float w, float len) {
  beginShape();

  vertex(0, 0);

  bezierVertex((w*0.55), (-len*0.78), (w*0.55), (-len*0.25), 0, 0);

  endShape(CLOSE);
}
