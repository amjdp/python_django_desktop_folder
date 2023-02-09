# def add(*args):
#     # sum=a*b
    
#     sum=0
#     for i in args:
#         sum=sum+i
#     print(sum)

# add(10,10)  # DEFAULT ARGS
# add(1,2,3,4)

def details(**kwargs):
     
     print(kwargs)
     for i in kwargs:
        print(i,'is',kwargs[i])
    
    
details(name='abhinav',age=22,gender='male',place='kannur')