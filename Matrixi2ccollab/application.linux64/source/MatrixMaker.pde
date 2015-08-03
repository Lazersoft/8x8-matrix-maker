/**
 * GridGUI Sample
 * by GoToLoop (2013/May)
 * edited by Sovereignty314
 * http://forum.processing.org/topic/basic-gui
 *
 * http://studio.processingtogether.com/sp/pad/export/ro.98-pSvW97Q-RE/latest
 */

final static byte GRID = 8;
final static boolean[][] leds = new boolean[GRID][GRID];
PrintWriter output;
PFont f;
final static color ON  = #FF0000, OFF = 0350, BG = 0;
final static short DIM = 050;

void setup() {
  size(GRID*DIM + 100, GRID*DIM + 1, P2D);
 // noLoop();
  //initGrid();
  output = createWriter("matrix.txt");
  f=createFont("Serif",20);
  textFont(f);
}

void draw() {
  //background(BG);
  fill(100);
  rect(GRID*DIM+DIM/4,GRID*DIM/2,DIM*2,DIM);
  //rect(GRID*DIM+DIM/2,GRID*DIM/4,DIM,DIM);
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      fill(leds[row][col] ? ON : OFF);
      rect(col*DIM, row*DIM, DIM, DIM);
    }
    //textAlign(RIGHT);
  //drawType(GRID*DIM+2.3*DIM);
  fill(0);
  text("Save frame",GRID*DIM+GRID/2, GRID*DIM-4*DIM-DIM/4);
//if(mouseX>(GRID*DIM+DIM/2) && mouseX<(GRID*DIM+DIM/2+DIM) && mouseY>(GRID*DIM/2) && mouseY<(GRID*DIM/2+DIM)&&mousePressed)
// fill(255);
}

void mousePressed() {
  redraw();
  //initGrid();
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      if(mouseX>(col*DIM) && mouseX<(col*DIM +DIM) && mouseY>(row*DIM) && mouseY<(row*DIM +DIM))
      leds[row][col]= !leds[row][col];
}
if(mouseX>(GRID*DIM+DIM/2) && mouseX<(GRID*DIM+DIM/2+DIM) && mouseY>(GRID*DIM/2) && mouseY<(GRID*DIM/2+DIM)){
saver();
output.flush();
}
//if(mouseX>(GRID*DIM+DIM/2) && mouseX<(GRID*DIM+DIM/2+DIM) && mouseY>(GRID*DIM/4) && mouseY<(GRID*DIM/4+DIM)){
 // output.flush();
//}

//void keyPressed() {
 // mousePressed();
//}

/*void initGrid() {
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col)
      leds[row][col] = random(1) > .5 ? true : false;*/
}
/*boolean overSave(int x,int y, int w, int h){
  if(mouseX >= x && mouseX <= x+w &&  mouseY >= y && mouseY <= y+h)
  return true;
  else
  return false;
}*/

void saver(){
  for (int row = 0; row != GRID; ++row){
    output.print("mat.setColumn(0,"+row+",B");
    for (int col = 0; col != GRID; ++col) {
      if(leds[row][col]==true)
      output.print(1);
      else
      output.print(0);
    }
    output.print(");");
    output.println("");
  }
  output.print("delay(time);");
  output.println("");
} 
/*void drawType(float x) {
  fill(255);
  text("Save frame", x, GRID*DIM/1.4);
}*/
