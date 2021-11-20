//third edition
int option=1;

void setup() {
  size(800, 800);//screen size
}

void draw() {
  background(0);

  if (option==1) {  //operate option 1
    for (int x=0; x<width; x+=40) {
      for (int y=0; y<height; y+=30) {
        if (x<400) {//cut window to two frame
          strokeWeight(1);
          fill(100, 200, 200, x);
          symbol(x*1/5, x, x, 50);//call function
          symbol(300-x*1/5, x, x, 50);
          symbol(300-x*1/5, 800-x, x, 50);
          symbol(x*1/5, 800-x, x, 50);
          //the four small tornado circles on the left side of screen
        } else {
          fill(100, 100, y, x);
          symbol(800-x*1/5, x, x/2, 50);
          symbol(x*1/5+400, x, x/2, 50);
          symbol(x*1/5+400, 800-x, x/2, 50);
          symbol(800-x*1/5, 800-x, x/2, 50);
          //the two large tornado circles on the right side of screen
        }
      }
    }
  }

  if (option==2) {
    //move mouse from one corner to the other corner and see what happened
    for (int x=0; x<width; x+=100) { //more loose on x-axis than y-axis
      for (int y=0; y<height; y+=100) {
        fill(0);
        symbol(x+50, y+50, 100, 10);//the background dark pink circles
        constrain(mouseX, 0, 800);
        constrain(mouseX, 0, 800);//limit mouseX and mouseY inside of the screen


        if (mouseY>height/2) {
          fill(200, 200, mouseX/2, mouseX/2);
          symbol(width-mouseY, mouseY, 150, 200);
          symbol(mouseY, mouseY, 100, 200);
          symbol(height-mouseY, height-mouseY, 200, 150);
          symbol(mouseY, height-mouseY, 200, 100);
          // the right up moving-conneted circle group
        }
        if (mouseX>width/2) {
          fill(50, 100, mouseX/2, mouseX/2);
          symbol(width-mouseX/2, mouseX/2, 150, 200);
          symbol(mouseX/2, mouseX/2, 100, 200);
          symbol(height-mouseX/2, height/2-mouseX/2, 200, 150);
          symbol(mouseX/2, height/2-mouseX/2, 200, 100);
          // the down moving-conneted circle group
        }


        if (mouseX <height/2) {
          fill(50, 50, mouseX/2, mouseX/2);
          symbol(width/2-mouseY/2, mouseY/2, 150, 200);
          symbol(mouseY/2, mouseY/2, 100, 200);
          symbol(height/2-mouseY/2, height/2-mouseY/2, 200, 150);
          symbol(mouseY/2, height/2-mouseY/2, 200, 100);
          // the left up moving-conneted circle group
        }
      }
    }
  }

  if (option==3) {
    for (int x=0; x<width/2; x+=200) {
      for (int y=0; y<height; y+=150) {
        fill(x/2, y/2, x/2, 100);//change color from white to green
        symbol(x-100, y, x, width/4);//the left 1 line circles
      }
    }
    for (int x=800; x>width/3; x-=200) {
      for (int y=0; y<height; y+=175) {
        fill(x/2, y/2, x/2, 100);// change color from red to white
        symbol(x, y+20, x+20, width/4);//the right 4 line circles
      }
    }
  }

  if (option==4) {//move mouse from left to right/ up to bottom and see what happened
    for (int x=0; x<width+100; x+=200) {
      for (int y=0; y<height; y+=150) {
        fill(mouseX/2, mouseY/2, mouseX/2+mouseY/2);
        symbol(x, y, 100, 100);// the big red->white bottom circles
      }
    }
    for (int x=800; x>-100; x-=200) {
      for (int y=800; y>0; y-=150) {
        fill(mouseY/2, mouseX/2, mouseX/2+mouseY/2);
        symbol(y-100, x+mouseX/2-mouseY/2, 30, 50);// the small blue/green->pink bottom circles
      }
    }
  }

  if (option==5) {
    for (int x=0; x<width; x+=20) {
      for (int y=0; y<height; y+=15) {

        if (y%30==0) {
          fill(120, 130, 150);//draw lots of green circles-> spring green meadows
          symbol(y, x, 100, 100);
        } else if (x%20==0) {
          fill(120, 150, 100);
          symbol(x, y, 100, 100);//draw lots of grey circles-> autumn grey meadows
        }
      }
    }
  }
}
void mousePressed () {
  option++;
  if (option == 6) {
    option = 1;
  }
}//continually change the scenes

