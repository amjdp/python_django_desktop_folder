class Mobile:
    
    def __init__(self,model,processor,display,camera,colour):
        self.model=model
        self.processor=processor
        self.display=display
        self.camera=camera
        self.colour=colour
    def power_on(self):        
        print("switch on")
        print(self.camera)
    def power_off(self):
        print('switch off')
    def camera_on(self):
        print('switch on camera')    
mobile1=Mobile('s22','qualcon','7 inch',"13 mp",'white')
print(mobile1.model)
mobile2=Mobile('s23','qualcon22','8 inch',"16 mp",'black')
print(mobile2.model)
# mobile2=Mobile()
# mobile1.power_on()
# mobile2.power_on()
# print(mobile1.model)