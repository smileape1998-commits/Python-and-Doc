# 🐍 Python 101 Ultimate Cheatsheet
> สรุปย่อไวยากรณ์ คำสั่ง ตัวอย่างโค้ด และฟังก์ชันสำคัญสำหรับ Python Programming (ครอบคลุมเนื้อหา Module 01 - 09)

---

## 📑 สารบัญ
* [1. Data Types & Math (ชนิดข้อมูลและคณิตศาสตร์)](#1-data-types--math)
* [2. String, List & Slicing (สตริง ลิสต์ และการสไลซ์)](#2-string-list--slicing)
* [3. Selection & Conditions (เงื่อนไขและการเลือกกระทำ)](#3-selection--conditions)
* [4. Repetition & Loops (การวนลูปซ้ำ)](#4-repetition--loops)
* [5. List Processing & Methods (การจัดการลิสต์)](#5-list-processing--methods)
* [6. Functions (ฟังก์ชันและการส่งค่า)](#6-functions)
* [7. String Methods & File I/O (เมธอดสตริงและการอ่านเขียนไฟล์)](#7-string-methods--file-io)
* [8. Dictionary (โครงสร้างดิกชันนารี)](#8-dictionary)
* [9. Nested Structures & List Comprehension (โครงสร้างซ้อนในและ List Comprehension)](#9-nested-structures--list-comprehension)

---

## 1. Data Types & Math

### Primitive Types (ชนิดข้อมูลพื้นฐาน)
| Type | Description | ตัวอย่าง |
|:---|:---|:---|
| `int` | จำนวนเต็ม | `10`, `-5`, `0`, `1_000_000` |
| `float` | จำนวนจริงทศนิยม | `3.14159`, `-0.001`, `2.5e3` |
| `str` | ข้อความ (String) | `"Hello"`, `'Python'` |
| `bool` | ค่าความจริง | `True`, `False` |

### Arithmetic Operators (ตัวดำเนินการคำนวณ)
| Operator | ความหมาย | ตัวอย่าง | ผลลัพธ์ |
|:---:|:---|:---|:---|
| `+` | บวก | `5 + 3` | `8` |
| `-` | ลบ | `5 - 3` | `2` |
| `*` | คูณ | `5 * 3` | `15` |
| `/` | หาร (ได้ `float` เสมอ) | `5 / 2` | `2.5` |
| `//` | หารปัดเศษลง (Floor Division) | `5 // 2` | `2` |
| `%` | มอดุโล (หารเอาเศษ) | `5 % 2` | `1` |
| `**` | ยกกำลัง | `2 ** 3` | `8` |

### Math Module (`import math`)
* `math.sqrt(x)`: ถอดรากที่สอง $\sqrt{x}$
* `math.ceil(x)` / `math.floor(x)`: ปัดเศษขึ้น / ปัดเศษลง
* `math.sin(r)` / `math.cos(r)` / `math.radians(deg)`: ฟังก์ชันตรีโกณมิติ
* `math.log(x, base)` / `math.log10(x)`: ลอการิทึม
* `math.factorial(n)`: คำนวณ $n!$
* ค่าคงที่: `math.pi` ($\pi$), `math.e` ($e$)

### Formatting (f-string)
```python
name = "Somchai"
price = 1250.758
print(f"ลูกค้า: {name}, ยอดชำระ: {price:,.2f} บาท")  # ลูกค้า: Somchai, ยอดชำระ: 1,250.76 บาท
print(f"รหัส: {42:05d}")                            # รหัส: 00042
```

---

## 2. String, List & Slicing

### Indexing & Slicing (`sequence[start : stop : step]`)
```
ดัชนีบวก (จากซ้าย):    0   1   2   3   4   5
สตริงตัวอย่าง:        P   Y   T   H   O   N
ดัชนีลบ (จากขวา):    -6  -5  -4  -3  -2  -1
```
* `s[0]`: ตัวแรก (`'P'`)
* `s[-1]`: ตัวท้าย (`'N'`)
* `s[1:4]`: สมาชิก index 1 ถึง 3 (`'YTH'`)
* `s[:3]`: 3 ตัวแรก (`'PYT'`)
* `s[3:]`: ตั้งแต่ index 3 จนจบ (`'HON'`)
* `s[::-1]`: **กลับทิศทาง (Reverse)** (`'NOHTYP'`)
* `s[::2]`: ก้าวทีละ 2 (`'PTO'`)

### Sequence Operations
* `len(s)`: หาจำนวนสมาชิก
* `s1 + s2`: นำมาเชื่อมต่อกัน
* `s * n`: ทำซ้ำ $n$ ครั้ง
* `", ".join(["A", "B", "C"])` $\to$ `"A, B, C"`
* `"A, B, C".split(", ")` $\to$ `["A", "B", "C"]`

---

## 3. Selection & Conditions

### Logical & Membership Operators
* เปรียบเทียบ: `==`, `!=`, `<`, `<=`, `>`, `>=`
* ตรรกะ: `and` (และ), `or` (หรือ), `not` (นิเสธ)
* สมาชิก: `in`, `not in`

### โครงสร้าง `if - elif - else`
```python
if score >= 80:
    grade = "A"
elif score >= 70:
    grade = "B"
elif score >= 60:
    grade = "C"
elif score >= 50:
    grade = "D"
else:
    grade = "F"

# Ternary Operator (if บรรทัดเดียว)
result = "Pass" if score >= 50 else "Fail"
```

---

## 4. Repetition & Loops

### `while` Loop
```python
# วนลูปจนกว่าค่าจะถึงเงื่อนไขหยุด
n = 16
count = 0
while n > 1:
    n //= 2
    count += 1
```

### `for` Loop กับ `range()`
* `range(5)` $\to$ `0, 1, 2, 3, 4`
* `range(2, 6)` $\to$ `2, 3, 4, 5`
* `range(10, 0, -2)` $\to$ `10, 8, 6, 4, 2`

### Loop Control
* `break`: **ออกจากลูปทันที**
* `continue`: **ข้ามรอบปัจจุบัน** ไปทำรอบถัดไปทันที

---

## 5. List Processing & Methods

### เมธอดของ List
| เมธอด | ผลการทำงาน |
|:---|:---|
| `lst.append(x)` | เพิ่ม `x` ต่อท้ายลิสต์ |
| `lst.extend(iterable)` | รวมสมาชิกจากลิสต์อื่นเข้าต่อท้าย |
| `lst.insert(i, x)` | แทรก `x` ที่ index `i` |
| `lst.pop(i)` | ลบและส่งคืนสมาชิกตัวที่ `i` (ค่าปริยายคือตัวท้ายสุด) |
| `lst.remove(x)` | ลบค่า `x` ตัวแรกที่พบ |
| `lst.sort()` | เรียงลำดับในลิสต์เดิม (In-place) |
| `lst.reverse()` | กลับด้านสมาชิกในลิสต์เดิม |
| `sorted(lst)` | คืนลิสต์ใหม่ที่เรียงลำดับแล้ว (ลิสต์เดิมไม่เปลี่ยน) |

### การรับ Input หลายบรรทัดเข้า List
```python
# 1. รับจำนวนตัวเลข n บรรทัด
n = int(input())
data = [int(input()) for _ in range(n)]

# 2. รับตัวเลขหลายจำนวนในบรรทัดเดียว คั่นด้วยช่องว่าง
numbers = list(map(int, input().split()))
```

---

## 6. Functions

### การนิยามและส่งค่ากลับ
```python
def get_stats(numbers):
    """คืนค่า min, max, average พร้อมกัน"""
    if not numbers:
        return None, None, None
    return min(numbers), max(numbers), sum(numbers) / len(numbers)

# การเรียกใช้งานพร้อม Unpacking
mn, mx, avg = get_stats([10, 20, 30, 40])
```

> **ข้อควรระวัง (Mutability):**  
> ชนิดข้อมูลแบบ `list` หรือ `dict` หากส่งเข้าฟังก์ชันแล้วมีการสั่ง `.append()` หรือเปลี่ยนค่าสมาชิก สมาชิกในตัวแปรภายนอกจะเปลี่ยนตามด้วย!

---

## 7. String Methods & File I/O

### Common String Methods
```python
s = "  Python Programming  "
s.strip()            # "Python Programming" (ตัดช่องว่างหัวท้าย)
s.lower()            # "  python programming  "
s.upper()            # "  PYTHON PROGRAMMING  "
s.replace("P", "J")  # "  Jython Jrogramming  "
s.find("Prog")       # 9 (ตำแหน่งที่พบ หากไม่พบจะได้ -1)
s.count("m")         # 2 (นับจำนวนตัวอักษร)
s.isdigit()          # False (เช็คว่าตัวเลขล้วนหรือไม่)
```

### File I/O (`with open(...)`)
```python
# การเขียนไฟล์
with open("output.txt", "w", encoding="utf-8") as f:
    f.write("Hello World\n")
    f.write("Python 101\n")

# การอ่านไฟล์ทีละบรรทัด
with open("output.txt", "r", encoding="utf-8") as f:
    for line in f:
        print(line.strip())
```

---

## 8. Dictionary

### โครงสร้างและการใช้งาน
```python
# สร้าง Dictionary
student_scores = {"Somchai": 85, "Somsak": 92, "Somying": 78}

# เข้าถึงข้อมูลอย่างปลอดภัย (Safe Access)
score = student_scores.get("Somchai", 0)   # ได้ 85
score_none = student_scores.get("David", 0) # ได้ 0 (ไม่ Error)

# เพิ่มหรือแก้ไขค่า
student_scores["David"] = 90

# การวนลูป Dictionary
for name, score in student_scores.items():
    print(f"{name} -> {score}")

# เทคนิค Frequency Counter (นับความถี่)
words = ["apple", "banana", "apple", "cherry", "banana", "apple"]
counts = {}
for w in words:
    counts[w] = counts.get(w, 0) + 1
# counts: {'apple': 3, 'banana': 2, 'cherry': 1}
```

---

## 9. Nested Structures & List Comprehension

### List Comprehension
```python
# ไวยากรณ์: [expression for item in iterable if condition]

# ยกกำลังสองเฉพาะเลขคู่
evens_sq = [x**2 for x in range(1, 11) if x % 2 == 0]
# ผลลัพธ์: [4, 16, 36, 64, 100]

# แปลง String input เป็น List ของ Float
floats = [float(x) for x in "1.2 3.4 5.6".split()]
```

### 2D List (Matrix)
```python
# สร้าง Matrix ขนาด 3x4 ค่าเริ่มต้น 0
matrix = [[0 for col in range(4)] for row in range(3)]

# Matrix Transpose (สลับแถวเป็นหลัก)
A = [[1, 2, 3], [4, 5, 6]]
A_transpose = [[A[r][c] for r in range(len(A))] for c in range(len(A[0]))]
# A_transpose: [[1, 4], [2, 5], [3, 6]]
```

---
💡 *จัดทำเพื่อการทบทวนและการเรียนการสอนวิชา Computer Programming (Python 101)*
