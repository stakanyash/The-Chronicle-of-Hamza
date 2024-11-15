import struct
from PIL import Image

# Чтение данных из файла displace.bin
with open('displace.bin', 'rb') as stream:
    raw = struct.unpack(f'{512 ** 2}f', stream.read())

_min = min(raw)
_max = max(raw)
_del = _max - _min

# Функция для нормализации значений высот
def mut(v):
    rel = v
    rel -= _min
    rel /= _del
    rel *= 0xFFFF
    rel = int(rel)
    return rel

# Преобразование данных в формат, подходящий для PNG
normalized_data = list(map(mut, raw))

# Создание изображения
image = Image.new('I', (512, 512))
image.putdata(normalized_data)

# Сохранение изображения в формате PNG
image.save('displace.png')

print(f"Height min:   {_min:.1f}")
print(f"Height max:   {_max:.1f}")
print(f"Height delta: {_del:.1f}")
