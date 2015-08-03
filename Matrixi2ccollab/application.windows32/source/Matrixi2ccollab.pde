/*
 * GridGUI Sample
 * by GoToLoop (2013/May)
 * edited by Sovereignty314
 * http://forum.processing.org/topic/basic-gui
 *
 * http://studio.processingtogether.com/sp/pad/export/ro.98-pSvW97Q-RE/latest
 */

final static byte GRID = 8; //# of squares in grid
int[][][] leds =new int[1000][GRID][GRID]; //main grid
final static color ON  = #FF0000, OFF = 0350, BG = 0; //main grid on/off colors (red)
final static short DIM = 050; //Dimmension of boxes
int count=1; //frame counter
int j=0;
int redVal=20;
int greenVal=80;
int blueVal=128;
int rValtemp=0;
PrintWriter output;
PFont f,g; 
int minigrid=count;
byte colorcounter=0;
boolean redbox=false,greenbox=false,bluebox=false;
void setup() {
  size(8*050+200, 8*050+100);
  fill(204);//, 120);
  rect(0, 0, width, height);
  //initGrid();
  //output = createWriter("matrix.txt");
  f=createFont("Serif",20);
  textFont(f);
   //noLoop();
}
int[][][] leds2 = new int[1000][GRID][GRID];
float clearx=GRID*DIM+DIM/4;
float cleary=DIM/2;
float framex=GRID*DIM+DIM/4;
float framey=7*DIM/2;
float fillx=GRID*DIM+DIM/4;
float filly=2*DIM;
float savex=GRID*DIM+DIM/4;
float savey=5*DIM;
float playx=GRID*DIM+DIM/4;
float playy=6.5*DIM;
float scrollx=DIM/6;
float scrollx2=9.78*DIM;
float scrolly=8.75*DIM;
float slidex1=GRID*DIM + DIM/3.4;
float slidex2=GRID*DIM+5*DIM/4;
float slidey=DIM/11;
float slidesizex=3*DIM/4;
float slidesizey=DIM/3;
boolean saved=false;
boolean player=false;
int starttime=0;
boolean playtrue=true;
int q;
float setupx=width-DIM/5;
float setupy=0;
float setupsize=DIM/3;
boolean setup=false;
//float savetimer=0;
byte savecount=1;

