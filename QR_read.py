# https://thepythoncode.com/article/generate-read-qr-code-python
import cv2
import sys

if len(sys.argv) < 2:
    print('ERROR: Pass image file path.')
    sys.exit()

image_file = sys.argv[1]

img = cv2.imread(image_file)
detector = cv2.QRCodeDetector()
data, bbox, straight_qrcode = detector.detectAndDecode(img)

print(f'Data in the QR code:\n{data}')
