/*
 * 
 * 8x8 RGB LED MATRIX MAKER
 * by Lance Levine
 * 
 *
 */

final static byte GRID = 8; //# of squares in grid
int[][][] leds =new int[1000][GRID][GRID]; //main grid
int[][]colors=new int[7][21];
//int[]recentColors=new int[14];
int recentColors[]={-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
final static color ON  = #FF0000, OFF = 0350, BG = 0; //main grid on/off colors (red)
final static short DIM = 40; //Dimmension of boxes
int count=1; //frame counter
int maxcount=1;
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
   colorp=loadImage("colorpick.jpg");
   colorp1=loadImage("colorpick1.jpg");
  arrowr=loadImage("arrowr.jpg");
   arrowl=loadImage("arrowl.jpg");
   arrowr1=loadImage("arrowr1.jpg");
   arrowl1=loadImage("arrowl1.jpg");
   bucket=loadImage("bucket.jpg");
   bucket1=loadImage("bucket1.jpg");
   playpic=loadImage("play.jpg");
   playpic1=loadImage("play1.jpg");
   savepic=loadImage("save.jpg");
   savepic1=loadImage("save1.jpg");
   loadpic=loadImage("load.jpg");
   loadpic1=loadImage("load1.jpg");
   scrollpic=loadImage("scroll.jpg");
   scrollpic1=loadImage("scroll1.jpg");
}
//int[][][] leds2 = new int[1000][GRID][GRID];
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
float slidex1=GRID*DIM+DIM+DIM*1.6;
float slidex2=GRID*DIM+5*DIM/4;
float slidey=GRID*DIM+DIM;
float slidesizex=DIM/2*1.3;
float slidesizey=DIM/1;
float openx=GRID*DIM+DIM*1.15;
float openy=DIM/12;
float openxs=DIM/2*1.5;
float openys=DIM/3;
float pickx=GRID*DIM+DIM+DIM*2.4;
float picky=GRID*DIM+DIM;
float pickxs=DIM/2*1.3;
float pickys=DIM/1;
float bucketx=GRID*DIM+DIM+DIM*3.23;
boolean saved=false;
boolean player=false;
int starttime=0;
boolean playtrue=true;
boolean colorPick=false,bucketPick=false;
int q;
float setupx=0;
float setupy=height-DIM/3;
float setupsize=DIM/3;
boolean setup=false;
//float savetimer=0;
byte savecount=1;
PImage colorp,colorp1,arrowr,arrowl,arrowr1,arrowl1,bucket,bucket1,playpic,playpic1,savepic,loadpic,savepic1,loadpic1;
PImage scrollpic,scrollpic1;
void draw() {
  if(count>maxcount)
  maxcount=count;
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
  rect(savex,savey,DIM,DIM);
  fill(100);
  rect(savex+DIM,savey,DIM,DIM);
 // fill(100);
 // rect(savex+DIM*2/3+DIM*2/3+2,savey,DIM/2,DIM);
  fill(50);
  rect(playx,playy,DIM*2,DIM);
  fill(150);
  rect(scrollx,scrolly,DIM/2,DIM);
  fill(150);
  image(arrowl,scrollx+1,scrolly+1);
  //rect(openx,openy,openxs,openys);
  fill(150);
  rect(scrollx2,scrolly,DIM/2,DIM);
  image(arrowr,scrollx2+1,scrolly+1);
  if(colorPick==false)
  fill(150);
  else
  fill(0);
  rect(pickx,picky,pickxs,pickys);
  image(colorp,pickx+1,picky+1);
  if(colorPick==true)
  image(colorp1,pickx+1,picky+1);
    fill(120);
  rect(bucketx,picky,pickxs,pickys);
  image(bucket,bucketx+1,picky+1);
  if(bucketPick==true)
  image(bucket1,bucketx+1,picky+1);
  image(savepic,savex+1,savey+1);
 
  image(loadpic,savex+DIM+1,savey+1);
  //image(playpic,playx+1,playy+1);
 // if(player==true)
  //image(playpic1,playx+1,playy+1);
  fill(0,255,0);
  triangle(playx+2*DIM/3,playy+3*DIM/4,playx+2*DIM/3,playy+DIM/4,playx+4.5*DIM/3,playy+DIM/2);
  fill(150);
  rect(0,GRID*DIM + 100-DIM/3,setupsize,setupsize);
  fill(100);
 /* for(int i=0;i<GRID;i++) //little row fillers surrounding matrix
  rect(DIM*i,GRID*DIM,DIM,DIM/8);
  for(int i=0;i<GRID;i++)//same
  rect(GRID*DIM,DIM*i,DIM/8,DIM);*/
  fill(200);
  rect(slidex1,slidey,slidesizex,slidesizey);
  image(scrollpic,slidex1+1,slidey+1);
  
  colors();
  recentColors();
  //rect(slidex2,slidey,slidesizex,slidesizey);

  fill(0);
 // textSize(20);
  text("Frame",GRID*DIM+3.4*GRID, DIM*4.15);
  text("Clear",GRID*DIM+3.4*GRID, 7*DIM/6);
  text("Fill",GRID*DIM+4.45*GRID, DIM*2.65);
  text("\n"+"Frame:" + count,GRID*DIM+GRID*1.5, GRID*DIM-DIM*.5);
  text("Created by Lance Levine",width-185,height-3);
  //text("File",GRID*DIM+4.6*GRID, DIM*5.65);//,GRID*DIM+3.9*GRID, DIM*5.65);
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
//q=maxcount;
  count=0;
}
count++;
frameRate(8);
playtrue=false;
       for (int row = 0; row != GRID; ++row) //Main Grid playing
    for (int col = 0; col != GRID; ++col) {
if(leds[count][row][col] != 0){
  if(mouseX>playx && mouseX<playx+DIM*2 && mouseY>playy && mouseY<playy+DIM && mousePressed && count>2){
      frameRate(60);
  player=false;
  playtrue=true;
  }
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
if(count==maxcount){
  frameRate(60);
  player=false;
  playtrue=true;
}



      }
  else{//PLAYER == FALSE
  /*     for (int row = 0; row != GRID; ++row) //Main Grid
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
    }*/
    }
  
    
    //highlight();
    
    if(count<6){
      fill(0,255,0);
      rect(4.2*DIM/5+1.8*DIM*(count-1)-4,DIM*8.2+5,DIM*1.8,DIM*1.8);
  for(int i=0;i<5;i++){
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      
if(leds[i+1][row][col] != 0){
     int val=leds[i+1][row][col];
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
  text("Saved!!!!",DIM/8,height-DIM/10);//,width/2.2,height-DIM/10);

  } 
    }
    else{ //count >=6
                    fill(0,255,0);
      rect(4.2*DIM/5+1.8*DIM*(3)-4,DIM*8.2+5,DIM*1.8,DIM*1.8);
        for(int i=0;i<5;i++){
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
if(leds[count-3+i][row][col] != 0){
     int val=leds[count-3+i][row][col];
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
  text("Saved!!!!",DIM/8,height-DIM/10);//,width/2.2,height-DIM/10);

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
     //leds[count-1][row][col] = leds[count-1][row][col];
    leds[count][row][col]=leds[count-1][row][col];
    //leds[count][row][col] = leds[count-1][row][col];
    }
//redraw();
}
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      if(mouseX>(col*DIM) && mouseX<(col*DIM +DIM) && mouseY>(row*DIM) && mouseY<(row*DIM +DIM)){
        if(colorPick==false){
          if(bucketPick==false){
     if(leds[count][row][col] > 0){
     leds[count][row][col]=0;
     //leds[count][row][col] = 0;
      }else{
        
        leds[count][row][col]= redVal*1000000+greenVal*1000+blueVal;
     // leds[count][row][col] = leds[count][row][col];
     }
        }else{
          int val=leds[count][row][col]; //val is the selected square
          //int row1=row;
         // int col1=col;
         for (int row1 = 0; row1 != GRID; ++row1)
   for (int col1 = 0; col1 != GRID; ++col1)
     if(leds[count][row1][col1] != redVal*1000000+greenVal*1000+blueVal && leds[count][row1][col1]==val){
       leds[count][row1][col1]= redVal*1000000+greenVal*1000+blueVal;
       
    }else{
    }
    bucketPick=false;
  }
        }else{
        recents();
     int val=leds[count][row][col];
     redVal =val/1000000;
     greenVal=(val %1000000)/1000;
     blueVal=(val % 1000);
      colorPick=false;
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
    //    for (int row = 0; row != GRID; ++row)
    //for (int col = 0; col != GRID; ++col) {
   // leds[count][row][col] = 0;
    //}
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
    leds[count][row][col] = redVal*1000000+greenVal*1000+blueVal;
    }
}
for(wid=0;wid<7;wid++){
for(heit=0;heit<11;heit++){
if(mouseX>GRID*DIM+DIM*2.6+DIM/3*wid && mouseX<GRID*DIM+DIM*2.6+DIM/3*wid+DIM/3 && mouseY>GRID*DIM-DIM*6.8+DIM/3*heit && mouseY<GRID*DIM-DIM*6.8+DIM/3*heit+DIM/3 ){
//redVal=int(redd);
//blueVal=int(bluee);
//greenVal=int(greenn);
}}
}

if(mouseX>(savex) && mouseX<(savex+DIM) && mouseY>(savey) && mouseY<(savey+DIM)){
    //fill(0);
    // if(bucketPick==true)
  image(savepic1,savex+1,savey+1);
    //rect(savex,savey,DIM*2,DIM);
   // redraw();
   saver();
   //saved=true;
}
if(mouseX>(pickx) && mouseX<(pickx+pickxs) && mouseY>(picky) && mouseY<(picky+pickys)){
  if(colorPick==true)
colorPick=false;
else
  colorPick=true;
}
if(mouseX>(bucketx) && mouseX<(bucketx+pickxs) && mouseY>(picky) && mouseY<(picky+pickys)){
  if(bucketPick==true)
bucketPick=false;
else
  bucketPick=true;
}
for (int row = 0; row != 7; ++row) //colors
    for (int col = 0; col != 21; ++col) {
if(mouseX>(GRID*DIM+DIM*2.6+DIM/3*row) && mouseX<(GRID*DIM+DIM*2.6+DIM/3*row+DIM/3) && mouseY>(GRID*DIM-DIM*6.8+DIM/3*col) && mouseY<(GRID*DIM-DIM*6.8+DIM/3*col+DIM/3)){
  recents();
if(colors[row][col] >= 0){
  
     int val=colors[row][col];
     redVal=val/1000000;
     greenVal=(val % 1000000)/1000;
     blueVal=(val % 1000);
     //fill(r,g,b);
   //}else{
}
else{
 redVal=0;
     greenVal=0;
     blueVal=0; 
  
}
}
    }
if(mouseX>(playx) && mouseX<(playx+2*DIM) && mouseY>(playy) && mouseY<(playy+DIM)){

   // fill(255);
   // rect(playx,playy,DIM*2,DIM);
      //fill(255,0,0);
  //triangle(playx+2*DIM/3,playy+3*DIM/4,playx+2*DIM/3,playy+DIM/4,playx+4*DIM/3,playy+DIM/2);
  player=true;
   // redraw();
}
//redraw();
if(mouseX>(savex+DIM) && mouseX<(savex+2*DIM) && mouseY>(savey) && mouseY<(savey+DIM)){
  image(loadpic1,savex+DIM+1,savey+1);
  selectInput("Select a file you goon","opener");
  
}
if(mouseX>(scrollx) && mouseX<(scrollx+DIM/2) && mouseY>(scrolly) && mouseY<(scrolly+DIM)){
  if(count==1)
  count=1;
  else
  count--;
  image(arrowl1,scrollx+1,scrolly+1);
}
if(mouseX>(scrollx2) && mouseX<(scrollx2+DIM/2) && mouseY>(scrolly) && mouseY<(scrolly+DIM)){
image(arrowr1,scrollx2+1,scrolly+1);
  count++;
}
  
    if(mouseX>(0) && mouseX<(DIM/3) && mouseY>(GRID*DIM + 100-DIM/3) && mouseY<(GRID*DIM + 100-DIM/3+DIM/3) && mousePressed){
      setup=true;

}
boxCheck();
recentCheck();

if(mouseX>slidex1 && mouseX<slidex1+slidesizex && mouseY>slidey && mouseY<slidey+slidesizey){
  count++;
      for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) 
    // leds2[count-2][row][col] = leds[count-1][row][col];
    leds[count][row][col]=leds[count-1][row][col];
  for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID-1; ++col) {
      leds[count][row][col]=leds[count][row][col];
      leds[count][row][col]=leds[count][row][col+1];

    }
//fill(0);
//rect(slidex1,slidey,slidesizex,slidesizey);
image(scrollpic1,slidex1+1,slidey+1);
//count++;
hlight=false;

    //leds2[count-1][row][col] = leds[count-1][row][col];
    

}
  }
  else{ //SETUP == TRUE
     if(mouseX>(0) && mouseX<(DIM/3) && mouseY>(GRID*DIM + 100-DIM/3) && mouseY<(GRID*DIM + 100-DIM/3+DIM/3) && mousePressed){
      setup=false;
    
  }
  }
  /* for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
      if(mouseX>(col*DIM) && mouseX<(col*DIM +DIM) && mouseY>(row*DIM) && mouseY<(row*DIM +DIM)){
      if(leds[count][row][col]!= 0)
      leds[count][row][col]=0;
      else
        leds[count][row][col]= redVal*1000000+greenVal*1000+blueVal;
      }
    }*/

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
     // leds[count][row][col]=leds[count][row][col-1];
    }
  }//rect(col*DIM/5+4.2*DIM/5+i*DIM*1.8, row*DIM/5+8.425*DIM, DIM/5, DIM/5); REFERENCE!!!
    }
    if(mouseX>(DIM/5+(count-1)*DIM*1.8) && mouseX<(DIM/5+(count-1)*DIM*1.8)+DIM/5*8 && mouseY>(8.2*DIM) && mouseY<(8.2*DIM)+DIM/5*8 && mousePressed){
        for (int row = 0; row != GRID; ++row)
    for (int col = 0; col != GRID; ++col) {
     // leds[count][row][col]=0;
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
    // leds[count-1][row][col] = leds[count-1][row][col];
    leds[count][row][col]=leds[count-1][row][col];
    //leds2[count-1][row][col] = leds[count-1][row][col];
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
  if(maxcount<10)
  output.print(1);
  else if(maxcount<100 && maxcount>9)
  output.print(2);
  else if(maxcount>99 && maxcount<1000)
  output.print(3);
  else if(maxcount>999)
  output.print(4);
  output.print(maxcount);
  output.println("");
  for(int i=0;i<(maxcount);i++){
    //output = createWriter("/Frame/matrix"+(i+1)+".txt");
    int j=0;
    //output.print("val[64]={");
    //output.print("{");
  for (int row = 0; row != GRID; ++row){
      
      for (int col = 0; col != GRID; ++col) {
          if(leds[i+1][row][col]!=0){// && leds[count][row][col]/1000000 != 0 && leds[count][row][col]%1000000/1000 != 0 && leds[count][row][col]%1000 !=0;){
            if(leds[i+1][row][col]/1000000<100 && leds[i+1][row][col]/1000000>9){
          output.print("0"+leds[i+1][row][col]/1000000);output.println("");}
          else if(leds[i+1][row][col]/1000000<10 && leds[i+1][row][col]/1000000>0){
          output.print("00"+leds[i+1][row][col]/1000000);output.println("");}
          else if(leds[i+1][row][col]/1000000==0){
          output.print("000");output.println(""); 
          }
          else{
          output.print(leds[i+1][row][col]/1000000);output.println("");}
            if(leds[i+1][row][col]%1000000/1000<100 && leds[i+1][row][col]%1000000/1000>9){
         output.print("0"+((leds[i+1][row][col]%1000000)/1000));output.println("");}
         else if(leds[i+1][row][col]%1000000/1000<10 && leds[i+1][row][col]%1000000/1000>0){
           output.print("00"+((leds[i+1][row][col]%1000000)/1000));output.println("");}
           else if(leds[i+1][row][col]%1000000/1000==0){
           output.print("000");output.println("");}
           else{
           output.print(((leds[i+1][row][col]%1000000)/1000));output.println("");}
           if(leds[i+1][row][col]%1000<100 && leds[i+1][row][col]%1000>9){
         output.print("0"+leds[i+1][row][col]%1000);output.println("");}
         else if(leds[i+1][row][col]%1000<10 && leds[i+1][row][col]%1000>0){
         output.print("00"+leds[i+1][row][col]%1000);output.println("");}
         else if(leds[i+1][row][col]%1000==0){
         output.print("000");output.println("");}
         else{
         output.print(leds[i+1][row][col]%1000);output.println("");}
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
      recents();
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
      recents();
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
      recents();
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
int wid=0,heit=0,redd=0,greenn=0,bluee=0;

void colors(){
 /* for(int r=1;r<71;r++) {
    fill(redd,greenn,bluee);
    rect(GRID*DIM+DIM*2.6+DIM/3*wid,GRID*DIM-DIM*6.8+DIM/3*heit,DIM/3,DIM/3);
    heit++;
    greenn=0;
    bluee=0;
    redd=0;
    if(r % 10 == 1){
    wid++;
    heit=0;
    }
  if(wid==7)
  wid=0;
  if(wid==0){
    
 redd= redd +25*heit;
  }
  else if(wid==1){
  redd= redd +25*heit;
  greenn= greenn +13*heit;
  }
  
  else if(wid==2){
  redd= redd+25*heit;
  greenn=greenn+25*heit;}
  else if(wid==3){
   greenn+=25*heit;
  }
  else if(wid==4){
  bluee+=25*heit;
}
  else if(wid==5){
    
    bluee+=25*heit;
    redd+=13*heit;
  }
  else if(wid==6){
 greenn+=25*heit;
  redd+=25*heit;
  bluee+=25*heit;
  }
  }*/
  //wid=0;
  for(int i=0;i<10;i++){
   colors[0][i]=25000000*i;
  colors[0][10]=255000000; 
  }
   for(int i=0;i<10;i++){
   colors[1][i]=25013000*i;
  colors[1][10]=255128000; 
  }
   for(int i=0;i<10;i++){
   colors[2][i]=25025000*i;
  colors[2][10]=255255000; 
  }
   for(int i=0;i<10;i++){
   colors[3][i]=26000*i;
  colors[3][10]=255000; 
  }
   for(int i=0;i<10;i++){
   colors[4][i]=000000025*i;
  colors[4][10]=000000255; 
  }
   for(int i=0;i<10;i++){
   colors[5][i]=13000025*i;
  colors[5][10]=128000255;
  }
   for(int i=0;i<10;i++){
   colors[6][i]=25025025*i;
  colors[6][10]=255255255; 
  }
  int w=0;
   for(int i=9;i>=0;i--){
   colors[6][i+11]=13000013*w;
  colors[6][11]=128000128; 
  w++;
  }
  w=0;
     for(int i=9;i>=0;i--){
   colors[1][i+11]=13013000*w;
  colors[1][11]=128128000; 
  w++;
  }
  w=0;
     for(int i=9;i>=0;i--){
   colors[4][i+11]=13025*w;
  colors[4][11]=128255; 
  w++;
  }
  w=0;
     for(int i=9;i>=0;i--){
colors[2][i+11]=13025013*w;
  colors[2][11]=128255128;  
  w++;
  }
  w=0;
     for(int i=9;i>=0;i--){
   colors[5][i+11]=13013025*w;
  colors[5][11]=128128255; 
  w++;
  }
  w=0;
     for(int i=9;i>=0;i--){
   colors[3][i+11]=13025025*w;
  colors[3][11]=128255255; 
  w++;
  }
  w=0;
     for(int i=9;i>=0;i--){
   colors[0][i+11]=25013025*w;
  colors[0][11]=255128255; 
  w++;
  }
  w=0;
  
         for (int row = 0; row != 7; ++row)
    for (int col = 0; col != 21; ++col) {
if(colors[row][col] != 0){
     int val=colors[row][col];
     int r=val/1000000;
     int g=(val % 1000000)/1000;
     int b=(val % 1000);
     fill(r,g,b);
   }else{
     fill(0);
   }
      rect(GRID*DIM+DIM*2.6+DIM/3*row,GRID*DIM-DIM*6.8+DIM/3*col,DIM/3,DIM/3);
    }
}
void recentColors(){ //grid
int p=0,w=0;
        //  for (int row = 0; row != 7; ++row) //recent colors
    for (int col = 0; col != 14; ++col) {
      if(col % 7 == 0){
      p++;
      w=-1;
      }
      w++;
if(recentColors[col] >= 0){
     int val=recentColors[col];
     int r=val/1000000;
     int g=(val % 1000000)/1000;
     int b=(val % 1000);
     fill(r,g,b);
   }else if(recentColors[col]== -1){
     fill(210);
   }
      rect(GRID*DIM+DIM*2.6+DIM/3*w,GRID*DIM-DIM*.1+DIM/3*p,DIM/3,DIM/3);
    } 
}
void recentCheck(){ //if recents are clicked, this is in the mousePressed function

for(int w=0;w<7;w++){
if(mouseX>GRID*DIM+DIM*2.6+DIM/3*w && mouseX<GRID*DIM+DIM*2.6+DIM/3*w+DIM/3 && mouseY>GRID*DIM-DIM*.1+DIM/3*2 && mouseY<GRID*DIM-DIM*.1+DIM/3*2+DIM/3){
 int val=recentColors[w+7];
 if(val==-1){
  // redVal=0;
 //greenVal=0;
 //blueVal=0;
 }
 else{
 redVal=val/1000000;
 greenVal=(val % 1000000)/1000;
 blueVal=(val % 1000);
 }
}
}

for(int w=0;w<7;w++){
if(mouseX>GRID*DIM+DIM*2.6+DIM/3*w && mouseX<GRID*DIM+DIM*2.6+DIM/3*w+DIM/3 && mouseY>GRID*DIM-DIM*.1+DIM/3*1 && mouseY<GRID*DIM-DIM*.1+DIM/3*1+DIM/3){
 int val=recentColors[w];
 if(val==-1){
 //  redVal=0;
// greenVal=0;
// blueVal=0;
 }
 else{
 redVal=val/1000000;
 greenVal=(val % 1000000)/1000;
 blueVal=(val % 1000);
}
}
}
}
void recents(){//cycle recent colors
int tempColors[]=new int [14];

for(int i=1;i<14;i++){
  tempColors[i]=recentColors[i-1];
  // recentColors[i]=recentColors[i-1];
}
 for(int a=1;a<14;a++){
  recentColors[a]=tempColors[a]; 
} 
recentColors[0]=redVal*1000000+greenVal*1000+blueVal; 
}

void opener(File selection){
  byte b[]=loadBytes(selection);
  long x=b.length;
  int newcount=int(x)/960;
  byte roow=0,cool=0;
  //int y=0;
  //redVal=(((b[y]-48)*100+(b[y+1]-48)*10+(b[y+2]-48))*1000000)+(((b[y+5]-48)*100+(b[y+6]-48)*10+(b[y+7]-48))*1000)+((b[y+10]-48)*100+(b[y+11]-48)*10+(b[y+12]-48));
  for(int z=0;z<newcount;z++){
  roow=0;
  cool=0;
   for(int y=0+z*960;y<960+z*960;y+=15){
  leds[z+1][roow][cool]=(((b[y]-48)*100+(b[y+1]-48)*10+(b[y+2]-48))*1000000)+(((b[y+5]-48)*100+(b[y+6]-48)*10+(b[y+7]-48))*1000)+((b[y+10]-48)*100+(b[y+11]-48)*10+(b[y+12]-48));
  cool++;
  if(roow==7 && cool==8){
   roow=0;
  cool=0; 
  }
   if(cool==8){
   roow++;
  cool=0; 
  }
   }
  }
count=newcount;
}