void draw() {
  if(setup==false){
 fill(204);
  rect(0, 0, width, height); //Background
  fill(150);
  rect(framex,framey,DIM*2,DIM); //save frame button
  fill(255);
  rect(clearx,cleary,DIM*2,DIM); //clear button
  fill(200);
  rect(fillx,filly,DIM*2,DIM); //fill button
  fill(100);
  rect(savex,savey,DIM*2,DIM);
  fill(50);
  rect(playx,playy,DIM*2,DIM);
  fill(150);
  rect(scrollx,scrolly,DIM/2,DIM);
  fill(150);
  rect(scrollx2,scrolly,DIM/2,DIM);
  fill(0,255,0);
  triangle(playx+2*DIM/3,playy+3*DIM/4,playx+2*DIM/3,playy+DIM/4,playx+4.5*DIM/3,playy+DIM/2);
  fill(150);
  rect(GRID*DIM + 100-DIM/3,0,setupsize,setupsize);
  fill(100);
 /* for(int i=0;i<GRID;i++) //little row fillers surrounding matrix
  rect(DIM*i,GRID*DIM,DIM,DIM/8);
  for(int i=0;i<GRID;i++)//same
  rect(GRID*DIM,DIM*i,DIM/8,DIM);*/
  fill(200);
  rect(slidex1,slidey,slidesizex,slidesizey);
  //rect(slidex2,slidey,slidesizex,slidesizey);
  

  fill(0);
 // textSize(20);
  text("Frame",GRID*DIM+3.15*GRID, DIM*4.15);
  text("Clear",GRID*DIM+3.4*GRID, 7*DIM/6);
  text("Fill",GRID*DIM+4.45*GRID, DIM*2.65);
  text("\n"+"Frame:" + count,GRID*DIM+GRID*1.5, GRID*DIM-DIM*.5);
  text("Save",GRID*DIM+3.9*GRID, DIM*5.65);
  //textSize(17);
  //text(" Created by"+"\n"+"Lance Levine"/*+"\n"+"& Alyssa M."*/,GRID*DIM+.5*GRID, GRID*DIM-7.5*DIM);
  //highlight();
  
  //if(mouseX>(framex) && mouseX<(framex+2*DIM) && mouseY>(framey) && mouseY<(framey+DIM)&& mousePressed){
        //for(int i=0;i<count;i++){
  //for (int row = 0; row != GRID; ++row)
    //for (int col = 0; col != GRID; ++col) {
     // leds2[count-2][row][col]=leds[count][row][col];
    //}  
 // }
 if(player==true){ 

if(playtrue==true){ //playtrue only plays the first time play is clicked!
q=count;
  count=0;
}
count++;
frameRate(8);
playtrue=false;
       for (int row = 0; row != GRID; ++row) //Main Grid
    for (int col = 0; col != GRID; ++col) {
if(leds[count][row][col] != 0){
     int val=leds[count][row][col];
     int r=val/1000000;
     int g=(val %1000000)/1000;
     int b=(val % 1000);
     fill(r,g,b);
   }else{
     fill(110);
   }
      rect(col*DIM, row*DIM, DIM, DIM);
    }
if(count==q){
  frameRate(60);
  player=false;
  playtrue=true;
}



      }
  else{
       for (int row = 0; row != GRID; ++row) //Main Grid
    for (int col = 0; col != GRID; ++col) {
if(leds[count][row][col] != 0){
     int val=leds[count][row][col];
     int r=val/1000000;
     int g=(val %1000000)/1000;
     int b=(val % 1000);
     fill(r,g,b);
   }else{
     fill(110);
   }
      rect(col*DIM, row*DIM, DIM,DIM);
    }
    }
  
    
    //highlight();
    
    if(count<6){
      fill(0,255,0);
      rect(4.2*DIM/5+1.8*DIM*(count-1)-4,DIM*8.2+5,DIM*1.8,DIM*1.8);
  for(int i=0;i<5;i++){
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      
if(leds2[i][row][col] != 0){
     int val=leds[count][row][col];
     int r=val/1000000;
     int g=(val %1000000)/1000;
     int b=(val % 1000);
     fill(r,g,b);
   }else{
     fill(110);
   }
      rect(col*DIM/5+4.2*DIM/5+i*DIM*1.8, row*DIM/5+8.425*DIM, DIM/5, DIM/5);
}
  }
    if(saved==true){
    fill(0,0,255);
  text("Saved! Quit and copy Matrix.txt into your loop()!!!",DIM/8,height-DIM/10);//,width/2.2,height-DIM/10);

  } 
    }
    else{
                    fill(0,255,0);
      rect(4.2*DIM/5+1.8*DIM*(3)-4,DIM*8.2+5,DIM*1.8,DIM*1.8);
        for(int i=0;i<5;i++){
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
if(leds2[count-4+i][row][col] != 0){
     int val=leds[count][row][col];
     int r=val/1000000;
     int g=(val %1000000)/1000;
     int b=(val % 1000);
     fill(r,g,b);
   }else{
     fill(110);
   }
      rect(col*DIM/5+4.2*DIM/5+i*DIM*1.8, row*DIM/5+8.425*DIM, DIM/5, DIM/5);
  }
        }
  if(saved==true){
    fill(0,0,255);
  text("Saved! Quit and copy Matrix.txt into your loop()!!!",DIM/8,height-DIM/10);//,width/2.2,height-DIM/10);

  }  

}
drawMain();
 drawButtons();
}
else{ //SETUP==true
 fill(150);
  rect(0, 0, width, height);
        fill(204);
  rect(GRID*DIM + 100-DIM/3,0,setupsize,setupsize);
  fill(200);
  rect(DIM/4,DIM/4,2*DIM,DIM);
} 
/*
if(mouseX>(4.2*DIM/5+i*DIM*1.8) && mouseX<(4.2*DIM/5+i*DIM*1.8)+DIM/5*8 && mouseY>(8.425*DIM) && mouseY<(8.425*DIM)+DIM/5*8 && mousePressed){
    hlight=true;
    j=i;
    break;
  }
    if(hlight==true){
    fill(0,255,0);
  rect(4.2*DIM/5+1.8*DIM*i-4,DIM*8.2+5,DIM*1.8,DIM*1.8);
  //fill(0);
   //rect(DIM/5+i*DIM*1.8,8.2*DIM,DIM/5*8,DIM/5*8);
   for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      leds[count][row][col]=leds[i+1][row][col];
    }
  }//rect(col*DIM/5+4.2*DIM/5+i*DIM*1.8, row*DIM/5+8.425*DIM, DIM/5, DIM/5); REFERENCE!!!
    }
    if(mouseX>(DIM/5+(count-1)*DIM*1.8) && mouseX<(DIM/5+(count-1)*DIM*1.8)+DIM/5*8 && mouseY>(8.2*DIM) && mouseY<(8.2*DIM)+DIM/5*8 && mousePressed){
        for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      leds[count][row][col]=false;
    }
    }
    */
    }
    
    
