import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;

void setup(){
   size(640,480);
   colorMode(HSB,100);
   background(#000000);
   frameRate(15);

   PFont font = createFont("Naiv-Fat", 42);
   textFont(font, 24);
   
   noStroke();
   rect(0,0,50,288);
   rect(0,288,76,192); 
   
   rect(90,0,40,288);
   rect(80,288,78,192);
   
   rect(170,0,66,288);
   rect(162,288,74,192);
   
   rect(240,0,50,288);
   rect(240,288,76,192);
   
   rect(330,0,50,288);
   rect(320,288,76,192);
   
   rect(420,0,50,288);
   rect(400,288,76,192);
   
   rect(510,0,46,288);
   rect(480,288,76,192);
   
   rect(560,0,80,480);
   
}

void draw(){
   if(keyPressed){
     if(key == 'a'){
       noStroke();
        fill(#808080);
        rect(0,0,50,288);
        rect(0,288,76,192);
        
        minim = new Minim(this);
        player = minim.loadFile("piano_do2.mp3");
        player.play();
        
     }
   }
    if(keyPressed){
     if(key == 's'){
       noStroke();
        fill(#808080);
        rect(90,0,40,288);
        rect(80,288,78,192);
        minim = new Minim(this);
        player = minim.loadFile("piano_re2.mp3");
        player.play();
        
     }
   }
   if(keyPressed){
     if(key == 'd'){
       noStroke();
        fill(#808080);
        rect(170,0,66,288);
        rect(162,288,74,192);
        minim = new Minim(this);
        player = minim.loadFile("piano_mi2.mp3");
        player.play();
        
     }
   }
   if(keyPressed){
     if(key == 'f'){
       noStroke();
        fill(#808080);
        rect(240,0,50,288);
        rect(240,288,76,192);
        minim = new Minim(this);
        player = minim.loadFile("piano_fa2.mp3");
        player.play();
        
     }
   }
   if(keyPressed){
     if(key == 'g'){
       noStroke();
        fill(#808080);
        rect(330,0,50,288);
        rect(320,288,76,192);
        minim = new Minim(this);
        player = minim.loadFile("piano_so2.mp3");
        player.play();
        
     }
   }
   if(keyPressed){
     if(key == 'h'){
       noStroke();
        fill(#808080);
        rect(420,0,50,288);
        rect(400,288,76,192);
        minim = new Minim(this);
        player = minim.loadFile("piano_ra2.mp3");
        player.play();
        
     }
   }
   if(keyPressed){
     if(key == 'j'){
       noStroke();
        fill(#808080);
        rect(510,0,46,288);
        rect(480,288,76,192);
        minim = new Minim(this);
        player = minim.loadFile("piano_si2.mp3");
        player.play();
        
     }
   }
   if(keyPressed){
     if(key == 'k'){
       noStroke();
        fill(#808080);
        rect(560,0,80,480);
        minim = new Minim(this);
        player = minim.loadFile("piano_do^2.mp3");
        player.play();
        
     }
   }

}

void stop(){
  player.close();
  minim.stop();
  super.stop();}

void keyReleased() {
  if(key == 'a'){
        fill(#FFFFFF);
        rect(0,0,50,288);
        rect(0,288,76,192);
       
     }
  if(key == 's'){
        fill(#FFFFFF);
        rect(90,0,40,288);
        rect(80,288,78,192);
       
     }
  if(key == 'd'){
        fill(#FFFFFF);
        rect(170,0,66,288);
        rect(162,288,74,192);
     }
  if(key == 'f'){
        fill(#FFFFFF);
        rect(240,0,50,288);
        rect(240,288,76,192);
     }
  if(key == 'g'){
        fill(#FFFFFF);
        rect(330,0,50,288);
        rect(320,288,76,192);
     }
  if(key == 'h'){
        fill(#FFFFFF);
        rect(420,0,50,288);
        rect(400,288,76,192);
     }
  if(key == 'j'){
        fill(#FFFFFF);
        rect(510,0,46,288);
        rect(480,288,76,192);
     }
  if(key == 'k'){
        fill(#FFFFFF);
        rect(560,0,80,480);
     }
}