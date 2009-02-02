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

#define rxPin 0
#define txPin 1
#define proximityPin 5

SoftwareSerial rfSerial =  SoftwareSerial(rxPin, txPin);

int val = 0;

void setup() {
  pinMode(proximityPin, INPUT);
 
  rfSerial.begin(2400);
  //Serial.begin(2400);
 
  delay(1000);
 
}

void loop(){
  val = analogRead(proximityPin);
  rfSerial.println(val);
  //Serial.println(val);
  delay(10);
}
