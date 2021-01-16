#!/usr/bin/env python
# -*- coding: utf-8 -*-
## License: Apache 2.0. See LICENSE file in root directory.
## Copyright(c) 2019 Intel Corporation. All Rights Reserved.
from __future__ import print_function

import pymp
import threading
from multiprocessing import Process
import time
import csv
import math
import numpy as np
import numpy

#import keyboard
import sys



# Globale Variables 
Stopp = 0




####################################################################
# import c document as a shared file
from ctypes import *
so_file = "/home/local/Frederik_2/mobotware/rhd/trunk/testprogs/simpleclient/wheel_odo.so"

testprog_mt = CDLL(so_file)

####################################################################


#filename = 'Tjek_Traad.csv'
#f=open(filename,"w+")



# First program

def f1(): 
    
    # Sample rate for odometry  
    print_var = 0 #initilize 
    print_val = 2 # Samle rate. (2 ~ 100Hz)
   
    # Duty cycle (Ensures minimum turnaround time)
    omloebstid = 0.004999

    
    # Correction help - counter
    coor_count = 0
    theta_rot = 0

    #coriger_y = 0
    #pose_x_plus = 0
    #coriger_y = 0
    #pose_y_plus = 0
    #pose_x_camera = 0
    #pose_yz_camera
    


    # Defines arrays
    Print_array = [[0, 0, 0, 0], [0, 0, 0, 0]]
    i = 0
    array_robot = [[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]]
    
       
    # Global
    global Stopp
    
   

    import pyrealsense2 as rs


    # load wheel odometry config before pipe.start(...)
    # get profile/device/ wheel odometry sensor by profile = cfg.resolve(pipe)
    pipe = rs.pipeline()
    cfg = rs.config()

    cfg.enable_stream(rs.stream.pose)

    profile = cfg.resolve(pipe)
    dev = profile.get_device()
    tm2 = dev.as_tm2()

    # Create csv-file 
    #filename = 'test_u_t_1.csv'
    #f=open(filename,"w+")




    if(tm2):

    ####################################### Hvis det er en traad
        #test_u_t.init()
        #test_u_t.connect()
    #######################################


        # tm2.first_wheel_odometer()?
        pose_sensor = tm2.first_pose_sensor()
        wheel_odometer = pose_sensor.as_wheel_odometer()

        
        # calibration to list of uint8
        f = open("calibration_odometry.json")
        chars = []
        for line in f:
           for c in line:
               chars.append(ord(c))  # char to uint8

        # load/configure wheel 
        wheel_odometer.load_wheel_odometery_config(chars)

        pipe.start(cfg)
        try:
        
        

            #while((test_u_t.rhdSync() > 0) and (test_u_t.counter <= test_u_t.samples)):
             #   test_u_t.loop()
             
                
            # For the timer
            startTime = time.time() 
            endTime = startTime 
            lapNum = 1
            
            
            while True:   # Main loop
            
            
          
                """#################################################################
                # calibration to list of uint8
                f = open("calibration_odometry.json")
                chars = []
                for line in f:
                    for c in line:
                        chars.append(ord(c))  # char to uint8

                # load/configure wheel 
                wheel_odometer.load_wheel_odometery_config(chars)
                ###################################################################
                """
                frames = pipe.wait_for_frames()
                pose = frames.get_pose_frame()

                #test_u_t.loop() # koerer c-program (so-fil)  # hvis det er en traad
                #time.sleep(0.008)
            
                if pose:
                    
                    
                    data = pose.get_pose_data()
                    print("Frame #{}".format(pose.frame_number))
                    print("Position: {}".format(data.translation))
                    
                    #time.sleep(0.007)
                    #print(data.translation.x)
                    
                    
                    
                    # Retrieves pos and other data from Wheels
                    px = testprog_mt.pos_rx()/1000000.000000
                    py = testprog_mt.pos_ry()/1000000.000000
                    
                    encl11 = testprog_mt.encl()
                    encr11 = testprog_mt.encr()
                    
                    th_r = testprog_mt.th_robot()/1000000.000000
                    
                    
                    # The output position of the camera
                    x_c = data.translation.x
                    y_c = data.translation.z
                    
                    
                    # Corrigating the camera pose (This is not active anymore only to calculta a theta)
                    if (px > 0 and px <= 0.2):
                        print("Er her i loopet med 10 cm")
                        if (coor_count == 0):
                            print("skal printesen gang")
                            frame_start = pose.frame_number
                            coor_count += 1
                        frame_slut = pose.frame_number 
                    if (px >= 0.30): # -------------------------her fra starter theta----------
                        if (coor_count == 1):
                            print("er i korigeringen------------------------")
                            frame_antal = frame_slut-frame_start
                               
                            #coriger_x = 0 - (x_c)
                            theta_rot_1 = math.atan((0 - x_c)  / y_c)
                            
                            #theta_rot = theta_rot_1
                            coor_count += 1
                            
                        if (px >= 0.40 and coor_count == 2):
                            theta_rot_2 = math.atan((0 - x_c)  / y_c)
                            
                            #theta_rot = theta_rot_2
                            coor_count += 1
                        
                        if (px >= 0.50 and coor_count == 3):
                            theta_rot_3 = math.atan((0 - x_c)  / y_c)
                            
                            #theta_rot = theta_rot_2
                            coor_count += 1
                        
                        if (px >= 0.65 and coor_count == 4):
                            theta_rot_4 = math.atan((0 - x_c)  / y_c)
                            
                            #theta_rot = theta_rot_2
                            coor_count += 1
                        
                        if (px >= 0.80 and coor_count == 5):
                            theta_rot_5 = math.atan((0 - x_c)  / y_c)
                            
                            #theta_rot = theta_rot_3
                            coor_count += 1                        
                        if (px >= 0.95 and coor_count == 6):
                            theta_rot_6 = math.atan((0 - x_c)  / y_c)
                            
                            #theta_rot = theta_rot_2
                            coor_count += 1
                            
                        if (px >= 0.965 and coor_count == 7):
                            theta_rot_7 = math.atan((0 - x_c)  / y_c)
                            
                            #theta_rot = theta_rot_2
                            coor_count += 1
                         
                        if (px >= 0.98 and coor_count == 8):
                            theta_rot_8 = math.atan((0 - x_c)  / y_c)
                            
                            #theta_rot = theta_rot_2
                            coor_count += 1    
                        if (px > 1.0 and coor_count == 9):
                            theta_rot_9 = math.atan((0 - x_c)  / y_c)
                            
                            theta_rot = (theta_rot_1 + theta_rot_2 + theta_rot_3 + theta_rot_4 + theta_rot_5 + theta_rot_6 + + theta_rot_7 + theta_rot_8 + theta_rot_9) / (9)
                            coor_count += 1  
                    
                         
                    print("theta_rot")
                    print(theta_rot)
                   
                    # The pose rotating (Not active anymore)
                    pose_x_rot = x_c #(x_c * math.cos(theta_rot) + y_c * math.sin(theta_rot))
                    pose_yz_rot = y_c #(-x_c * math.sin(theta_rot) + y_c * math.cos(theta_rot))
                    
                    #if (coor_count > 2):
                        #print("_____theta rot__har været her___" +str(theta_rot))
                           
                          
                            #coriger_x = 0 - data.translation.x
                            #pose_x_plus = (coriger_x / frame_antal)
                            
                            #coriger_y = sqrt(coriger_x^2 + data.translation.z^2) - data.translation.y
                            #pose_y_plus = (coriger_y) / (frame_antal)                         
                     
                    #if (py >= 0.05):
                        #print("if 0.05 pos")
                        #if (coor_count == 1):
                            #print("corigerer 1 gang")
                            #pose_x_camera = data.translation.x + coriger_x
                            #pose_yz_camera = data.translation.y + coriger_y
                            #coor_count += 1
                    #else:
                        #pose_x_camera = data.translation.x + pose_x_plus + coriger_x
                        #pose_yz_camera = data.translation.y + pose_y_plus + coriger_y
                    
                   # print(Decimal(pose_x_camera)) 
                    #print((pose_yz_camera))

         
                    
                    #/////////////////////////////////adding to arraies//////////////////////////////////////# 
                    time_print = (time.time() - startTime) # The time which is printet to the data
                    
                    # write new row with coordinates 
                    new_row = [pose_x_rot, data.translation.y, pose_yz_rot, time_print]                
                    Print_array = np.vstack((Print_array, new_row))
                    #print(new_row)
                    #print(Print_array)
                    
                    #time_print_r = time.time()
                    new_row_rp = [-py, px, th_r, time_print, encl11, encr11] # be aware that it has been swapped around to make it fit z, x from camera
                    array_robot = np.vstack((array_robot, new_row_rp))
                    #print(new_row_rp)
                    #print(array_robot)
                    
                    
                    
                    
                    
                   #///////////////////////////////////////////////////////////////////////# 
                    
                    
                    # if stop-comand is given then:
                    if(Stopp == 1):
                        print("----------------------------------------------------------------")
                        print("Printing array to csv")
                        print("----------------------------------------------------------------")
                        print(Print_array)                                             
                        numpy.savetxt("camera_pose.csv", Print_array, delimiter = ",")
                        
                        print(array_robot)
                        numpy.savetxt("robo_tpose.csv", array_robot, delimiter = ",")
                        
                        sys.exit()
                        break
                            
                    
                    
                    ########################################################################                    
                    
               
                    
                    i += 1
                    
                    
                    """
                    #########################################################
                    # Prints pose to csv
                    csv1=time.time()
                    with open(filename, mode='a+') as output_file:
                        f = csv.writer(output_file, delimiter=',' , quoting=csv.QUOTE_MINIMAL)
                        f.writerow([format(data.translation)])
                    csv2=time.time()   
                    csv_t=csv2-csv1
                    print("CSV-Time "+str(csv_t))
                   
                    #time.sleep(0.007)
                    #########################################################
                    """
                    
                    
                    # provide wheel odometry as velocity measurement
                    # Wheel 1
                    
                    wo_sensor_id = 0  # indexed from 0, match to order in calibration file      # hedder rigtigt 0
                    frame_num = 0  # not used
                    v = rs.vector()
                    #v.x = testprog_mt.velocity_y()/1000000.000000 # m/s
                    #v.y =0
                    v.z = -testprog_mt.velocity()/1000000.000000 # m/s
                    
                    print(v)
                    
                    if (print_var == print_val):
                        wheel_odometer.send_wheel_odometry(wo_sensor_id, frame_num, v)
                        print_var = 0
                    print_var += 1
                    
                    
                    """
                    ##############################################################################################################
                    # wheel 2
                    wo_sensor_id2 = 1  # indexed from 0, match to order in calibration file      # hedder rigtigt 0
                    frame_num2 = 0  # not used
                    v2 = rs.vector()
                    #v.x = testprog_mt.velocity_y()/1000000.000000 # m/s
                    #v.y =0
                    v2.z = -testprog_mt.velocity()/1000000.000000 # m/s ####################################
                    
                    print(v2)
                   

                    wheel_odometer.send_wheel_odometry(wo_sensor_id2, frame_num2, v2)
                    ###############################################################################################################
                    """
                   
                    lapTime = (time.time() - endTime)
      
                    # Total time used
                    totalTime = (time.time() - startTime) 
       
                    # Printing the lap-number, lap-time and total-time 
                    print("Lap No. "+str(lapNum))  
                    print("Lap Time: "+str(lapTime))
                    #print("Total Time: "+str(totalTime))
                    # Updating the values 
                    endTime = time.time() 
                    
                   
                    """
                    tid_ekstra_start = time.time()
                    if ((lapTime) < omloebstid):
                        tid_plus = omloebstid - (lapTime)
                        time.sleep(tid_plus)
                        
                       
                    tid_ekstra_slut = time.time()
                    lapTime_end = lapTime+(tid_ekstra_slut-tid_ekstra_start)
                    print("Lap Time_end: "+str(lapTime_end))
                    
                    #tid_plus = omloebstid - (lapTime)
                    #lapTime_end=((lapTime)+tid_plus)
                    #print("Lap No. "+str(lapNum))  
                    #print("Lap Time_end: "+str(lapTime_end))
                    #print(lapTime+1)    
                    
                    """
                    
                    lapNum += 1  

                
                
                #time.sleep(.007)


        finally:
            pipe.stop()





