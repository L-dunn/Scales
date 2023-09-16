import java.util.Random;

int r = 90;
int g = 40;
int b = 142;

void setup() {
  size(520, 520);  //feel free to change the size
  noLoop(); //stops the draw() function from repeating
}

void draw() {
  int x = 0;
  int y = 0;
  boolean shift = false;
  
  while(y < 520){
    if (shift == false){
      x = 0;
      shift = true;
    } else {
      shift = false;
      x = -20;
    }
    while(x < 520){ 
      scale(x, y);
      x += 40;
    }
    y += 30;
  }
}

//hexagonal scale
void scale(int x, int y) {
  //vary the color colorVariation is called
  
  //left side of scale
  colorVariation();
  strokeWeight(0);
  beginShape();
  vertex(x, y); //upper left vertex of scale
  vertex(x, y + 20);
  vertex(x + 20, y + 30); //lowest point of scale
  endShape(CLOSE);
  
  //rigth side of scale
  colorVariation();
  beginShape();
  vertex(x + 20, y + 30);
  vertex(x + 40, y + 20);
  vertex(x + 40, y); //upper right vertex of scale
  endShape(CLOSE);
  
  //middle
  colorVariation();
  beginShape();
  vertex(x + 20, y - 10); //highest vertex of scale
  vertex(x, y); //upper left vertex of scale
  vertex(x + 20, y + 30); //lowest point of scale
  vertex(x + 40, y); //upper right vertex of scale
  endShape(CLOSE);
  
  //intricate patterns in center of scale
  for(int i = 0; i < 20; i += 5){
    colorVariation();
    noStroke();
    beginShape();
    vertex(x + 20, y - 10 + i); 
    vertex(x + i, y);
    vertex(x + 20, y + 30 - i); 
    vertex(x + 40 - i, y); 
    endShape();
  }
  
  //add some curves to the middle kite shaped section
  colorVariation();
  beginShape();
  curveVertex(x, y);
  curveVertex(x, y);
  curveVertex(x + 10, y + 20);
  curveVertex(x + 20, y + 30);
  curveVertex(x + 20, y + 30);
  endShape(CLOSE);
  
  colorVariation();
  beginShape();
  curveVertex(x + 40, y);
  curveVertex(x + 40, y);
  curveVertex(x + 30, y + 20);
  curveVertex(x + 20, y + 30);
  curveVertex(x + 20, y + 30);
  endShape(CLOSE);

}

//varies color and fills the shape with the color
void colorVariation(){
  int variation = (int)(Math.random() * 121) - 60;
  fill(r + variation, g, b + variation);
}