void symbol(float a, float b, float c, float d) {
  stroke(100, 70, 100);
  strokeWeight(6);
  ellipse(a, b, c, d);
  ellipse(a, b, c/2, d/2);
  ellipse(a, b, c/3, d/3);
  // three concentric circles
}

/*  SECOND EDITION 
//basically use connected rect and ellipse pattern to create different shapes/
int state = 1;//act at state
int f;
int g;//variable for map

void setup() {
  size(1000, 1000);//the frame size
}

void draw() {
  background(255);// white background
  println(state);//my friend!
  f = int(map(mouseX, 0, width, 0, 255));
  g = int(map(mouseX, 0, height, 0, 255));//to make changable value






  if (state == 1) {
    stateOne();
  } else if (state == 2) {
    stateTwo();
  } else if (state == 3) {
    stateThree();
  } else if (state == 4) {
    stateFour();
  } else if (state == 5) {
    stateFive();
  }
}
// call state!







void stateOne() {
  noStroke();
  for (int y = 0; y < 800; y += 20) {
    for (int x = 0; x < 800; x += 10) {
      if( x<200||x>600){
      fill(y*0.5-x*0.5, g,f);
        //The color of ellipses turns to be blue when your mouse is at the lower right corner of the sketch wimdow because "f" will be the highest value
        ////The color of ellipses turns to be red and black when your mouse is at the left of the sketch wimdow because "g" will be the highest value
        ellipse(x, y, 40, 40);// make two long side rect
    }
        else{
      rect(x, y, x, 10);//make grids
    }
  }
}
}




void stateTwo() {// two different buildings
   background(f/2,g/4,f/3);
  // the background will be black when mouse is at the left lower of sketch because the "g/4" is the biggest value
  //the background will be red when mouse is at the right of sketch because the "f/2" is the biggest value
  for (int x=0; x <= width; x += 30)
    for (int y=0; y <= height; y += 30)
    {
      if (x<400) {
        fill(f/2,f/2,g);
        stroke(0);
        strokeWeight(1);
        ellipse(x, y, 40, 40);//make a lot of ellipse as house's window
        strokeWeight(x/130);//changable strokeWeight
      }
      else{
        fill(f/3,y/3,y/3);
              //The color in the right higher grid will be pink and red when the mouse is at lower right corner because the"f/3" value is the biggest;
        //The color in the left lower grid will be blue when the mouse is at lower right corner because the"g/3" value is the biggest;
         rect(x, y, x, 10);
      rect(x,y , 10, y);//make houses
      } 
    }
}



void stateThree() {
{
background(255);
for (int x=10; x<width; x+=20) 
{
for (int y=10; y<height; y+=20)
{
fill(g/3,f/5,x/4);
ellipse(x,y,mouseX,100-mouseY); // size is changable
  // the ellipses will be small whenyou move your mouse to left lower because the vlaue of mouseX and mouseY is smaller and smaller
rect(x,y,mouseX,mouseY);

}
}
}
}





void stateFour() {//time travelling machine
 for(int x = 0; x < height; x = x + 10){
    fill(100, 100,100);
   ellipse(width/2 + map(x, 0, height, 0, mouseX-width/2), height/2 + map(x, 0, height, 0, mouseY-height/2), map(x, 20, height, height, 0),map(x, 30, height, height, 0));
   rect(width/2 + map(x, 0, height, 0, mouseX-width/2), height/2 + map(x, 0, height, 0, mouseY-height/2), map(x, 40, height, height, 0),map(x, 30, height, height, 0));
rect(width/2 + map(x, 0, height, 0, mouseX-width/2), height/2 + map(x, 0, height, 0, mouseY-height/2), map(x, 50, height, height, 0),map(x, 20, height, height, 0));
   rect(width/2 + map(x, 0, height, 0, mouseX-width/2), height/2 + map(x, 0, height, 0, mouseY-height/2), map(x, 20, height, height, 0),map(x, 20, height, height, 0));
   // make a lot of ellipses as a large wormhole 
   // the shade of ellipses is because of the dansity of ellipses
  }
  }

  
void stateFive() {
  background(0);// dark background
  for (int x = 150; x < 800; x+= 20) {
     fill(255,0,0);
    rect(400,300,150,150);
    rect(300,200,150,150);
    rect(200,100,150,150);
    rect(100,0,150,150);// make red rectangles
    stroke(230);
    noFill();
    ellipse(300, 200, mouseY, pmouseX);// the left corner ellipse
   
  }



  for (int x = 100; x < 800; x+= 40) {
    noFill();
    stroke(230);
    noFill();
    ellipse(400, 450, mouseX, pmouseY);// the middle ellipse
     fill(255,0,0);
    rect(500,400,150,150);// the red rectang;e
    
  }

  for (int x = 100; x < 800; x+= 10) {
     noFill();
    stroke(120);
    noFill();
    ellipse(500, 600, x, mouseX);
    fill(255,0,0);
    rect(600,500,150,150);
    rect(700,600,150,150);
    rect(800,700,150,150);
    rect(900,800,150,150);
    rect(1000,900,150,150);
    //the right ellipse

  }
}

void mousePressed() {
  state++;
  if (state > 5) {
    state = 1;
  }
}// change state when you press mouse


*/












