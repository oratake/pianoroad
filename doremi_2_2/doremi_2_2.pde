// ライブラリのインポート
import processing.serial.*;
import rwmidi.*;

// インスタンス
Serial myPort;
MidiOutput output;

int do4;
int re4;
int mi4;
int fa4;
int so4;
int la4;
int si4;
int do5;
int lengH = 200; //ヒステリシス上
int lengL = 120; //同、下
int ch = 0; //Midi Ch
int note = 60; //Note
int vel = 127;  //Velocity
int program = 1; // プログラムチェンジ
int dev = 1; //音源の設定
int devLength = 0; // デバイスの数
int C4 = 0;
int E4 = 0;

void setup(){
  size(256,256);

  // ポート名(Arduinoで選択したもの)とスピードを指定してシリアルポートを開く
  myPort = new Serial(this, "/dev/cu.usbmodem1451", 9600);
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
  if(re4>lengH&&E4==0){E4=1;output.sendNoteOn(ch,64,vel);}
  if(re4<lengL&&E4==1){E4=0;output.sendNoteOff(ch,64,vel);}
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
 }
 // 読み込み完了後、次の情報を要求
 myPort.write("65");
}