def printDetails( item, *components):
    'Function to print details'
    print('Components of %s are'%(item))
    for component in components:
        print("-",component)
    return

printDetails('Computer','CPU', 'Monitor', 'Motherboard', 'Mouse')


# Output:
# Components of Computer are
# - CPU
# - Monitor
# - Motherboard
# - Mouse