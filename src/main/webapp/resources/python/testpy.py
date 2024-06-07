#!/usr/bin/env python
# coding: utf-8

# In[ ]: 

a= 2
b = 1
c = a+b

def update_variables(new_b):
    global b, c
    b = new_b
    c = a + b

