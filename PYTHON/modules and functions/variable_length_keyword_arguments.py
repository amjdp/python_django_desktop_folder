def printDetails( item, **kwargs):
    'Function to print details'
    print('Item name is %s'%(item))
    for key,value in kwargs.items():
        print("- %s is %s" %(key,value))
    return

printDetails('Monitor', Price = 70, Quantity = 85)


# Output:
# Item name is Monitor
# - Price is 70
# - Quantity is 85