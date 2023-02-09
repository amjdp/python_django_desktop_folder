def printDetails( item, price = 100):
    'Function to print name and price of item'
    print('%s costs %d'%(item,price))
    return

printDetails(item = 'Keyboard')
printDetails('Mouse')
printDetails( price = 50, item = 'Keyboard')

# Output:
# Keyboard costs 100
# Mouse costs 100
# Keyboard costs 50