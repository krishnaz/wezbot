#!/usr/bin/python

from time import sleep
from pifacedigitalio import digital_write, init
import thread


CLOCK_TIME = 0.0001
LOOPCOUNT = 10
COUNT = 0
ID = 1

def ioWrite(pin, state):
    digital_write(pin, state)
 #   print 'Pin:' + str(pin) + '>' + str(state)

def serialWriteBit(data):
    for x in range(0, len(data)-1):
        ioWrite(7, data[x])
        ioWrite(6, 1)
	sleep(CLOCK_TIME)
        ioWrite(6, 0)
    ioWrite(7, 0)

def writeMotor(data):
 for x in range(0, 4):
        ioWrite(1+x, data[x])
	sleep(0.0001)

def serialLoop(threadName,delay):
  while True:
        serialWriteBit([0, 1,0,1,1,1,0,1,1,1,0,0, 1, 0, 0, 1, 1, 0])

def motorLoop(threadName, delay):
    ioWrite(0, 1)
    while True:
        writeMotor([1,1,0,0])
        writeMotor([0,1,0,0])
        writeMotor([0,1,1,0])
        writeMotor([0,0,1,0])
        writeMotor([0,0,1,1])
        writeMotor([0,0,0,1])
        writeMotor([1,0,0,1])
        writeMotor([1,0,0,0])

if __name__ == "__main__":
    init()
    thread.start_new_thread(serialLoop,('serial',0)) 
    thread.start_new_thread(motorLoop, ('motor',0))

while 1:
    pass
