# a = 10
# b = 0
# result = 0
# try:
#     result = a / b
# except:
#     print('result')
# print(result)
# file.writelines("insertion" '\n')
file = " "
try:
    file = open('text.txt','r')
    print(file.read())
except FileNotFoundError as a:
    print(a)
else:
    print('hello')
finally:
    file.close()