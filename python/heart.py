#!/usr/bin/python2

import sys,os
from math import *

r=10
step=1.0
R=50
count=3200
#obj = 'cylinder(1,d=1)'
obj = 'rotate(90) translate([0,-1,0]) cube([1,2,1])'
a=0.0

spiral_step = +10 # archimedes spiral
l_r=0
scad = open('test.scad','w')
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
            l_r+=(60-l_r)/(pi/2*polars[0][0]/step)
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
    
    print step
    #import pdb; pdb.set_trace()
    fi_0 = acos(step/(2*r))
    a0=pi/2-fi_0
    ar=a0*180/pi + l_r
    polars.append([r,a])
    scad.write('rotate(%s) translate([%s,0,0]) rotate(%s) scale(%s) %s;\n' %(a*180/pi,r,ar,r/5,obj))
    fi=fi_0-l_r*pi/180
    h=step*sin(fi)
    r = sqrt((r-step*cos(fi))**2+h**2)
    a += asin(h/r)
    
    step=r/5
    spiral_step+=(asin(h/r)/(2*pi)*r)*0.3
    print spiral_step , asin(h/r)/(2*pi)
    if a>2*pi:
        a-=2*pi
        m_90=0
        polars=[]
    i+=1
scad.close()
