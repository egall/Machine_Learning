#!/usr/bin/python

import random
import numpy as np

def preceptron_algo():
    my_inst_array = generate_instances_list()
    w_array = [0,0,0,0,0,0,0,0,0,0,0]
    y = 0
    x = 0
    b = 0
    mistakes = 0
    for i in range(0,500):
        my_inst = my_inst_array[i]
        y = my_inst[0]
        a = np.dot(w_array, my_inst[1])
        if (y*a <= 0):
            print "updating"
            w_array = w_array + np.dot(y, my_inst[1])
            print "w_array = ", w_array
            mistakes += 1
    print mistakes

#        for j in range(0,11):
#            x = my_inst[1][j]
#            w = w_array[j]
#            a = w*x + b
#            if (y*a <= 0):
#                w_array[j] += w + x*y
#                mistakes += 1

def generate_instances_list():
    # create an array to hold each of the 500 instance
    instance_array = []
    for i in range(0,500):
        # list that will hold list of 11 random 0/1 values
        bin_list = []
        # keep track of 1's in order to set y value
        num_of_ones = 0
        y_value = -1 
        # populate bin_list
        for j in range(0,11):
            binnum = random.randint(0,1)
            if binnum == 0:
                feature = -1
            else:
                num_of_ones += 1
                feature = 1
            bin_list.append(feature)
        if num_of_ones >= 6:
            y_value = 1
        new_inst = (y_value, bin_list)
        instance_array.append(new_inst)
    return instance_array 


if __name__ == "__main__":
    preceptron_algo()

