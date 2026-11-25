void draw3DPetal(float w, float len) {

  int lengthSteps = 24;
  int widthSteps = 12;

  float bendHeight = 30; //longitudinal curvature
  float cupDepth = 25; // widthwise curvature

  noStroke();
  fill(310, 65, 95, 90);

  for (int row = 0; row < lengthSteps; row++) {

    float t1 = row / (float) lengthSteps;
    float t2 = (row + 1) / (float) lengthSteps;
    //float t3 = (row +1) / (float) lengthSteps;

    beginShape(QUAD_STRIP);

    for (int col = 0; col <= widthSteps; col++) {

      float u = map(col, 0, widthSteps, -1, 1);

      addPetalVertex(t1, u, w, len, bendHeight, cupDepth);
      addPetalVertex(t2, u, w, len, bendHeight, cupDepth);
      //addPetalVertex(t3,u,w,len,bendHeight, cupDepth);
    }

    endShape();
  }
}

void addPetalVertex(
  float t, //controls how far along the petal we are
  float u, // controls which petal we are on
  float w, //petal width
  float len, //petal length
  float bendHeight, //petal long curvature
  float cupDepth // petal width wise curvature
  ) {

  float shape = pow(sin(PI * t), 0.8);

  float x = u * (w / 2) * shape;
  float y = -len * t;

  float arch = bendHeight * sin(PI * t);
  float cup = cupDepth * u * u * sin(PI * t);
  
  //Organic assymmetry
  float twist= 12 *u*t;  // one edge of the petal gradually rises more tha the other
  float lean =18* sin(PI *t) * t; //the petal gradually shifts sideways
  
  x+=lean;

  float z = arch + cup + twist;

  vertex(x, y, z);
}
