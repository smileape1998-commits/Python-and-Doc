# 📘 คู่มือเฉลยแบบฝึกหัดและสคริปต์การสอน: Module 05 - List Processing

คู่มือนี้เน้นการประมวลผลข้อมูลใน **List (รายการ)** ขั้นสูง เช่น การคำนวณพีชคณิตเชิงเส้น (Dot Product), การเรียงลำดับ (Sorting), การหาฐานนิยม (Mode) จากไฟล์ข้อมูล, การค้นหาข้อมูลสองทิศทางด้วย Parallel Lists, และการตรวจสอบจุดยอด (Peak Detection)

---

## 📑 สารบัญแบบฝึกหัดใน Module 05
1. [Exercise 1: Dot Product ของเวกเตอร์](#exercise-1-dot-product-ของเวกเตอร์)
2. [Exercise 2: การเรียงลำดับจำนวนเต็ม (List Sorting & Join)](#exercise-2-การเรียงลำดับจำนวนเต็ม)
3. [Exercise 3: ฐานนิยมในแฟ้มข้อมูล (Mode in File)](#exercise-3-ฐานนิยมในแฟ้มข้อมูล)
4. [05-01: เลขไหนหายไป (Missing Digits Finder)](#05-01-เลขไหนหายไป)
5. [05-02: ชื่อจริง - ชื่อเล่น (Parallel Lists Bidirectional Search)](#05-02-ชื่อจริง---ชื่อเล่น)
6. [05-04: การนับจำนวนยอด (Local Peak Detection)](#05-04-การนับจำนวนยอด)

---

## Exercise 1: Dot Product ของเวกเตอร์

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับเวกเตอร์ 2 ชุด (คั่นด้วยช่องว่าง) ตรวจสอบว่าความยาวของทั้งสองเวกเตอร์เท่ากันหรือไม่
- ถ้าความยาวไม่เท่ากัน: แสดงข้อความ `"Error"`
- ถ้าความยาวเท่ากัน: คำนวณ Dot Product: $\vec{u} \cdot \vec{v} = \sum_{i=0}^{n-1} u_i \times v_i$

---

### 💻 2. โค้ดเฉลยฉบับสมบูรณ์
```python
v1 = [float(x) for x in input().split()]
v2 = [float(x) for x in input().split()]

if len(v1) != len(v2):
    print("Error")
else:
    dot_product = sum(v1[i] * v2[i] for i in range(len(v1)))
    print(dot_product)
```

---

### 🔍 3. อธิบายการทำงาน
- `[float(x) for x in input().split()]`: List Comprehension แปลงสตริงทุกตัวเป็นจำนวนจริง `float`
- `if len(v1) != len(v2)`: ตรวจสอบมิติของเวกเตอร์ก่อนคำนวณ เพื่อป้องกัน IndexError
- `sum(v1[i] * v2[i] for i in range(len(v1)))`: ใช้ Generator Expression คูณสมาชิกคู่ลำดับเดียวกันแล้วหาผลรวมทั้งหมดด้วย `sum()`

---

## Exercise 2: การเรียงลำดับจำนวนเต็ม

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับจำนวนเต็ม $N$ ตามด้วยตัวเลข $N$ บรรทัด แล้วแสดงผลตัวเลขทั้งหมดเรียงจากน้อยไปมาก คั่นด้วยเครื่องหมายจุลภาค `,`

---

### 💻 2. โค้ดเฉลยฉบับสมบูรณ์
```python
n = int(input())
data = []
for _ in range(n):
    data.append(int(input()))

data.sort()
print(",".join(str(x) for x in data))
```

---

### 🔍 3. อธิบายการทำงาน
- `data.sort()`: จัดเรียงข้อมูลใน List เดิมจากน้อยไปมาก (In-place Sorting)
- `",".join(str(x) for x in data)`: เมธอด `.join()` ต้องรับสตริงเท่านั้น จึงแปลงตัวเลข $x$ ทุกตัวเป็น `str(x)` ก่อนนำมาเชื่อมด้วย `,`

---

## Exercise 3: ฐานนิยมในแฟ้มข้อมูล

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับชื่อไฟล์ข้อความที่มีตัวเลขบรรทัดละ 1 ตัว หาค่า **ฐานนิยม (Mode)** ซึ่งก็คือตัวเลขที่ปรากฏบ่อยที่สุด (ถ้ามีความถี่สูงสุดเท่ากันหลายตัว ให้แสดงเรียงตามลำดับที่พบก่อนในไฟล์)

---

### 💡 2. ทำไมถึงเขียนแบบนี้?
- ใช้ Dictionary `counts` เพื่อนับความถี่ของตัวเลข
- ใช้ List `order` เก็บตัวเลขตามลำดับที่เจอครั้งแรก (Insertion Order)
- หาความถี่สูงสุดด้วย `max(counts.values())` แล้ววนลูปตาม `order` เพื่อพิมพ์ตัวเลขที่ตรงกับความถี่สูงสุด

---

### 💻 3. โค้ดเฉลยฉบับสมบูรณ์
```python
filename = input().strip()

counts = {}
order = []

with open(filename, "r") as f:
    for line in f:
        line = line.strip()
        if line:
            num = int(line)
            if num not in counts:
                counts[num] = 0
                order.append(num)
            counts[num] += 1

if counts:
    max_freq = max(counts.values())
    for num in order:
        if counts[num] == max_freq:
            print(num)
```

---

## 05-01: เลขไหนหายไป

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับข้อความหนึ่งบรรทัด ตรวจสอบว่าในข้อความนั้นขาดเลขโดดตัวใดไปบ้างจากชุดเลข `0` ถึง `9`
- ถ้ามีเลขที่หายไป: แสดงเลขที่หายไปคั่นด้วยเครื่องหมายจุลภาค `,` (เรียงจากน้อยไปมาก)
- ถ้ามีครบทุกเลข `0-9`: แสดงคำว่า `None`

---

### 💻 2. โค้ดเฉลยฉบับสมบูรณ์
```python
text = input()

missing = []
for digit in "0123456789":
    if digit not in text:
        missing.append(digit)

if missing:
    print(",".join(missing))
else:
    print("None")
```

---

### 🎙️ 3. สคริปต์คำพูดสำหรับใช้สอน / Live Code
> **ผู้สอน:** *"สังเกตว่าโจทย์ต้องการให้เลขที่หายไปเรียงจากน้อยไปมาก*
> *เทคนิคที่ฉลาดคือการวนลูป `for digit in "0123456789":` เพราะตัวเลขจะถูกตรวจสอบตามลำดับ 0 ถึง 9 อยู่แล้ว ทำให้ผลลัพธ์ใน `missing` เรียงลำดับให้อัตโนมัติโดยไม่ต้องสั่ง `.sort()` เลยครับ"*

---

## 05-02: ชื่อจริง - ชื่อเล่น

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
กำหนดตารางคู่ชื่อจริงและชื่อเล่นที่ตรงกัน 10 คู่ เมื่อรับชื่อเข้ามา $N$ บรรทัด:
- ถ้าเป็นชื่อจริง $ightarrow$ แสดงชื่อเล่น
- ถ้าเป็นชื่อเล่น $ightarrow$ แสดงชื่อจริง
- ถ้าไม่มีในฐานข้อมูล $ightarrow$ แสดง `Not found`

---

### 💡 2. ทำไมถึงเขียนแบบนี้? (เทคนิค Parallel Lists & `.index()`)
สร้าง 2 Lists วางตำแหน่งให้ดัชนีตรงกัน:
- `reals = ["Robert", "William", ...]`
- `nicks = ["Dick", "Bill", ...]`
เมื่อผู้ใช้กรอก `name` เข้ามา:
- ถ้า `name in reals`: หาตำแหน่งด้วย `idx = reals.index(name)` แล้วตอบ `nicks[idx]`
- ถ้า `name in nicks`: หาตำแหน่งด้วย `idx = nicks.index(name)` แล้วตอบ `reals[idx]`

---

### 💻 3. โค้ดเฉลยฉบับสมบูรณ์
```python
reals = ["Robert", "William", "James", "John", "Margaret", "Edward", "Sarah", "Andrew", "Anthony", "Deborah"]
nicks = ["Dick", "Bill", "Jim", "Jack", "Peggy", "Ed", "Sally", "Andy", "Tony", "Debbie"]

n = int(input())
for _ in range(n):
    name = input().strip()
    if name in reals:
        idx = reals.index(name)
        print(nicks[idx])
    elif name in nicks:
        idx = nicks.index(name)
        print(reals[idx])
    else:
        print("Not found")
```

---

## 05-04: การนับจำนวนยอด

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับชุดตัวเลขในบรรทัดเดียว ค้นหาและนับจำนวน **ยอดเขา (Local Peak)** ซึ่งนิยามว่าคือตำแหน่งที่ค่าของตัวมันเอง **มากกว่าตัวหน้า และมากกว่าตัวหลัง**
$$data[i] > data[i-1] \quad \text{และ} \quad data[i] > data[i+1]$$

---

### 💡 2. ทำไมถึงเขียนแบบนี้? (การวนลูปไม่รวมหัวท้าย)
ตำแหน่งแรกสุด (index 0) และตำแหน่งท้ายสุด (index สุดท้าย) ไม่มีเพื่อนบ้านครบ 2 ฝั่ง จึงไม่มีสิทธิ์เป็นยอดเขา
เราจึงวนลูปตั้งแต่ Index `1` ถึง `len(data) - 2` ด้วยคำสั่ง:
`range(1, len(data) - 1)`

---

### 💻 3. โค้ดเฉลยฉบับสมบูรณ์
```python
data = [float(x) for x in input().split()]

peaks = 0
for i in range(1, len(data) - 1):
    if data[i] > data[i - 1] and data[i] > data[i + 1]:
        peaks += 1

print(peaks)
```
