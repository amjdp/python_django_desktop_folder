a=int(input('enter number'))
b=int(input('enter number'))
result=0
try:
    result=a/b
except ZeroDivisionError: 
    print('division by zero')
print(result)
