#!/usr/bin/python

import random

def preceptron_algo():
    my_inst_array = generate_instances_list()
    w = 0
    y = 0
    x = 0
    b = 0
    for i in range(0,500):
        my_inst = my_inst_array[i]
        y = my_inst[0]
        for j in range(0,11):
            x = my_inst[1][j]
            a = w*x + b
            if a*y <= 0:
                w = w + x*y
            print "a =", a
            print "w =", w

def generate_instances_list():
    # create an array to hold each of the 500 instance
    instance_array = []
    for i in range(0,500):
        # list that will hold list of 11 random 0/1 values
        bin_list = []
        # populate bin_list
        for j in range(0,11):
            binnum = random.randint(0,1)
            if binnum == 0:
                feature = -1
            else:
                feature = 1
            bin_list.append(feature)
        new_inst = (bin_list[0], bin_list)
        instance_array.append(new_inst)
    return instance_array 


if __name__ == "__main__":
    preceptron_algo()

