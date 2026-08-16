# 📘 คู่มือเฉลยแบบฝึกหัดและสคริปต์การสอน: Module 09 - Nested Structure

คู่มือนี้เน้นการอธิบายโครงสร้างที่ซับซ้อนและมีการซ้อนกัน (**Nested Structures**): ทั้ง Nested Loops (`while` และ `for`), ตะแกรงร่อนจำนวนเฉพาะ Sieve of Eratosthenes, การจับคู่แบบพบกันหมด (Round-Robin), การแยกตรรกะออกเป็น Helper Functions, เมทริกซ์ 2 มิติ (2D Matrix Operations), และ One-Liner List Comprehension

---

## 📑 สารบัญแบบฝึกหัดใน Module 09

### [หมวดที่ 1: Nested While Loop](#หมวดที่-1-nested-while-loop)
- [9-1 ข้อ 1: ตารางสูตรคูณแม่ 2 ถึง N ชิดขวาความกว้าง 4 ช่อง (while)](#9-1-ข้อ-1-ตารางสูตรคูณแม่-2-ถึง-n)
- [9-1 ข้อ 2: ตะแกรงร่อนจำนวนเฉพาะ Sieve of Eratosthenes (while)](#9-1-ข้อ-2-ตะแกรงร่อนจำนวนเฉพาะ)

### [หมวดที่ 2: Nested For Loop](#หมวดที่-2-nested-for-loop)
- [9-2 ข้อ 1: รายการแข่งขันฟุตบอลแบบพบกันหมด (Round-Robin)](#9-2-ข้อ-1-รายการแข่งขันฟุตบอลแบบพบกันหมด)
- [9-2 ข้อ 2: ตารางสูตรคูณแม่ 2 ถึง N ชิดขวาความกว้าง 4 ช่อง (for)](#9-2-ข้อ-2-ตารางสูตรคูณแม่-2-ถึง-n-for)

### [หมวดที่ 3: Refactoring Functions & Loop Control](#หมวดที่-3-refactoring-functions--loop-control)
- [9-3 ข้อ 1: การนับตัวเลขโดดโดยแยกลูปออกเป็นฟังก์ชันย่อย](#9-3-ข้อ-1-การนับตัวเลขโดดโดยแยกลูป)
- [9-3 ข้อ 2: ฟังก์ชันหาคำลงท้ายยาวสุด (longest_suffix)](#9-3-ข้อ-2-ฟังก์ชันหาคำลงท้ายยาวสุด)
- [9-3 ข้อ 3: Lychrel Number ที่น้อยที่สุดที่มากกว่า N](#9-3-ข้อ-3-lychrel-number)

### [หมวดที่ 4: Nested Lists & 2D Coordinates](#หมวดที่-4-nested-lists--2d-coordinates)
- [9-4 ข้อ 1: แยกตัวเลขลงถังตามหลักหน่วย (to_buckets)](#9-4-ข้อ-1-แยกตัวเลขลงถังตามหลักหน่วย)
- [9-4 ข้อ 2: อ่านพิกัดจุดจากอินพุต (read_points)](#9-4-ข้อ-2-อ่านพิกัดจุดจากอินพุต)
- [9-4 ข้อ 3: หาคู่จุดที่อยู่ใกล้กันที่สุดทั้งหมด (all_closest_pairs)](#9-4-ข้อ-3-หาคู่จุดที่อยู่ใกล้กันที่สุดทั้งหมด)
- [9-4 ข้อ 4: แปลงลิสต์คู่การชื่นชอบเป็น Dictionary (to_dict)](#9-4-ข้อ-4-แปลงลิสต์คู่การชื่นชอบเป็น-dictionary)

### [หมวดที่ 5: 2D Matrix Operations](#หมวดที่-5-2d-matrix-operations)
- [9-5 ข้อ 1: ผลรวมของทุกจำนวนในเมทริกซ์ (sum_all)](#9-5-ข้อ-1-ผลรวมของทุกจำนวนในเมทริกซ์)
- [9-5 ข้อ 2: ผลรวมในแต่ละแถวแนวนอน (sum_row)](#9-5-ข้อ-2-ผลรวมในแต่ละแถวแนวนอน)
- [9-5 ข้อ 3: ผลรวมในแต่ละหลักแนวตั้ง (sum_col)](#9-5-ข้อ-3-ผลรวมในแต่ละหลักแนวตั้ง)
- [9-5 ข้อ 4: สร้างเมทริกซ์เอกลักษณ์ (identity)](#9-5-ข้อ-4-สร้างเมทริกซ์เอกลักษณ์)

### [หมวดที่ 6: List Comprehensions](#หมวดที่-6-list-comprehensions)
- [9-6 ข้อ 1: การบวกเวกเตอร์ด้วย List Comprehension (add)](#9-6-ข้อ-1-การบวกเวกเตอร์)
- [9-6 ข้อ 2: คำนวณ Dot Product ด้วย List Comprehension (dot)](#9-6-ข้อ-2-คำนวณ-dot-product)
- [9-6 ข้อ 3: แปลงสมาชิกในลิสต์เป็นสตริง (to_list_of_strings)](#9-6-ข้อ-3-แปลงสมาชิกในลิสต์เป็นสตริง)
- [9-6 ข้อ 4: คัดเลือกเฉพาะจำนวนบวก (get_positive)](#9-6-ข้อ-4-คัดเลือกเฉพาะจำนวนบวก)

---

## หมวดที่ 1: Nested While Loop

### 9-1 ข้อ 1: ตารางสูตรคูณแม่ 2 ถึง N

#### 🎯 วิเคราะห์โจทย์
พิมพ์ตารางสูตรคูณแม่ 2 จนถึงแม่ $N$ (คูณ 1 ถึง 5) จัดชิดขวาในช่องกว้าง 4 ตัวอักษร โดยใช้เฉพาะคำสั่ง `while` (ห้ามใช้ `for`)

#### 💻 โค้ดเฉลย
```python
def left_pad(n, k):
    return (" " * k + str(n))[-k:]

N = int(input())
k = 2
while k <= N:
    m = 1
    line = ""
    while m <= 5:
        line += left_pad(k * m, 4)
        m += 1
    print(line)
    k += 1
```

---

### 9-1 ข้อ 2: ตะแกรงร่อนจำนวนเฉพาะ

#### 🎯 วิเคราะห์โจทย์
สร้างตะแกรงหาจำนวนเฉพาะ Sieve of Eratosthenes ตั้งแต่ $0$ ถึง $N$ โดยใช้ `while` loop

#### 💻 โค้ดเฉลย
```python
N = int(input())
prime = [True] * (N + 1)
prime[0] = prime[1] = False
p = 2
while p * p <= N:
    if prime[p]:
        i = 2 * p
        while i <= N:
            prime[i] = False
            i += p
    p += 1
print(prime)
```

---

## หมวดที่ 2: Nested For Loop

### 9-2 ข้อ 1: รายการแข่งขันฟุตบอลแบบพบกันหมด

#### 🎯 วิเคราะห์โจทย์
อ่านรายชื่อโรงเรียน แล้วสร้างตารางจับคู่แข่งขันแบบพบกันหมด (Round-Robin) โดยไม่ซ้ำคู่ และเรียงตามลำดับพจนานุกรม

#### 💻 โค้ดเฉลย
```python
schools = input().split()
schools.sort()
for i in range(len(schools)):
    for j in range(i + 1, len(schools)):
        print(schools[i], 'vs', schools[j])
```
*จุดสำคัญ:* ลูปในเริ่มจาก `j = i + 1` เพื่อป้องกันการจับคู่กับตัวเอง และป้องกันการเกิดคู่ซ้ำ (เช่น A vs B แล้วมี B vs A ซ้ำ)

---

### 9-2 ข้อ 2: ตารางสูตรคูณแม่ 2 ถึง N (for)

#### 💻 โค้ดเฉลย
```python
def left_pad(n, k):
    return (" " * k + str(n))[-k:]

N = int(input())
for k in range(2, N + 1):
    line = ""
    for m in range(1, 6):
        line += left_pad(k * m, 4)
    print(line)
```

---

## หมวดที่ 3: Refactoring Functions & Loop Control

### 9-3 ข้อ 1: การนับตัวเลขโดดโดยแยกลูป

#### 🎯 วิเคราะห์โจทย์
นับจำนวนเลขโดด $d$ ใน List ของจำนวนเต็ม $x$ โดยแยกตรรกะการนับทีละจำนวนออกเป็นฟังก์ชันย่อย `count(n, d)` เพื่อไม่ให้มีลูปซ้อนกันในฟังก์ชันหลัก

#### 💻 โค้ดเฉลย
```python
def count(n, d):
    """นับเลขโดด d ในจำนวนเต็ม n ทีละหลัก"""
    c = 0
    while n > 0:
        if n % 10 == d:
            c += 1
        n //= 10
    return c

def count_digit(x, d):
    """นับเลขโดด d ในทุกลำดับของลิสต์ x"""
    c = 0
    for n in x:
        c += count(n, d)
    return c
```

---

### 9-3 ข้อ 2: ฟังก์ชันหาคำลงท้ายยาวสุด

#### 🎯 วิเคราะห์โจทย์
เขียนฟังก์ชัน `longest_suffix(words)` คืนสตริงที่ยาวที่สุดที่เป็นคำลงท้ายร่วมกันของทุกสตริงใน `words`

#### 💻 โค้ดเฉลย
```python
def longest_suffix(words):
    for i in range(-1, -(len(words[0]) + 1), -1):
        c = words[0][i]
        for j in range(1, len(words)):
            if i < -len(words[j]) or c != words[j][i]:
                if i == -1:
                    return ""
                return words[j][i + 1:]
    return words[0]
```

---

### 9-3 ข้อ 3: Lychrel Number

#### 🎯 วิเคราะห์โจทย์
รับ $N$ หา Lychrel Number ที่น้อยที่สุดที่มากกว่า $N$ (จำนวนที่กลับหลักแล้วบวกซ้ำๆ ถึง 30 รอบแล้วยังไม่เป็นพาลินโดรม)

#### 💻 โค้ดเฉลย
```python
def reverse_and_add(n):
    return n + int(str(n)[::-1])

def is_palindrome(n):
    m = str(n)
    return m == m[::-1]

N = int(input())
while True:
    N = N + 1
    n = N
    is_lychrel = True
    for k in range(30):
        n = reverse_and_add(n)
        if is_palindrome(n):
            is_lychrel = False
            break
    if is_lychrel:
        print(N)
        break
```

---

## หมวดที่ 4: Nested Lists & 2D Coordinates

### 9-4 ข้อ 1: แยกตัวเลขลงถังตามหลักหน่วย (to_buckets)

#### 💻 โค้ดเฉลย
```python
def to_buckets(d):
    b = []
    for i in range(10):
        b.append([])
    for e in d:
        b[e % 10].append(e)
    return b
```

---

### 9-4 ข้อ 2: อ่านพิกัดจุดจากอินพุต (read_points)

#### 💻 โค้ดเฉลย
```python
def read_points():
    points = []
    x = input().split(", ")
    for s in x:
        x_val, y_val = s.split(":")
        p = [float(x_val), float(y_val)]
        points.append(p)
    return points
```

---

### 9-4 ข้อ 3: หาคู่จุดที่อยู่ใกล้กันที่สุดทั้งหมด (all_closest_pairs)

#### 💻 โค้ดเฉลย
```python
def distance(p1, p2):
    dx = p1[0] - p2[0]
    dy = p1[1] - p2[1]
    return (dx**2 + dy**2)**0.5

def all_closest_pairs(points):
    min_distance = distance(points[0], points[1])
    for i in range(len(points)):
        for j in range(i + 1, len(points)):
            d = distance(points[i], points[j])
            if d < min_distance:
                min_distance = d

    closest_pairs = []
    for i in range(len(points)):
        for j in range(i + 1, len(points)):
            d = distance(points[i], points[j])
            if d == min_distance:
                closest_pairs.append([i, j])
    return closest_pairs
```

---

### 9-4 ข้อ 4: แปลงลิสต์คู่การชื่นชอบเป็น Dictionary (to_dict)

#### 💻 โค้ดเฉลย
```python
def to_dict(like_list):
    like_dict = {}
    for u1, u2 in like_list:
        if u1 not in like_dict:
            like_dict[u1] = [u2]
        else:
            like_dict[u1].append(u2)
    return like_dict
```

---

## หมวดที่ 5: 2D Matrix Operations

### 9-5 ข้อ 1: ผลรวมของทุกจำนวนในเมทริกซ์ (sum_all)
```python
def sum_all(M):
    s = 0
    for row in M:
        for e in row:
            s += e
    return s
```

---

### 9-5 ข้อ 2: ผลรวมในแต่ละแถวแนวนอน (sum_row)
```python
def sum_row(M):
    s = []
    for r in range(len(M)):
        su = 0
        for c in range(len(M[r])):
            su += M[r][c]
        s.append(su)
    return s
```

---

### 9-5 ข้อ 3: ผลรวมในแต่ละหลักแนวตั้ง (sum_col)
```python
def sum_col(M):
    s = []
    for c in range(len(M[0])):
        su = 0
        for r in range(len(M)):
            su += M[r][c]
        s.append(su)
    return s
```

---

### 9-5 ข้อ 4: สร้างเมทริกซ์เอกลักษณ์ (identity)
```python
def identity(n):
    I = []
    for r in range(n):
        I.append([0] * n)
        I[r][r] = 1
    return I
```

---

## หมวดที่ 6: List Comprehensions

### 9-6 ข้อ 1: การบวกเวกเตอร์ (add)
```python
def add(u, v):
    return [u[i] + v[i] for i in range(len(u))]
```

### 9-6 ข้อ 2: คำนวณ Dot Product (dot)
```python
def dot(u, v):
    return sum([u[i] * v[i] for i in range(len(u))])
```

### 9-6 ข้อ 3: แปลงสมาชิกในลิสต์เป็นสตริง (to_list_of_strings)
```python
def to_list_of_strings(x):
    return [str(e) for e in x]
```

### 9-6 ข้อ 4: คัดเลือกเฉพาะจำนวนบวก (get_positive)
```python
def get_positive(x):
    return [e for e in x if e > 0]
```
