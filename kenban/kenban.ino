/*
 * Arduino側プログラム
 * arduino - processing通信部分参考:http://yoppa.org/tau_bmaw13/4772.html
 * ver2.1 シリアルテスト+gitへの反映テスト
 */

int sensors[8] = {}; // センサの値を格納する配列の宣言と初期化
int inByte = 0; //受信するシリアル通信の文字列の宣言と初期化

void setup() {
  // 9600bpsでシリアル通信する
  Serial.begin(9600);
  // 通信開始
  establishContact();
}

void loop() {
  if (Serial.available() > 0) {
      // 受信した文字列を読み込む
      inByte = Serial.read();
      // 値を計測
      sensors[0] = analogRead(A0);
      sensors[1] = analogRead(A1);
      sensors[2] = analogRead(A2);
      sensors[3] = analogRead(A3);
      sensors[4] = analogRead(A4);
      sensors[5] = analogRead(A5);
      sensors[6] = analogRead(A6);
      sensors[7] = analogRead(A7);
      // コンマ区切りで値を送出
      for (int i=0; i<7; i++) {
          Serial.print(sensors[i]);
          Serial.print(",");
        }
      Serial.println(sensors[7]);
    }
}

void establishContact() {
  // Processingから何か文字が送られてくるのを待つ
  while (Serial.available() <= 0) {
      Serial.println("0,0,0,0,0,0,0,0");
      delay(50);
    }
  }
