try:
   fh = open("ttfile.txt", "r")
   fh.read()
#    fh.write("This is my test file for exception handling!!")
except IOError:
   print ("Error: can\'t find file or read data")
else:
   print ("Written content in the file successfully")
   fh.close()