void mousePressed() {
  if(setup==false){

  
if(mouseX>(framex) && mouseX<(framex+2*DIM) && mouseY>(framey) && mouseY<(framey+DIM)){
//saver();
fill(0);
rect(framex,framey,DIM*2,DIM);
//output.flush();
count++;
hlight=false;

    for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
     leds2[count-2][row][col] = leds[count-1][row][col];
    leds[count][row][col]=leds[count-1][row][col];
    leds2[count-1][row][col] = leds[count-1][row][col];
    }
//redraw();
}
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      if(mouseX>(col*DIM) && mouseX<(col*DIM +DIM) && mouseY>(row*DIM) && mouseY<(row*DIM +DIM)){
     if(leds[count][row][col] > 0){
     leds[count][row][col]=0;
     leds2[count-1][row][col] = 0;
      }else{
        leds[count][row][col]= redVal*1000000+greenVal*1000+blueVal;
      leds2[count-1][row][col] = leds[count][row][col];
     }
      }
      
    }
if(mouseX>(clearx) && mouseX<(clearx+2*DIM) && mouseY>(cleary) && mouseY<(cleary+DIM)){
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      leds[count][row][col]=0;
    }
    
    fill(0);
    rect(clearx,cleary,DIM*2,DIM);
        for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
    leds2[count-1][row][col] = 0;
    }
   // redraw();
}
if(mouseX>(fillx) && mouseX<(fillx+2*DIM) && mouseY>(filly) && mouseY<(filly+DIM)){
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      leds[count][row][col]=redVal*1000000+greenVal*1000+blueVal;
    }
    fill(0);
