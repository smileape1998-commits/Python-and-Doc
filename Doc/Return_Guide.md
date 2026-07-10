# 📘 การใช้ `return` ใน Python Function

---

## ❓ ใช้ `return` เมื่อไหร่?

### ✅ ใช้ `return` — เมื่อต้องการ**นำผลลัพธ์ไปใช้ต่อ**

```python
def add(a, b):
    return a + b   # ส่งค่ากลับออกมา

result = add(3, 5)        # เก็บผลไว้ในตัวแปรได้
print(result * 10)        # 80  ← นำไปคำนวณต่อได้
print(add(10, 20) + 5)   # 35  ← ใช้ในนิพจน์ได้เลย
```

```python
def is_even(n):
    return n % 2 == 0   # return True หรือ False

if is_even(4):           # เอาไปใส่ใน if ได้เลย
    print("เลขคู่")
```

---

### ❌ ไม่ใช้ `return` — เมื่อฟังก์ชันแค่**ทำงานแล้วจบ** (side effect)

```python
def greet(name):
    print(f"สวัสดีคุณ {name}!")  # แค่พิมพ์ ไม่ต้องส่งอะไรกลับ

greet("สมชาย")   # ✅ ใช้งานได้
x = greet("Bob") # x จะเป็น None! (ไม่มีค่าส่งกลับ)
```

```python
def save_to_file(data, filename):
    with open(filename, "w") as f:
        f.write(data)
    # ไม่ return อะไร — งานคือ "บันทึกไฟล์" ก็พอ
```

---

## 🧠 สรุปกฎง่ายๆ

| ถ้าอยากทำแบบนี้                        | ใช้ `return`? |
| -------------------------------------- | ------------- |
| เก็บผลลัพธ์ไว้ในตัวแปร `x = func()`    | ✅ ต้องใช้    |
| นำผลลัพธ์ไปคำนวณต่อ                    | ✅ ต้องใช้    |
| ใช้ใน `if`, `while`, `print()`         | ✅ ต้องใช้    |
| แค่ print ออกหน้าจอ                    | ❌ ไม่จำเป็น  |
| แค่บันทึกไฟล์ / แก้ไข list / ส่ง email | ❌ ไม่จำเป็น  |

---

## ⚠️ Pitfall ที่คนเขียนใหม่มักพลาด

```python
# ❌ ผิด: ใช้ print แทน return แล้วเอาไปใช้ต่อ
def tax(price):
    print(price * 0.07)   # แค่พิมพ์!

total = 1000 + tax(1000)  # 💥 Error! tax() คืนค่า None
```

```python
# ✅ ถูก: ใช้ return
def tax(price):
    return price * 0.07

total = 1000 + tax(1000)  # ✅ = 1070.0
print(total)
```

> **กฎจำง่าย**: ถ้าอยากเอาผลลัพธ์ **"ออกมาใช้ข้างนอก"** → ต้อง `return` ครับ 🎯
