var positions = [];
var maxlen = 100;

function setup() {
  createCanvas(710, 400);
  colorMode(HSB);

  for (var i = 0; i < maxlen; i++) {
    positions.push(new Point(0, 0));
  }
}

function draw() {
  background(0);

  positions.unshift(new Point(mouseX, mouseY));
  while(positions.length > maxlen) {
    positions.splice(positions.length - 1, 1);
  }

  strokeWeight(4);
  beginShape(LINES);
  for (var i = 0; i < positions.length - 1; i++) {
    positions[i].render(i);
    positions[i + 1].render(i + 1);
  }
  endShape(CLOSE);
}

function Point(x, y) {
  this.x = x;
  this.y = y;

  this.render = function(index) {
    let factor = index/positions.length;
    stroke(color(255 * factor, 255, 255, 255));
    vertex(this.x, this.y);
  }
}
