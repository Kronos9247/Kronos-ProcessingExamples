ArrayList<PVector> positions;
int maxlen = 130;

public void setup() {
  size(400, 500);
  colorMode(HSB);
  
  positions = new ArrayList<PVector>();
  for(int i = 0; i < maxlen; i++) {
    positions.add(new PVector(0, 0));
  }
}

public void draw() {
  background(0);
  
  pushMatrix();
  
  noStroke();
  fill(color(100, 255, 255));
  translate(30, 40);
  rotate(radians(-10f));
  rect(0, 0, 100, 300);
  
  popMatrix();
  
  positions.add(0, new PVector(mouseX, mouseY));
  while(positions.size() > maxlen) {
    positions.remove(positions.size() - 1);
  }
  
  noFill();
  beginShape(LINES);
  for(int i = 0; i < positions.size() - 1; i++) {
    PVector vector = positions.get(i);
    
    float aenderung = map(i, 0f, positions.size(), 0f, 1f);
    
    stroke(color(255f * aenderung, 255, 255, 255f));
    strokeWeight(10f * (1 - aenderung));
    vertex(vector.x, vector.y);
    
    PVector vector2 = positions.get(i + 1);
    float aenderung2 = map(i + 1, 0f, positions.size(), 0f, 1f);
    
    stroke(color(255f * aenderung2, 255, 255, 255f));
    strokeWeight(10f * (1 - aenderung2));
    vertex(vector2.x, vector2.y);
  }
  endShape();
}