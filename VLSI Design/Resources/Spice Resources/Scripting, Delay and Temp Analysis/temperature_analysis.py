import os
import subprocess
# import time

#destination file name should be written here
command = "ngspice destination.ckt"

fp3 = open("output.txt",'w')
fp3.close()

for i in range(0,100):

    #open src file and output file
    f1 = open("source.ckt",'r') #source file
    f2 = open("destination.ckt",'w') #run file/destination file
    fp3 = open("output.txt",'a') #output file

    #this can give me 100 samples
    temp = ((80*i)/(100))

    #reading data into a string 
    data = f1.read()

    search_text = "*temperature"
    replace_text = f".option temp={temp}\n"
    data = data.replace(search_text,replace_text)
    f1.close()

    f2.write(data)
    f2.close()

    completed_process = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if completed_process.returncode == 0:
        # Capture the standard output into a string
        output = completed_process.stdout
    else:
        output = ("Command execution failed. at temp =",temp)

    output = output.split('\n')
    output = output[-4]
    additional_text = f" for temperature = {temp}\n"
    fp3.write(output+additional_text)
    fp3.close()
    # time.sleep(0.5)
 
