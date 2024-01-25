#!/usr/bin/python2
#coding:utf8

import sys,os
from math import *

r=1
step=1.0
R=50
count=200-8
#obj = 'cylinder(1,d=1)'
text='FUAZRKXPHNIGJCYSTBEMLWOD'
obj = 'rotate(90) translate([0,-1,0]) text("%s", size = %f, font = "New", valign = "center", halign = "center")'
#obj = 'rotate(90) translate([0,-1,0]) cube([1,2,1])'
a=0.0

l_r=0
scad = open('%s.scad' %(sys.argv[0]),'w') 
polars=[]
i=0
m_90=0
ar=0
r=0.5
while r<20:
    step=2*pi*r/len(text)
    while i<len(text):
        # spiral
#    dr = spiral_step*step/(2*pi*r)
#    l_r = asin((dr/2)/step)*2*180/pi
        
        #import pdb; pdb.set_trace()
        fi_0 = acos(step/(2*r))
        a0=pi/2-fi_0
        ar=a0*180/pi + l_r
        polars.append([r,a])
        #print obj %(text[i%len(text)],r/5)
        scad.write('rotate(%s) translate([%s,0,0]) rotate(%s) linear_extrude(1) %s;\n' %(a*180/pi,r,ar,obj %(text[i%len(text)],r/4)))
        fi=fi_0-l_r*pi/180
        h=step*sin(fi)
        r = sqrt((r-step*cos(fi))**2+h**2)
        a += asin(h/r)
        
        if a>2*pi:
            a-=2*pi
            m_90=0
            polars=[]
        i+=1
    r*=1.5
    i=0
scad.close()
