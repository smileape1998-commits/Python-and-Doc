# 📘 คู่มือเฉลยแบบฝึกหัดและสคริปต์การสอน: Module 08 - Basic Dict

คู่มือนี้เน้นการอธิบายโครงสร้างข้อมูล **Dictionary (พจนานุกรม - Key-Value Pairs)** ใน Python ซึ่งมีความเร็วในการค้นหาข้อมูลที่ระดับ $O(1)$ รวมถึงเทคนิคการสลับคีย์กับค่า (Inversion), การทำ Bidirectional Mapping, การนับความถี่และเรียงลำดับหลายเงื่อนไข (Multi-criteria Sorting), และการสรุปยอดขายสินค้า

---

## 📑 สารบัญแบบฝึกหัดใน Module 08
1. [08-01: สลับ key กับ value (Reverse Dict & Find Keys)](#08-01-สลับ-key-กับ-value)
2. [08-02: ชื่อจริง - ชื่อเล่น (Bidirectional Dict Mapping)](#08-02-ชื่อจริง---ชื่อเล่น)
3. [08-03: การนับตัวอักษร (Frequency Counting & Custom Sorting)](#08-03-การนับตัวอักษร)
4. [08-04: ยอดขายไอศกรีม (Sales Ledger & Top Sellers)](#08-04-ยอดขายไอศกรีม)

---

## 08-01: สลับ key กับ value

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
เขียน 2 ฟังก์ชันสำหรับจัดการ Dictionary:
1. `reverse(d)`: รับ Dictionary `d` ที่มี value ไม่ซ้ำกัน คืน Dictionary ใหม่ที่สลับตำแหน่ง `key` ให้กลายเป็น `value` และ `value` กลายเป็น `key`
2. `keys(d, v)`: คืน List ของ keys ทั้งหมดใน `d` ที่มีค่า value เท่ากับ `v`

---

### 💻 2. โค้ดเฉลยฉบับสมบูรณ์
```python
# 08-01: สลับ key กับ value
def reverse(d):
    """สลับ key กับ value ใน Dictionary"""
    res = {}
    for k, v in d.items():
        res[v] = k
    return res

def keys(d, v):
    """ค้นหา keys ทั้งหมดที่มีค่าตรงกับ v"""
    res = []
    for k, val in d.items():
        if val == v:
            res.append(k)
    return res
```

---

## 08-02: ชื่อจริง - ชื่อเล่น

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับคู่ชื่อจริงและชื่อเล่น $N$ คู่ จากนั้นรับคำค้นหา $M$ บรรทัด
- ถ้าเป็นชื่อจริง $ightarrow$ แสดงชื่อเล่น
- ถ้าเป็นชื่อเล่น $ightarrow$ แสดงชื่อจริง
- ถ้าไม่พบ $ightarrow$ แสดง `Not found`

---

### 💡 2. ทำไมถึงเขียนแบบนี้? (Two-way Mapping in a Single Dict)
แทนที่จะสร้าง Dictionary 2 ตัวแยกกัน เราสามารถนำชื่อทั้งสองทิศทางยัดลงใน Dictionary ตัวเดียวกันได้เลย:
```python
mapping[real] = nick
mapping[nick] = real
```
เมื่อค้นหา ไม่ว่าผู้ใช้จะถามชื่อจริงหรือชื่อเล่น ก็จะสามารถดึงคำตอบได้ในบรรทัดเดียวด้วย `mapping[q]` ที่ความเร็วระดับ $O(1)$!

---

### 💻 3. โค้ดเฉลยฉบับสมบูรณ์
```python
# 08-02: ชื่อจริง - ชื่อเล่น (อีกแล้ว)
n = int(input())
mapping = {}

for _ in range(n):
    real, nick = input().split()
    mapping[real] = nick
    mapping[nick] = real

m = int(input())
for _ in range(m):
    q = input().strip()
    if q in mapping:
        print(mapping[q])
    else:
        print("Not found")
```

---

## 08-03: การนับตัวอักษร

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับข้อความหนึ่งบรรทัด นับจำนวนตัวอักษรภาษาอังกฤษที่ปรากฏ (ไม่สนตัวพิมพ์เล็ก-ใหญ่) และแสดงผลเรียงตามเงื่อนไข:
1. เรียงตาม **จำนวนที่นับได้จากมากไปน้อย (Descending)**
2. ถ้าจำนวนเท่ากัน ให้เรียงตาม **ตัวอักษรตามพจนานุกรม (Ascending: a -> z)**

---

### 💡 2. ทำไมถึงเขียนแบบนี้? (เทคนิคค่าลบกับการเรียงลำดับหลายมิติ)
Python จะเรียงลำดับ List ของ List/Tuple โดยเปรียบเทียบสมาชิกตัวที่ 1 ก่อน ถ้าเท่ากันจึงเปรียบเทียบตัวที่ 2:
- เราต้องการให้ **จำนวน** เรียงจาก *มากไปน้อย*
- แต่ต้องการให้ **ตัวอักษร** เรียงจาก *น้อยไปมาก*
- ถ้าเราเก็บข้อมูลในรูป `[-count, char]` เช่น `[-7, 'b']`
- เมื่อสั่ง `.sort()` ค่า `-7` จะมาก่อน `-4` (แปลว่าความถี่ 7 มาก่อน 4) และถ้าความถี่เท่ากัน เช่น `[-2, 'a']` กับ `[-2, 'c']` ตัว `'a'` จะมาก่อน `'c'` พอดีเป๊ะ!

---

### 💻 3. โค้ดเฉลยฉบับสมบูรณ์
```python
# 08-03: การนับตัวอักษร
s = input().strip()
counts = {}

# นับความถี่ของตัวอักษร
for ch in s:
    if ch.isalpha():
        c = ch.lower()
        if c in counts:
            counts[c] += 1
        else:
            counts[c] = 1

# สร้างลิสต์สำหรับการเรียงลำดับแบบพิเศษ: [-ความถี่, ตัวอักษร]
sort_list = []
for ch, cnt in counts.items():
    sort_list.append([-cnt, ch])

sort_list.sort()

# แปลงค่าลบกลับเป็นจำนวนจริงเพื่อพิมพ์ผล
for item in sort_list:
    cnt = -item[0]
    ch = item[1]
    print(f"{ch} -> {cnt}")
```

---

## 08-04: ยอดขายไอศกรีม

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับเมนูราคาไอศกรีม $N$ รายการ ตามด้วยรายการบันทึกการขายสินค้า $M$ รายการ
- สินค้าที่ขายอาจมีสินค้าที่ไม่ใช่ไอศกรีม (เช่น คุกกี้, มาม่า) $ightarrow$ ต้องไม่นำมาคิดยอดขาย
- ถ้าไม่มีการขายไอศกรีมเลย $ightarrow$ แสดง `No ice cream sales`
- ถ้ามี $ightarrow$ แสดงยอดเงินรวม และแสดงชื่อไอศกรีมที่มียอดขายเงินรวมสูงสุด (ถ้ามีหลายชื่อให้เรียงตามพจนานุกรม)

---

### 💻 2. โค้ดเฉลยฉบับสมบูรณ์
```python
# 08-04: ยอดขายไอศกรีม
n = int(input())
prices = {}
for _ in range(n):
    name, price = input().split()
    prices[name] = float(price)

m = int(input())
sales = {}
total_sales = 0.0

for _ in range(m):
    item, qty_str = input().split()
    qty = int(qty_str)
    # กรองเฉพาะสินค้าที่เป็นไอศกรีม (มีในตารางราคา)
    if item in prices:
        amt = prices[item] * qty
        total_sales += amt
        if item in sales:
            sales[item] += amt
        else:
            sales[item] = amt

# ตรวจสอบว่ามียอดขายไอศกรีมหรือไม่
if total_sales == 0.0 or len(sales) == 0:
    print("No ice cream sales")
else:
    print("Total ice cream sales:", total_sales)
    # หาชื่อไอศกรีมที่มียอดขายสูงสุด
    max_amt = max(sales.values())
    top_items = []
    for item, amt in sales.items():
        if amt == max_amt:
            top_items.append(item)
    top_items.sort()
    print("Top sales:", ", ".join(top_items))
```