rect(fillx,filly,DIM*2,DIM);
        for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
    leds2[count-1][row][col] = redVal*1000000+greenVal*1000+blueVal;
    }
}
if(mouseX>(savex) && mouseX<(savex+2*DIM) && mouseY>(savey) && mouseY<(savey+DIM)){
    fill(0);
    rect(savex,savey,DIM*2,DIM);
   // redraw();
   saver();
   //saved=true;
}
if(mouseX>(playx) && mouseX<(playx+2*DIM) && mouseY>(playy) && mouseY<(playy+DIM)){

    fill(255);
    rect(playx,playy,DIM*2,DIM);
      fill(255,0,0);
  triangle(playx+2*DIM/3,playy+3*DIM/4,playx+2*DIM/3,playy+DIM/4,playx+4*DIM/3,playy+DIM/2);
  player=true;
   // redraw();
}
//redraw();
if(mouseX>(scrollx) && mouseX<(scrollx+DIM/2) && mouseY>(scrolly) && mouseY<(scrolly+DIM)){
  if(count==1)
  count=1;
  else
  count--;
}
if(mouseX>(scrollx2) && mouseX<(scrollx2+DIM/2) && mouseY>(scrolly) && mouseY<(scrolly+DIM)){

  count++;
}
  
    if(mouseX>(GRID*DIM + 100-DIM/3) && mouseX<(GRID*DIM + 100) && mouseY>(0) && mouseY<setupsize && mousePressed){
      setup=true;

}
boxCheck();
  }
  else{ //SETUP == TRUE
     if(mouseX>(GRID*DIM + 100-DIM/3) && mouseX<(GRID*DIM + 100) && mouseY>(0) && mouseY<setupsize && mousePressed){
      setup=false;
    
  }
    
   for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      if(mouseX>(col*DIM) && mouseX<(col*DIM +DIM) && mouseY>(row*DIM) && mouseY<(row*DIM +DIM)){
      if(leds[count][row][col]== redVal*1000000+greenVal*1000+blueVal)
      leds[count][row][col]=0;
        leds[count][row][col]= redVal*1000000+greenVal*1000+blueVal;
      }
    }
}
  /*for(int i=0;i<8;i++) //little row fillers surrounding matrix
  rect(DIM*i,GRID*DIM,DIM,DIM/8);
  for(int i=0;i<8;i++)//same REFERENCE, DELETE
  rect(GRID*DIM,DIM*i,DIM/8,DIM);*/
 /* for(int i=0;i<8;i++){
   if(mouseX>DIM*i && mouseX<DIM*i+DIM && mouseY>GRID*DIM && mouseY<GRID*DIM+DIM/8){
            
     for(int row =0;row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
if(leds[count][7][i]!=0){
leds[count][row][i]=0;

leds2[count-1][row][i]=0;
}else{
      leds[count][row][i]= redVal*1000000+greenVal*1000+blueVal;
      leds2[count-1][row][i]=redVal*1000000+greenVal*1000+blueVal;
}
   } 
  }
}
  for(int i=0;i<8;i++){
   if(mouseX>GRID*DIM && mouseX<GRID*DIM+DIM/8 && mouseY>DIM*i && mouseY<DIM*i+DIM){
            
     for(int row =0;row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {

      leds[count][i][col]= redVal*1000000+greenVal*1000+blueVal;
      leds2[count-1][i][col]=redVal*1000000+greenVal*1000+blueVal;
   } 
  }
}*/
if(mouseX>slidex1 && mouseX<slidex1+slidesizex && mouseY>slidey && mouseY<slidey+slidesizey){
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID-1; ++col) {
      leds2[count-1][row][col]=leds[count][row][col];
      leds[count][row][col]=leds[count][row][col+1];

}
fill(0);
rect(slidex1,slidey,slidesizex,slidesizey);

