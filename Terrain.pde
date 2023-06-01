class Terrain {

  int terrainWidth;
  int terrainHeight;
  float[][] terrain;
  float oscillationSpeed = 0.2;
  color whiteColor = color(255);
  color destinationColor = color(0, 255, 0);
  
  Terrain(int terrainWidth, int terrainHeight) {
  
    this.terrainWidth = terrainWidth;
    this.terrainHeight = terrainHeight;
    terrain = new float[terrainWidth][terrainHeight];
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
        float noiseValue = random(-3, 3); // Ajout du bruit aléatoire
        oscillation += noiseValue;
        color terrainColor = lerpColor(whiteColor, destinationColor, normalizedHeight);
        color oscillatingColor = lerpColor(whiteColor, terrainColor, 0.5 + 0.5 * oscillation);
        stroke(oscillatingColor);
        point(i, j);
      }
    }
  }
}
