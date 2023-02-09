
# file = open('text.txt', 'r')
# file.write("This is my test file for exception handling !! ")
# file.close()

file = ""
try:
    fh = open('./demofile.txt','r')
    print(fh.read())
    # fh.write(" \n This is my test file for exception handling !! ")    
    # fh.close()
except FileNotFoundError:
    print('Error : can\'t find file or read data')
else:
    print('Written content in the file successfully')
finally:
    print('Program execution finished')
