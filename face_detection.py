import cv2
import os

# Загружаем предобученную модель для распознавания лиц
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

# Путь к изображению в репозитории
image_path = os.path.join(os.path.dirname(__file__), 'images', 'policeman_photo.jpg')

# Читаем изображение
img = cv2.imread(image_path)

if img is None:
    print(f"Не удалось загрузить изображение по пути: {image_path}")
    exit(1)

# Преобразуем изображение в оттенки серого
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Находим лица на изображении
faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

# Рисуем прямоугольники вокруг найденных лиц
for (x, y, w, h) in faces:
    cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)

# Сохраняем результат
output_path = os.path.join(os.path.dirname(__file__), 'output.jpg')
cv2.imwrite(output_path, img)

print("Лица успешно найдены и сохранены в output.jpg")