count++;
hlight=false;
    for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
    // leds2[count-2][row][col] = leds[count-1][row][col];
    leds[count][row][col]=leds[count-1][row][col];
    leds2[count-1][row][col] = leds[count-1][row][col];
    }

}
}
boolean hlight;
void highlight(){
   for(int i=0;i<count;i++){
  if(mouseX>(4.2*DIM/5+i*DIM*1.8) && mouseX<(4.2*DIM/5+i*DIM*1.8)+DIM/5*8 && mouseY>(8.425*DIM) && mouseY<(8.425*DIM)+DIM/5*8 && mousePressed){
    hlight=true;
    j=i;
    break;
  }
    if(hlight==true){
    fill(0,255,0);
  rect(4.2*DIM/5+1.8*DIM*i-4,DIM*8.2+5,DIM*1.8,DIM*1.8);
  //fill(0);
   //rect(DIM/5+i*DIM*1.8,8.2*DIM,DIM/5*8,DIM/5*8);
   for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID-1; ++col) {
      leds[count][row][col]=leds[count][row][col-1];
    }
  }//rect(col*DIM/5+4.2*DIM/5+i*DIM*1.8, row*DIM/5+8.425*DIM, DIM/5, DIM/5); REFERENCE!!!
    }
    if(mouseX>(DIM/5+(count-1)*DIM*1.8) && mouseX<(DIM/5+(count-1)*DIM*1.8)+DIM/5*8 && mouseY>(8.2*DIM) && mouseY<(8.2*DIM)+DIM/5*8 && mousePressed){
        for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      leds[count][row][col]=0;
    }
    }


}
void keyPressed(){
  if(setup==false){
  if(key==ENTER){
  fill(0);
rect(framex,framey,DIM*2,DIM);
//output.flush();
count++;
hlight=false;

    for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
     leds2[count-2][row][col] = leds[count-1][row][col];
    leds[count][row][col]=leds[count-1][row][col];
    leds2[count-1][row][col] = leds[count-1][row][col];
    }
}
}
    if(redbox==true)
    redboxxer();
  else if(greenbox==true)
  greenboxxer();
  else if(bluebox==true)
  blueboxxer();
}
void saver(){
  output = createWriter("frames.txt");
  output.print(count);
  output.flush();
  output = createWriter("matrix.txt");
  for(int i=0;i<(count);i++){
    //output = createWriter("/Frame/matrix"+(i+1)+".txt");
    int j=0;
    //output.print("val[64]={");
    //output.print("{");
  for (int row = 0; row != GRID; ++row){
      
      for (int col = 0; col != GRID; ++col) {
          if(leds[i+1][row][col]!=0){// && leds[count][row][col]/1000000 != 0 && leds[count][row][col]%1000000/1000 != 0 && leds[count][row][col]%1000 !=0;){
            if(leds[count][row][col]/1000000<100 && leds[count][row][col]/1000000>9){
          output.print("0"+leds[count][row][col]/1000000);output.println("");}
          else if(leds[count][row][col]/1000000<10 && leds[count][row][col]/1000000>=0){
          output.print("00"+leds[count][row][col]/1000000);output.println("");}
          else{
          output.print(leds[count][row][col]/1000000);output.println("");}
            if(leds[count][row][col]%1000000/1000<100 && leds[count][row][col]/1000000>9){
         output.print("0"+((leds[count][row][col]%1000000)/1000));output.println("");}
         else if(leds[count][row][col]%1000000/1000<10 && leds[count][row][col]/1000000>=0){
           output.print("00"+((leds[count][row][col]%1000000)/1000));output.println("");}
           else{
           output.print(((leds[count][row][col]%1000000)/1000));output.println("");}
           if(leds[count][row][col]%1000<100 && leds[count][row][col]%1000>9){
         output.print("0"+leds[count][row][col]%1000);output.println("");}
         else if(leds[count][row][col]%1000<10 && leds[count][row][col]%1000>=0){
         output.print("00"+leds[count][row][col]%1000);output.println("");}
         else{
         output.print(leds[count][row][col]%1000);output.println("");}
          j++;
        }else{
          output.print("000");output.println("");
          output.print("000");output.println("");
          output.print("000");output.println("");
          j++;
          }
     //output.print(");");
    // output.println("");
  }
  }
  //output.print("}");
  //output.println("");
  output.flush();
  }
  
  saved=true;
  savecount++;
  
}