/*     the former one I write

int state = 1;//art at state

int f;
int g;
//variable for map






void setup() {
  size(800, 800);
  frameRate(100);// speed up!
}








void draw() {
  background(255);// white background
  println(state);//my friend!

  f = int(map(mouseX, 0, width, 0, 255));
  g = int(map(mouseX, 0, height, 0, 255));//to make changable value






  if (state == 1) {
    stateOne();
  } else if (state == 2) {
    stateTwo();
  } else if (state == 3) {
    stateThree();
  } else if (state == 4) {
    stateFour();
  } else if (state == 5) {
    stateFive();
  }
}
// call state!







void stateOne() {
  noStroke();
  for (int y = 0; y < 800; y += 20) {
    for (int x = 0; x < 800; x += 10) {

      fill(x * 0.3);//make gradient back-and-white

      rect(x, y, x, 10);
      rect(y, x, 10, y);//make grids
    }
  }
}




void stateTwo() {

  for (int x=0; x <= width; x += 100)
    for (int y=0; y <= height; y += 100)
    {
      if (x<800) {
        stroke(10);
        ellipse(x, y, 40, 40);//make a lot of ellipse
        strokeWeight(x/130);//changable strokeWeight
        line(1000-x, 800-y, width/2, height/2);//make lines to connect ellipses
      }
    }
}



void stateThree() {

  for (int q = 1; q <400; q = q+2) {
    for (int j = 1; j < 400; j = j+2) {
      strokeWeight(1);

      stroke(f/3, g/2, g/4);
      fill(f, g/2, f/5);// changable color related to mouse

      rect(q, j, j, q);//make a new shape
      stroke(0);
      line(400-j, q, j, q);//make a triangle
      strokeCap(PROJECT);//square dots
      strokeWeight(10);//make point dark and heavy
      point(q*10, j*10);// make a lot of dots
    }
  }
}






void stateFour() {


  for (var i = 2; i < 50; i+=1) {
    if (i%2 == 0) {
      stroke(0, 100*i-10);// different transparency
      line(0, width/i, 5*width/6, width/i);// make lines
    } else {
      stroke(0, 100*i-10);
      line(width- 3*width/4, height-height/i, width, height-height/i);
    }
    
    stroke(0, 100*i-10);
    line(0, height/2, width, height/2);// the light in the middle




    for (int b=100; b<400; b+=10) {
      stroke(100, 100, 100, 50);
      strokeWeight(10);
      noFill();
      ellipse(100, 200, 100, b);
      ellipse(700, 600, 100, b);// the egg shape
    }
  }
}


void stateFive() {

  background(20);// dark background

  for (int x = 150; x < 800; x+= 20) {
    noFill();
    stroke(220);
    ellipse(100, 100, x, x);// the left corner ellipse
  }



  for (int x = 100; x < 800; x+= 40) {
    noFill();
    stroke(255);
    ellipse(400, 400, x, x);// the middle ellipse
  }






  for (int x = 100; x < 800; x+= 10) {
    noFill();
    stroke(0);
    strokeWeight(3);
    ellipse(600, 600, x*0.3, x*0.3);//The black disc
  }





  for (int y = 0; y < 400; y += 10) {
    for (int x = 0; x < 500; x += 10) {
      if (x<300) {
        stroke(10);
        noStroke();
        fill(x * 0.3);
        rect(x+50, 800-y, 10, 5);// the strape with changable color
      }
    }
  }
}








void mousePressed() {
  state++;
  if (state > 5) {
    state = 1;
  }
}// change state when you press mouse
*/
