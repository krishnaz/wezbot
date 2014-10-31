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

        p.digital_write(ID, 1)
        ID += 1
        ID = ID % 4
        p.digital_write(ID, 0)

        sleep(0.0001)