void drawMain(){
    for(int row=0;row!=GRID;row++)
  for(int col=0;col!=GRID;col++){
   if(leds[count][row][col] != 0){
     int val=leds[count][row][col];
     int r=val/1000000;
     int g=(val %1000000)/1000;
     int b=(val % 1000);
     fill(r,g,b);
   }else{
     fill(110);
   }
   rect(col*DIM,row*DIM,DIM,DIM); 
}
}
float redx=GRID*DIM+DIM*2.6;
float redy=DIM/3;
float redw=DIM/1.4;
float redh=DIM/2.5;
float greenx=GRID*DIM+DIM*3.4;
float bluex=GRID*DIM+DIM*4.2;
float colorx=GRID*DIM+DIM*2.6;
float colory=DIM*.8;
float colorw=DIM*2.3;
float colorh=DIM/3;

void drawButtons(){
  fill(255);
  if(colorcounter<1){
 rect(redx,redy,redw,redh);
 rect(greenx,redy,redw,redh);
 rect(bluex,redy,redw,redh);
  }
 fill(redVal,greenVal,blueVal);
 rect(colorx,colory,colorw,colorh);
fill(0); 
if(redbox==false)
 text(redVal,redx+DIM/25,redy+DIM/2.8);
 if(greenbox==false)
 text(greenVal,greenx+DIM/25,redy+DIM/2.8);
 if(bluebox==false)
 text(blueVal,bluex+DIM/25,redy+DIM/2.8);
 //textSize(17);
 f=createFont("Serif",18);
  textFont(f);
 text("R",redx+DIM/5,redy);
 text("G",greenx-DIM/15+DIM/5,redy);
 text("B",bluex+DIM/5,redy);
 //textSize(20);
  
}
void redboxxer(){
     if(colorcounter==0)
      if(key=='1' || key=='2' || key=='0')
      rValtemp=100*(byte(key)-48);
      else{}
    else if(colorcounter==1 && byte(key) != 10)
    rValtemp+= (byte(key)-48)*10;
    else if (colorcounter==2 && byte(key) != 10)
    rValtemp+=byte(key)-48;
    if(rValtemp<300 && rValtemp>0 && byte(key) != 10){
    fill(0);
    text(key,redx+DIM/25+DIM/6*colorcounter,redy+DIM/3.5);
    }
    colorcounter++;
    if(colorcounter==3 || byte(key) == 10){
      colorcounter=0;
      redVal=rValtemp;
      redbox=false;
      rValtemp=0;
    } 
}
void greenboxxer(){
       if(colorcounter==0)
      if(key=='1' || key=='2' || key=='0')
      rValtemp=100*(byte(key)-48);
      else{}
    else if(colorcounter==1)
    rValtemp+= (byte(key)-48)*10;
    else if (colorcounter==2)
    rValtemp+=byte(key)-48;
    if(rValtemp<300 && rValtemp>0){
    fill(0);
    text(key,greenx+DIM/25+DIM/6*colorcounter,redy+DIM/3.5);
    }
    colorcounter++;
    if(colorcounter==3){
      colorcounter=0;
      greenVal=rValtemp;
      greenbox=false;
      rValtemp=0;
    } 
}
void blueboxxer(){
       if(colorcounter==0)
      if(key=='1' || key=='2' || key=='0')
      rValtemp=100*(byte(key)-48);
      else{}
    else if(colorcounter==1)
    rValtemp+= (byte(key)-48)*10;
    else if (colorcounter==2)
    rValtemp+=byte(key)-48;
    if(rValtemp<300 && rValtemp>0){
    fill(0);
    text(key,bluex+DIM/25+DIM/6*colorcounter,redy+DIM/3.5);
    }
    colorcounter++;
    if(colorcounter==3){
      colorcounter=0;
      blueVal=rValtemp;
      bluebox=false;
      rValtemp=0;
    } 
}

void boxCheck(){
    if(mouseX>redx && mouseX<redx+redw && mouseY>redy && mouseY<redy+redh)
  redbox=true;
  if(mouseX>greenx && mouseX<greenx+redw && mouseY>redy && mouseY<redy+redh)
  greenbox=true;
  if(mouseX>bluex && mouseX<bluex+redw && mouseY>redy && mouseY<redy+redh)
  bluebox=true;
}
