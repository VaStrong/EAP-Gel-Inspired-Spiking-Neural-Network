#include <Adafruit_INA219.h>
#include <Wire.h>

#define ELECT_BLK_NEG 22
#define ELECT_BLK_POS 24
#define ELECT_RED_NEG 25
#define ELECT_RED_POS 23
#define ELECT_WHT_NEG 27
#define ELECT_WHT_POS 26
#define BUTN_1 28
#define BUTN_2 29
#define BUTN_3 30
#define BUTN_4 31
#define WHT_DIRCT 33

Adafruit_INA219 ina219;


void setup() {
  // put your setup code here, to run once:
  pinMode(ELECT_BLK_NEG, OUTPUT);
  pinMode(ELECT_BLK_POS, OUTPUT);
  pinMode(ELECT_RED_NEG, OUTPUT);
  pinMode(ELECT_RED_POS, OUTPUT);
  pinMode(ELECT_WHT_NEG, OUTPUT);
  pinMode(ELECT_WHT_POS, OUTPUT);
  pinMode(BUTN_1, INPUT);
  pinMode(BUTN_2, INPUT);
  pinMode(BUTN_3, INPUT);
  pinMode(BUTN_4, INPUT);
  pinMode(WHT_DIRCT, INPUT);
  pinMode(LED_BUILTIN, OUTPUT);

  digitalWrite(ELECT_BLK_NEG, !false);
  digitalWrite(ELECT_BLK_POS, !false);
  digitalWrite(ELECT_RED_NEG, !false);
  digitalWrite(ELECT_RED_POS, !false);
  digitalWrite(ELECT_WHT_NEG, !false);
  digitalWrite(ELECT_WHT_POS, !false);

}

void loop() {
  // put your main code here, to run repeatedly:

  if(digitalRead(BUTN_1)){//gel positive stimulation
    resetStim();
    delay(500);
    digitalWrite(ELECT_BLK_NEG, !true);
    digitalWrite(ELECT_RED_POS, !true);
  }
  else if(digitalRead(BUTN_2)){//gel negative stimulation
    resetStim();
    delay(500);
    digitalWrite(ELECT_BLK_POS, !true);
    digitalWrite(ELECT_RED_NEG, !true);
  }
  else if(digitalRead(BUTN_3)){//gel weight stimulation
    resetStim();
    delay(500);
    if(digitalRead(WHT_DIRCT)){
      digitalWrite(ELECT_WHT_POS, !true);
      digitalWrite(ELECT_BLK_NEG, !true);
      digitalWrite(ELECT_RED_NEG, !true);
    }else{
      digitalWrite(ELECT_WHT_NEG, !true);
      digitalWrite(ELECT_BLK_POS, !true);
      digitalWrite(ELECT_RED_POS, !true);
    }
  }
  else if(digitalRead(BUTN_4)){//gel reset stimulation
    resetStim();
  }
  
}

void resetStim(){
  digitalWrite(ELECT_BLK_NEG, !false);
  digitalWrite(ELECT_BLK_POS, !false);
  digitalWrite(ELECT_RED_NEG, !false);
  digitalWrite(ELECT_RED_POS, !false);
  digitalWrite(ELECT_WHT_NEG, !false);
  digitalWrite(ELECT_WHT_POS, !false);
}

String getValues(){// get the values from the current sensor
  float shuntvoltage = 0;
  float busvoltage = 0;
  float current_mA = 0;
  float loadvoltage = 0;
  float power_mW = 0;

  shuntvoltage = ina219.getShuntVoltage_mV();
  busvoltage = ina219.getBusVoltage_V();
  current_mA = ina219.getCurrent_mA();
  power_mW = ina219.getPower_mW();
  loadvoltage = busvoltage + (shuntvoltage / 1000);

  long timeStamp = millis();

  String result = String(shuntvoltage) + "," + String(busvoltage) + "," + String(current_mA) + "," + String(loadvoltage) + "," + String(power_mW) + "," + String(timeStamp);
  return result;
}





