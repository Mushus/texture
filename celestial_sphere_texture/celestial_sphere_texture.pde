PShader sd;

int starNum = 500;
float scSize = 720;

void setup() {
  noLoop();
  size(1440, 720, P2D);
  sd = loadShader("FragmentShader.glsl");
  sd.set("size", scSize, scSize);
  for (int i = 0; i < starNum; i++) {
    float y = random(1);
    float hrizontalLength = sin(y * PI);
    float x = random(1);
    if (x > hrizontalLength) continue;
    sd.set(
      "stars["+i+"]",
      hrizontalLength == 0 ? 0 : x / hrizontalLength * 2,
      y);
    sd.set(
      "starPower["+i+"]",
      random(1) * random(1) * random(1),
      random(1) * random(1) * random(1),
      random(1) * random(1) * random(1));
  }
}

void draw() {
  shader(sd);
  rect(0, 0, width, height);
  save( "universe.png" );
}
