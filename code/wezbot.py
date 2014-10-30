#!/usr/bin/python
from time import sleep
import pifacedigitalio as p

DELAY = 0.05  # seconds
LOOPCOUNT = 10
COUNT = 0
ID = 1

if __name__ == "__main__":
    p.init()
    while True:
        if (p.digital_read(0)):
                LOOPCOUNT = max(LOOPCOUNT / 2, 0.05)
        if (p.digital_read(1)):
                LOOPCOUNT = 100
        if (p.digital_read(2)):
                LOOPCOUNT = LOOPCOUNT * 2

        COUNT -= 1
        if (COUNT <= 0):
                COUNT = LOOPCOUNT
                p.digital_write(ID, 0)
                ID+=1
                ID=ID % 8
                p.digital_write(ID, 1)
        sleep(0.01)

