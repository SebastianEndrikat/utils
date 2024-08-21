# https://thepythoncode.com/article/generate-read-qr-code-python
import qrcode
import sys

if len(sys.argv) < 3:
    print('ERROR: Pass text and image file path.')
    sys.exit()

text = sys.argv[1]
image_file = sys.argv[2]

img = qrcode.make(text)
img.save(image_file)
