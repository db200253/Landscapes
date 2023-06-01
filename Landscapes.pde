Terrain t;
int tw = 500;
int th = 500;

void setup() {
  
  size(500, 500);
  
  t = new Terrain(tw, th);
  t.generateTerrain();
}

void draw() {
  
  background(255);
  t.altToColor();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      t.changeDestinationColor(true);
    } else if (keyCode == DOWN) {
      t.changeDestinationColor(false);
    }
  }
}
