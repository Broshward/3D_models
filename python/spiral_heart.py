#!/usr/bin/python2
#coding:utf8

import sys,os
from math import *

r=10
step=1.0
R=50
count=264
#obj = 'cylinder(1,d=1)'
text='FUAZRKXPHNIGJCYSTBEMLWOD'
obj = 'rotate(90) translate([0,-1,0]) text("%s", size = %f, font = "New", valign = "center")'
a=0.0

spiral_step = +10 # archimedes spiral
l_r=0
scad = open('%s.scad' %(sys.argv[0]),'w') 
polars=[]
i=0
m_90=0
ar=0
while i<count:
    # spiral
#    dr = spiral_step*step/(2*pi*r)
#    l_r = asin((dr/2)/step)*2*180/pi
    if a < pi/2:
        if len(polars)!=0:
            l_r+=(70-l_r)/(pi/2*polars[0][0]/step)
    elif a < pi:
        if m_90==0:
            m_90=1
            l_r = -1*l_r-4
        else:
            l_r+=(0-l_r)/(pi/2*polars[0][0]/step)
    elif a < 270*pi/180:
        temp_step = (polars[0][0]+spiral_step) - r #(step/((2*pi-a)*r)
        dr = temp_step*step/((3*pi/2-a)*r)
        l_r = -asin((dr/2)/step)*2*180/pi
    else:
        temp_step = polars[0][0]+spiral_step - r #(step/((2*pi-a)*r)
        dr = temp_step*step/((2*pi-a)*r)
        l_r = -asin((dr/2)/step)*2*180/pi
    
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
    
    step=r/5
    spiral_step+=(asin(h/r)/(2*pi)*r)*0.25
    print spiral_step , asin(h/r)/(2*pi)
    if a>2*pi:
        a-=2*pi
        m_90=0
        polars=[]
    i+=1
scad.close()
