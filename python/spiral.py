#!/usr/bin/python2

import sys,os
from math import *

r=90
step=10.0
R=50
count=200
#obj = 'cylinder(1,d=1)'
obj = 'rotate(90) translate([0,-1,0]) cube([10,2,1])'
a=0.0

spiral_step = 10 # archimedes spiral
l_r=2
scad = open('test.scad','w')
polars=[]
i=0
m_90=0
ar=0
while i<count:
    # spiral
    dr = spiral_step*step/(2*pi*r)
    l_r = asin((dr/2)/step)*2*180/pi
#    if a < pi/2:
#        l_r+=2
#    elif a < pi:
#        if m_90==0:
#            m_90=1
#            l_r = -l_r
#        else:
#            l_r+=2
#    elif a < 270*pi/180:
#        l_r+=1
    
    print int(a*180/pi),r,l_r
    #import pdb; pdb.set_trace()
    fi_0 = acos(step/(2*r))
    a0=pi/2-fi_0
    ar=a0*180/pi + l_r
    polars.append([r,a])
    scad.write('rotate(%s) translate([%s,0,0]) rotate(%s) %s;\n' %(a*180/pi,r,ar,obj))
    fi=fi_0-l_r*pi/180
    h=step*sin(fi)
    r = sqrt((r-step*cos(fi))**2+h**2)
    a += asin(h/r)

    if a>2*pi:
        a-=2*pi
        m_90=0
    i+=1
scad.close()
