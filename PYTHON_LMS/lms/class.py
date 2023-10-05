class Product:
    count = 0

    def __init__(self, name, category, price):
        self.name = name
        self.category = category
        self.price = price
        Product.count = Product.count + 1
      
    def display_product(self):
        print("name:", self.name) 
        print("category:", self.category) 
        print("name:", self.name) 

    def product_count(self):
        print("Total number of products: %d" %Product.count)

prod1 = Product('pen', 'stationary', 20)
prod2 = Product('Orange', 'food', 45)

prod1.display_product()
prod1.product_count()

