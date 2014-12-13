#!/usr/bin/python

from time import sleep
from pifacedigitalio import digital_write, init
import threading

exitFlag = 0
threadLock = threading.Lock()

def ioWrite(pin, state):
    threadLock.acquire()
    digital_write(pin, state)
    threadLock.release()

def writeMotor(data):
 for x in range(0, 4):
        ioWrite(1+x, data[x])
        sleep(0.0001)

class myThread (threading.Thread):
    def __init__(self, threadID, name, counter):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
    def run(self):
        print "Starting " + self.name
        print_time(self.name)
        print "Exiting " + self.name

def print_time(threadName):
    while not exitFlag:
        writeMotor([1,1,0,0])
        writeMotor([0,1,0,0])
        writeMotor([0,1,1,0])
        writeMotor([0,0,1,0])
        writeMotor([0,0,1,1])
        writeMotor([0,0,0,1])
        writeMotor([1,0,0,1])
        writeMotor([1,0,0,0])

# Create new threads
init()
ioWrite(0, 1)
thread1 = myThread(1, "Thread-1", 1)

# Start new Threads
thread1.start()

thread1.join()
print "Exiting Main Thread"
