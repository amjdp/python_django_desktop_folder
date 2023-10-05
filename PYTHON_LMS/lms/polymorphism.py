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
        print("price:", self.price) 
    def display(self):
        print("Total number of products: %d" %Product.count)
    def calculate_price(self):
        price = self.price + 20
        return price

class Sales(Product):
    def __init__(self, name, category, price, qty):
        Product.__init__(self, name, category, price)
        self.qty = qty
    def calculate_price(self):
        total = Product.calculate_price(self) * self.qty
        return total

sales1 = Sales('pen', 'stationery', 10, 3)
prod1 = Product('pen', 'stationery', 10)
print(sales1.calculate_price()) #This gives 90
print(prod1.calculate_price()) #This gives 30


