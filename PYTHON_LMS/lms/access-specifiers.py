# class Product:
#     count = 0
#     def __init__(self, name, category, price):
#         self.name = name
#         self.category = category
#         self.__price = price
#         Product.count = Product.count + 1
#     def display_product(self):
#         print("name:", self.name)
#         print("category:", self.category)
#         print("name:", self.name)
#     def product_count(self):
#         print("Total number of products: %d" %Product.count)

# prod1 = Product('pen', 'stationary', 20)
# print(prod1.__price)

class Product:
    count = 0

    def __init__(self, name, category, price):
        self.name = name
        self.category = category
        self.__price = price
        Product.count = Product.count + 1

    def display_product(self):
        print("name:", self.name)
        print("category:", self.category)
        print("name:", self.name)

    def product_count(self):
        print("Total number of products: %d" % Product.count)

    def calculate_price(self):
        price = self.__price * (100/50)
        return price

    def set_price(self, price):
        self.__price = price

    def get_price(self):
        return self.__price


prod1 = Product('pen', 'stationary', 20)
# print(prod1.__price)
print(prod1.get_price())
print(prod1.set_price(50))
print(prod1.get_price())
