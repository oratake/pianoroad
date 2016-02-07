// ライブラリのインポート
import processing.serial.*;
import rwmidi.*;

// インスタンス
Serial myPort;
MidiOutput output;

int do4, re4, mi4, fa4, so4, la4, si4, do5;
int C4, D4, E4, F4, G4, A4, B4, C5;
int lengH = 250; //ヒステリシス上
int lengL = 120; //同、下
int ch = 0; //Midi Ch
int note = 60; //Note
int vel = 127;  //Velocity
int program = 1; // プログラムチェンジ
int dev = 1; //音源の設定
int devLength = 0; // デバイスの数

void setup(){
  size(256,256);

  // ポート名(Arduinoで選択したもの)とスピードを指定してシリアルポートを開く
  myPort = new Serial(this, "/dev/cu.usbmodem1411", 9600);
  // 改行コードが受信されるまで受信し続ける
  myPort.bufferUntil('\n');

  devLength = RWMidi.getOutputDevices ().length;
  output = RWMidi.getOutputDevices () [dev].createOutput();
  output.sendProgramChange (program);
  
  for (int i = 0; i < devLength; i++) {
    println ("Output Device " + i + " : " +  RWMidi.getOutputDevices () [i].getName() );
  }
}

void draw(){
  background (0, 104, 55);
  text ("Device Name: " + output.getName (), 15, 20);
  text ("Program Change: " + program, 15, 40);
  text ("Click and release MLB! ", 15, 80);
  if(do4>lengH&&C4==0){C4=1;output.sendNoteOn(ch,60,vel);}
  if(do4<lengL&&C4==1){C4=0;output.sendNoteOff(ch,60,vel);}
  if(re4>lengH&&D4==0){D4=1;output.sendNoteOn(ch,62,vel);}
  if(re4<lengL&&D4==1){D4=0;output.sendNoteOff(ch,62,vel);}
  if(mi4>lengH&&E4==0){E4=1;output.sendNoteOn(ch,64,vel);}
  if(mi4<lengL&&E4==1){E4=0;output.sendNoteOff(ch,64,vel);}
  if(fa4>lengH&&F4==0){F4=1;output.sendNoteOn(ch,65,vel);}
  if(fa4<lengL&&F4==1){F4=0;output.sendNoteOff(ch,65,vel);}
  if(so4>lengH&&G4==0){G4=1;output.sendNoteOn(ch,67,vel);}
  if(so4<lengL&&G4==1){G4=0;output.sendNoteOff(ch,67,vel);}
  if(la4>lengH&&A4==0){A4=1;output.sendNoteOn(ch,69,vel);}
  if(la4<lengL&&A4==1){A4=0;output.sendNoteOff(ch,69,vel);}
  if(si4>lengH&&B4==0){B4=1;output.sendNoteOn(ch,71,vel);}
  if(si4<lengL&&B4==1){B4=0;output.sendNoteOff(ch,71,vel);}
  if(do5>lengH&&C5==0){C5=1;output.sendNoteOn(ch,72,vel);}
  if(do5<lengL&&C5==1){C5=0;output.sendNoteOff(ch,72,vel);}
}

void serialEvent(Serial myPort) {
 // シリアルのバッファを読み込む 
 String myString = myPort.readStringUntil('\n');
 // 空白等余計な部分のカット
 myString = trim(myString);
 // コンマ区切りの複数情報を読み込む
 int sensors[] = int(split(myString, ','));
 // 読み込んだ数だけ配列に格納
 if (sensors.length > 1) {
     do4 = sensors[0];
     re4 = sensors[1];
     mi4 = sensors[2];
     fa4 = sensors[3];
     so4 = sensors[4];
     la4 = sensors[5];
     si4 = sensors[6];
     do5 = sensors[7];
     println(do4+", "+re4+", "+mi4+", "+fa4+", "+so4+", "+la4+", "+si4+", "+do5);
 }
 // 読み込み完了後、次の情報を要求
 myPort.write("65");
}