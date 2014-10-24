#!/usr/bin/python

import random
import numpy as np
import operator 

def preceptron_algo():
    my_inst_array = generate_instances_list()
    w_array = [0,0,0,0,0,0,0,0,0,0,0]
    y = 0
    x = 0
    b = 0
    w_array_sum =[0,0,0,0,0,0,0,0,0,0,0]
    w_array_avg =[0,0,0,0,0,0,0,0,0,0,0]
    mistakes = 0
    y_vote = 0
    for j in range(0,2):
        for i in range(0,500):
            my_inst = my_inst_array[i]
            y = my_inst[0]
            a = np.dot(w_array, my_inst[1])
            # sum up all of our w_arrays so that we can average them later
            w_array_sum = map(operator.add, w_array, w_array_sum)
            if (a <= 0):
                y_vote += -1
            else:
                y_vote += 1
            if (y*a <= 0):
    #            print "updating"
                w_array = w_array + np.dot(y, my_inst[1])
    #            print "w_array = ", w_array
    w_array_avg[:] = [x*1/1000 for x in w_array_sum]
#    print "w_array_sum = ", w_array_sum
#    print "w_array_avg = ", w_array_avg
#    print "w_array = ", w_array
#    print "y_vote = ", y_vote

    my_test_array = generate_instances_list()
    last_w_mistakes = 0
    last_w_array = w_array
    # this for loop will test our last w_array
    for i in range(0, 500):
        my_test_last = my_test_array[i]
        y = my_test_last[0]
        a = np.dot(last_w_array, my_test_last[1])
        if( y*a <= 0):
            last_w_mistakes += 1
            last_w_array = last_w_array + np.dot(y, my_test_last[1])
            
    print "last mistakes =", last_w_mistakes

    avg_w_mistakes = 0
    avg_mistakes = 0
    for i in range(0, 500):
        my_test_avg = my_test_array[i]
        y = my_test_avg[0]
        a = np.dot(w_array_avg, my_test_avg[1])
        if( y*a <= 0):
            avg_mistakes += 1
            w_array_avg = w_array_avg + np.dot(y, my_test_avg[1])
    print "avg mistakes = ", avg_mistakes 

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
        
        r = random.uniform(-3,3)
        label = r + sum(bin_list)
        #print "label = ", label
        new_inst = (label, bin_list)
        instance_array.append(new_inst)
    return instance_array 


if __name__ == "__main__":
    preceptron_algo()

