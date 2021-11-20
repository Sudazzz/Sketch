int option = 1;
float a = random(40, 60);//random rotate angle

float b = random(-10, 10);
float c = random(-15, 15);
float d = random(-25, 25);//random color change

void setup() {
  size(1000, 1000);//screen size
  background(0);
  print("drag mouse to draw, click any key to change brush");
}

void draw() {
  if (option == 1 && mousePressed== true) {//the first brush mode
    translate(mouseX, mouseY);//move brush to mouse
    pushMatrix();//begin change
    for (int x=0; x<81; x+=40) {//two symbols
      rotate(radians(a));//random degree
      scale(1.2);//zoom in
      fill(random(10*b, 255), random(200, 255), random(0, 255), map(mouseY, 0, width, 100, 255));//ramdon color and changable with mouse movement
      symbol(x*1/5, x, x, 50);//ellipse shape
    }
    popMatrix();//end change
  }

  if (option == 2 && mousePressed == true) { //the second brush mode
    translate(mouseX, mouseY);
    pushMatrix();
    for (int x=0; x<width/10; x+=10) { //scale down the shape
      rotate(radians(a));
      scale(0.9);//scale down
      for (int y=0; y<height/10; y+=10) {
        fill(map(mouseX, 0, width, 150, 255), map(mouseY*1.2, 0, width*7/8, 150, 255), map(mouseY, 0, width, 150, 255));//changable color with mouse movement
       //green to red from left to right
        symbol(x+30, y+20, 10, 10);
        symbol(width-mouseX/2, mouseX/2, 10, 15); 
        symbol(mouseX/4, mouseX/4, 70, 130);
        symbol(height/2-mouseX/4, height/4-mouseX/4, 15, 10);
       //move mouse from left to right, see the space between each pattern 
      }
    }
    popMatrix();
  }

  if (option == 3 && mousePressed == true) { //the third brush mode
    for (int x=0; x<width/2; x+=200) {
      translate(mouseX, mouseY);
      rotate(radians(40));
      pushMatrix();
      scale(0.5);
      for (int y=0; y<height; y+=150) {
        fill(x/2, y/2, x/2, 100);//change color from green to red
        symbol(x, y, x, width/4);
      }
      popMatrix();
    }
  }

  if (option == 4 && mousePressed == true) { //the fourth brush mode
    for (int x=0; x<width/4; x+=20) {
      translate(mouseX, mouseY);
      rotate(radians(40));
      pushMatrix();
      scale(0.1);//scale down a lot
      for (int y=0; y<height/4; y+=10) {
        fill(mouseX+b, mouseX+c, mouseX+d);//slightly different each time
        symbol(x, y, 100, 100);
        //three cylinder shapes, see the space between them moving mouse from left to right;
      }
      popMatrix();
    }
  }




  if (option == 5 && mousePressed == true) {
    for (int x=0; x<width; x+=20) {
      translate(mouseX, mouseY);
      rotate(radians(90));
      pushMatrix();
      scale(0.1);
      for (int y=0; y<height; y+=15) {
        fill(120, 130, 150);
        symbol(y, x, 100, 100);
        fill(120, 150, 100);
        symbol(x, y, 100, 100);
        //grey and green square made of two kind of colored ellipses
      }
      popMatrix();
    }
  }
}

void symbol(float a, float b, float c, float d) {
  stroke(100, 70, 100);
  strokeWeight(2.5);
  ellipse(a, b, c, d);
  ellipse(a, b, c/2, d/2);
  ellipse(a, b, c/3, d/3);
  //define the shape
}

void keyPressed() {
  option++;
  if (option > 5) {
    option = 1;
    //always change to other pattern clicking
  }
}
