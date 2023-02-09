# a = 10
# b = 0
# result = 0
# try:
#     result = a / b
# except:
#     print('result')
# print(result)


file = " "
try:
    file = open('text.txt','r')   
    print(file.read())
except FileNotFoundError as e:
    print(e)
else:
    print('hello')
finally:
    file.close()


# try:
#     f = open("demofe.txt",'r')
#     # print(f.readlines())
#     print(f.read())
#     # a = f.read()
#     # print(a)
# except FileNotFoundError as x:
#     print('file doest not exist ', x)