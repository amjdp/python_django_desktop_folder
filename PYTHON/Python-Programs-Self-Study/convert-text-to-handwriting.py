# import pywhatkit as pwt

# pwt.text_to_handwriting("Welcome to PYWHATKIT","C:\\Users\\ATHIRA M J\\PC\\output.png")

from PIL import Image, ImageDraw, ImageFont

# Create a blank image
image = Image.new('RGB', (400, 200), 'white')

# Load a font for handwriting-style text (you'll need to specify the path to a suitable font file)
font = ImageFont.truetype('/converted-text/QaskinWhitePersonalUse-67XD.ttf', 20)

# Create a drawing context
draw = ImageDraw.Draw(image)

# Define the text and position
text = "Your handwritten text here"
position = (20, 80)

# Draw the text on the image
draw.text(position, text, fill='black', font=font)

# Save the image
image.save('handwritten.png')

# Display the image
image.show()
