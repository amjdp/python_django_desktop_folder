x = 10
y=10
def fn_scope():
    y=20
    y+=10
    x=30
    print(x,y)

fn_scope()
print(x,y)

print(__name__)