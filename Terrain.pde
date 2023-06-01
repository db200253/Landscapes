import processing.data.*;

class Terrain {

  int terrainWidth;
  int terrainHeight;
  float[][] terrain;
  float oscillationSpeed = 0.5;
  color whiteColor = color(255);
  color destinationColor = color(0, 255, 0);
  Table colorsTable;
  int currentColorIndex = -1;
  
  Terrain(int terrainWidth, int terrainHeight) {
    this.terrainWidth = terrainWidth;
    this.terrainHeight = terrainHeight;
    terrain = new float[terrainWidth][terrainHeight];
    
    colorsTable = loadTable("colors.csv", "header");
  }
  
  void generateTerrain() {
    for(int i = 0; i < terrainWidth; ++i) {
      for(int j = 0; j < terrainHeight; ++j) {
        terrain[i][j] = noise(i * 0.1, j * 0.1);
      }
    }
  }
  
  void altToColor() {
    for(int i = 0; i < terrainWidth; ++i) {
      for(int j = 0; j < terrainHeight; ++j) {
        float normalizedHeight = terrain[i][j];
        float oscillation = sin(frameCount * oscillationSpeed + normalizedHeight * 2 * PI);
        float noiseValue = random(-1, 1);
        oscillation += noiseValue;
        color terrainColor = lerpColor(whiteColor, destinationColor, normalizedHeight);
        color oscillatingColor = lerpColor(whiteColor, terrainColor, 0.5 + 0.5 * oscillation);
        stroke(oscillatingColor);
        point(i, j);
      }
    }
  }
  
  void changeDestinationColor(boolean isUp) {
    if (isUp) {
      if (currentColorIndex == -1 || currentColorIndex == 0) {
        currentColorIndex = colorsTable.getRowCount() - 1;
      } else {
        currentColorIndex--;
      }
    } else {
      if (currentColorIndex == -1 || currentColorIndex == colorsTable.getRowCount() - 1) {
        currentColorIndex = 0;
      } else {
        currentColorIndex++;
      }
    }
    
    TableRow colorRow = colorsTable.getRow(currentColorIndex);
    int r = colorRow.getInt("r");
    int g = colorRow.getInt("g");
    int b = colorRow.getInt("b");
    destinationColor = color(r, g, b);
  }
}
