#!/usr/bin/python

from time import sleep
from pifacedigitalio import digital_write, init

CLOCK_TIME = 0.0001

DELAY = 0.05  # seconds
LOOPCOUNT = 10
COUNT = 0
ID = 1

def ioWrite(pin, state):
    digital_write(pin, state)
    print 'Pin:' + pin + '>' + state

def serialWriteBit(data):
    for x in range(0, 7):
        ioWrite(7, data[x])
        ioWrite(6, 1)
        sleep(CLOCK_TIME)
        ioWrite(6, 0)


if __name__ == "__main__":
    init()
    while True:
        serialWriteBit([0, 1, 1, 0, 0, 1, 1, 0])
        sleep(10)







