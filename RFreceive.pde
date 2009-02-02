/*
 *  This file is part of shit happens.
 *
 *  Shit happens is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  Foobar is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <SoftwareSerial.h>

#define rxPin 2
#define txPin 1
#define ledPin 13

// set up a new serial connection
SoftwareSerial rfSerial =  SoftwareSerial(rxPin, txPin);

void setup() {

  pinMode(rxPin, INPUT);
  pinMode(ledPin, OUTPUT);

  rfSerial.begin(2400);
  Serial.begin(2400);

  digitalWrite(ledPin,HIGH);
  delay(1000);
  digitalWrite(ledPin,LOW);
}

void loop(){
  char val = '0';
  val = rfSerial.read();
  Serial.print(val);
}
