Terrain t;
int tw = 500;
int th = 500;
boolean isMouseOverTerrain;

void setup() {
  
  size(500, 500);
  
  t = new Terrain(tw, th);
  t.generateTerrain();
}

void draw() {
  
  background(255);
  t.altToColor();
}