def f2():
    # for checking
    # T_2 = 0
    
    # Global
    global Stopp

    testprog_mt.main()

    #testprog_mt.init()
    #testprog_mt.connect()
    #while True:
     #   testprog_mt.loop()
    if(Stopp == 1):
        sys.exit()
        #break
    
   

    #while((testprog_mt.rhdSync() > 0) and (testprog_mt.counter <= testprog_mt.samples)):
     #   testprog_mt.loop() 
    # while True:   # aendret fra for _ in range(100): - Programet fortsaetter nu med at printe position
  #  	testprog_mt.loop()


       # print("T_2 = " +str(T_2))
       # print("_______________________" +str(T_2))
       # T_2 += 1 


##########################################################################




def stopper():
    global Stopp
    
    tell = 0
    while True:
        time.sleep(1)
        if (tell == 120): # switch to keyboard here if you want to use keyboard to stop (interrupt) 
            testprog_mt.stop(1)
            Stopp = 1
            sys.exit
            break
        tell += 1
    



# Main starts the threads
def main():

    #t1 = Process(target=f1)
    #t1.start()
    #t2 = Process(target=f2)
    #t2.start()
    #t1.daemon = True
    #t2.daemon = True



    t1 = threading.Thread(target = f1)
    #t1.daemon = True
    t2 = threading.Thread(target = f2)
    t3 = threading.Thread(target = stopper)
    
    #t2.daemon = True
    t1.start()
    t2.start()
    t3.start()
    
    #t1.join()
    #t2.join()
    #t3.join()
    
   
    
   
# calling main()
main() 