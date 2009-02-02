"""
  This file is part of shit happens.

  Shit happens is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Foobar is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
"""

import serial
import twitter
import time
from random import randrange

twitt_login = "REPLACE_TWITTER_LOGIN"
twitt_pass = "REPLACE_TWITTER_PASS"

serconn = serial.Serial('/dev/tty.usbserial-A1001NQe', 2400)
min_distance = 60
max_distance = 400
minimum_time = 150
now = time.strftime("%a, %d %b %Y %H:%M:%S +0000", 
                    time.gmtime())
messages = [ "Guess where I am?",
             "It smells good.", 
             "Oops... I did it again." ]
sign = "http://is.gd/i4Io #shithappens"
    

if __name__ == '__main__':
    previous_state = False #False eh nao cagando
    actual_distance = 0
    previous_distance = 0
    working_time = 0
    idle_time = 0
    
    twitter = twitter.Api(twitt_login, twitt_pass)
    
    while True:
    	actual_distance = serconn.readline()
    	print(actual_distance)
    	
    	try:
    	    actual_distance = int(str(actual_distance).replace("\n","").replace(" ",""))
    	except:
    	    actual_distance = previous_distance
    	    
    	if actual_distance > max_distance and previous_distance > max_distance:
    	    working_time += 1
    	elif actual_distance < max_distance and previous_distance < max_distance:
    	    idle_time += 1
    	
    	if working_time > minimum_time:
    	    working_time = 0
    	    idle_time = 0
    	    if previous_state == False:
    	        msg = "%s - %s" % [ messages[randrange(len(messages))], sign ]
                twitter.PostUpdate(msg)
                print "%s: message sent" % now
                
    	    previous_state = True
    	
    	if idle_time > minimum_time:
    	    idle_time = 0
    	    working_time = 0
    	    previous_state = False
    	    #print("free...")
    	    
    	previous_distance = actual_distance
    	
    ser.close()