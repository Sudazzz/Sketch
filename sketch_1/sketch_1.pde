void setup() {
  size(800, 800);
  background(245, 220, 200);// the sky color
}

void draw() {
  fill(240, 121, 100);//sun color
  noStroke();
  ellipse(650, 275, 350, 350);//biggest sun outline
  fill(240, 220, 200);
  ellipse(550, 195, 210, 210);//midium sun outline
  fill(240, 121, 100);
  ellipse(550, 205, 190, 190);//smaller sun outline
  fill(240, 220, 200);
  ellipse(550, 215, 170, 170);//sun outline
  fill(240, 111, 104);
  ellipse(550, 220, 150,150);// tiniest sun outline

  fill(121,4,16);
  ellipse(350, 570, 530, 260);//mountain one
  fill(217, 113, 104);
  noStroke();
  ellipse(150, 675, 500, 200);//mountain two
  fill(217, 113, 104);
  noStroke();
  triangle(0, 600, 400, 500, 800, 700);//mountain three
  fill(245, 170, 141);
  ellipse(0, 675, 275,275);//mountain four
  fill(245, 170, 141);
  noStroke();
  triangle(0, 600, 250, 400, 700, 800);//mountain five
  fill(245, 170, 141);
  triangle(0, 800, 500, 462, 400, 800);// mountain six
fill(73, 140, 156);  
  triangle(0,800,600,400,1000,800);// mountain seven
    fill(73, 140, 156);
  triangle(600, 400, 300, 700, 0, 800);//mountain eight
  fill(73, 140, 156);
  triangle(0, 800, 700, 800, 0, 675);//mountaion nine
  
}
