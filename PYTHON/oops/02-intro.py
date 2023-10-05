class AcerNitro5:
    keyboard = 'qwert'
    ram = '16GB'
    display = 'Full HD+'
    processor = 'intel core i7'
    manufacture = 'Acer'
    price = 90000
    color = 'black'

    def power_on(self):
        print('power on')

    def power_off(self):
        print('power off')


lap1 = AcerNitro5()
lap2 = AcerNitro5()
lap1.power_on()
lap1.color = 'green'