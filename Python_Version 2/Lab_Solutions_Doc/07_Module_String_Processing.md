# 📘 คู่มือเฉลยแบบฝึกหัดและสคริปต์การสอน: Module 07 - String Processing

คู่มือนี้เน้นการประมวลผลข้อความเชิงลึก (**Advanced String Manipulation**), การตรวจสอบคำลงท้าย (`endswith`), การตัดคำและแปลงรูปแบบตัวพิมพ์ (camelCase), การอ่านและประมวลผลไฟล์ข้อความ (File I/O), และการสร้างระบบตรวจสอบความปลอดภัยของรหัสผ่าน (Password Strength Checker) ที่มีเงื่อนไขซับซ้อน

---

## 📑 สารบัญแบบฝึกหัดใน Module 07
1. [07-01: เอกพจน์พหูพจน์ (Singular to Plural Grammar Rules)](#07-01-เอกพจน์พหูพจน์)
2. [07-02: ตัวพิมพ์หลังอูฐ (camelCase Formatting)](#07-02-ตัวพิมพ์หลังอูฐ)
3. [07-05: น้อยสุด-มากสุด-เฉลี่ย (File Parsing & Student ID Slicing)](#07-05-น้อยสุด-มากสุด-เฉลี่ย)
4. [07-07: รหัสผ่าน (Password Security Validator)](#07-07-รหัสผ่าน)

---

## 07-01: เอกพจน์พหูพจน์

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับคำนามเอกพจน์ภาษาอังกฤษ แล้วแปลงเป็นรูปพหูพจน์ตามกฎไวยากรณ์:
1. ถ้าลงท้ายด้วย `s`, `x`, หรือ `ch` $ightarrow$ เติม `es`
2. ถ้าลงท้ายด้วย `y` และตัวอักษรข้างหน้า `y` **เป็นพยัญชนะ** (ไม่ใช่สระ a, e, i, o, u) $ightarrow$ เปลี่ยน `y` เป็น `ies`
3. กรณีอื่นๆ นอกเหนือจากนี้ $ightarrow$ เติม `s`

---

### 💻 2. โค้ดเฉลยฉบับสมบูรณ์
```python
# 07-01: เอกพจน์พหูพจน์
w = input().strip()
vowels = "aeiouAEIOU"

if w.endswith("s") or w.endswith("x") or w.endswith("ch"):
    print(w + "es")
elif w.endswith("y") and len(w) > 1 and w[-2] not in vowels:
    print(w[:-1] + "ies")
else:
    print(w + "s")
```

---

### 🔍 3. อธิบายการทำงาน
- `w.endswith("ch")`: ตรวจสอบสตริงย่อยส่วนท้ายของคำได้อย่างแม่นยำ
- `w[-2] not in vowels`: เช็คตัวอักษรก่อนหน้าตัวสุดท้าย (Index `-2`) ว่าไม่ใช่สระหรือไม่
- `w[:-1] + "ies"`: ตัดอักขระตัวสุดท้าย (`y`) ทิ้งด้วย `[:-1]` แล้วต่อด้วย `"ies"`

---

## 07-02: ตัวพิมพ์หลังอูฐ (camelCase)

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับสตริงที่มีคำปะปนกับสัญลักษณ์พิเศษและเครื่องหมายวรรคตอน แล้วแปลงให้อยู่ในรูปแบบ **camelCase**:
- คำแรกเป็นตัวพิมพ์เล็กทั้งหมด เช่น `total`
- คำถัดๆ ไปขึ้นต้นด้วยตัวพิมพ์ใหญ่ ตามด้วยตัวพิมพ์เล็ก เช่น `ScoreCount`
- ผลลัพธ์: `totalScoreCount`

---

### 💡 2. ทำไมถึงเขียนแบบนี้? (Custom Tokenizer & State Accumulator)
1. กรองเฉพาะอักขระที่เป็นตัวอักษรหรือตัวเลขด้วย `.isalnum()`
2. สะสมอักขระเป็นคำในตัวแปร `current` เมื่อเจอตัวคั่นที่ไม่ใช่ `isalnum()` ให้ตัดเก็บคำเข้า `words`
3. คำแรก `words[0].lower()` และคำถัดไป `w.capitalize()`

---

### 💻 3. โค้ดเฉลยฉบับสมบูรณ์
```python
# 07-02: ตัวพิมพ์หลังอูฐ (camelCase)
s = input().strip()

# ขจัดสัญลักษณ์พิเศษ เหลือเฉพาะตัวอักษรและตัวเลข
words = []
current = ""
for ch in s:
    if ch.isalnum():
        current += ch
    else:
        if current != "":
            words.append(current)
            current = ""
if current != "":
    words.append(current)

# ประกอบคำเป็น camelCase
if len(words) > 0:
    res = words[0].lower()
    for w in words[1:]:
        res += w.capitalize()
    print(res)
else:
    print("")
```

---

## 07-05: น้อยสุด-มากสุด-เฉลี่ย

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
รับชื่อไฟล์และปี พ.ศ. (เช่น `data.txt 2566`) อ่านข้อมูลในไฟล์ซึ่งแต่ละบรรทัดเก็บ `รหัสนิสิต คะแนน`
- กรองเฉพาะนิสิตที่เข้าเรียนในปี พ.ศ. นั้น (ดูจากเลข 2 ตัวแรกของรหัสนิสิต)
- คำนวณหาคะแนน ต่ำสุด, สูงสุด, และค่าเฉลี่ย (ถ้าไม่มีข้อมูลให้พิมพ์ `No data`)

---

### 💻 2. โค้ดเฉลยฉบับสมบูรณ์
```python
# 07-05: น้อยสุด-มากสุด-เฉลี่ย
filename, year_str = input().split()
target_yy = year_str[-2:]  # เอา 2 หลักท้ายของปี พ.ศ. เช่น "2566" -> "66"

scores = []
try:
    with open(filename, "r") as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 2:
                sid = parts[0]
                score = float(parts[1])
                if sid.startswith(target_yy):
                    scores.append(score)
except Exception:
    pass

if len(scores) == 0:
    print("No data")
else:
    print(f"{min(scores)} {max(scores)} {sum(scores) / len(scores)}")
```

---

## 07-07: รหัสผ่าน (Password Security Validator)

### 🎯 1. วิเคราะห์โจทย์และเป้าหมาย
โปรแกรมตรวจสอบความปลอดภัยของรหัสผ่าน ตรวจสอบ 6 กฎ หากไม่ผ่านกฎใด ให้พิมพ์ข้อความแจ้งเตือนข้อผิดพลาดทั้งหมดตามลำดับ:
1. **ความยาว:** $\ge 8$ ตัวอักษร (`Less than 8 characters`)
2. **ประเภทอักขระ:** ต้องมีพิมพ์เล็ก, พิมพ์ใหญ่, ตัวเลข, และสัญลักษณ์ (`No lowercase letters`, `No uppercase letters`, `No numbers`, `No symbols`)
3. **อักขระซ้ำ:** ห้ามมีตัวอักษรเดียวกันซ้ำติดกัน 4 ตัว เช่น `aaaa` (`Character repetition`)
4. **ลำดับตัวเลข:** ห้ามมีตัวเลขเรียงกัน 4 ตัว (เพิ่มหรือลด เช่น `1234`, `4321`, `9012`) (`Number sequence`)
5. **ลำดับตัวอักษร:** ห้ามมีตัวอักษรเรียงกัน 4 ตัว (เช่น `abcd`, `dcba`) (`Letter sequence`)
6. **รูปแบบแป้นพิมพ์:** ห้ามมีปุ่มติดกันบนคีย์บอร์ด 4 ปุ่มตามแนวนอน (เช่น `qwer`, `asdf`, `1234`) (`Keyboard pattern`)

---

### 💡 2. ทำไมถึงเขียนแบบนี้? (Master Pattern Generation)
แทนที่จะเขียน if-else ตรวจสอบเงื่อนไขตัวเลขและคีย์บอร์ดเรียงกันหลายสิบบรรทัด:
- เราสร้าง **Pattern String ต้นแบบ** ไว้ล่วงหน้า เช่น `digits_inc = "01234567890123"`
- ในการตรวจสอบสตริงย่อย 4 ตัว (`pwd[i:i+4]`) เราเพียงแค่ใช้ตัวดำเนินการ `in` เช็คว่าปรากฏใน Pattern ต้นแบบหรือไม่!

---

### 💻 3. โค้ดเฉลยฉบับสมบูรณ์
```python
# 07-07: รหัสผ่าน
pwd = input().strip()
errors = []

# 1. ตรวจสอบความยาวอย่างน้อย 8 ตัว
if len(pwd) < 8:
    errors.append("Less than 8 characters")

# 2. ตรวจสอบประเภทของอักขระ
has_lower = any(c.islower() for c in pwd)
has_upper = any(c.isupper() for c in pwd)
has_num = any(c.isdigit() for c in pwd)
has_sym = any(not c.isalnum() for c in pwd)

if not has_lower:
    errors.append("No lowercase letters")
if not has_upper:
    errors.append("No uppercase letters")
if not has_num:
    errors.append("No numbers")
if not has_sym:
    errors.append("No symbols")

# 3. อักขระซ้ำกัน 4 ตัวติดกัน
has_rep = False
for i in range(len(pwd) - 3):
    if pwd[i] == pwd[i+1] == pwd[i+2] == pwd[i+3]:
        has_rep = True
        break
if has_rep:
    errors.append("Character repetition")

# 4. ลำดับตัวเลข 4 ตัวติดกัน (เรียงเพิ่ม/ลด)
digits_inc = "01234567890123"
digits_dec = "98765432109876"
has_num_seq = False
for i in range(len(pwd) - 3):
    sub = pwd[i:i+4]
    if sub.isdigit():
        if sub in digits_inc or sub in digits_dec:
            has_num_seq = True
            break
if has_num_seq:
    errors.append("Number sequence")

# 5. ลำดับตัวอักษร 4 ตัวติดกัน (เรียงเพิ่ม/ลด ไม่สนตัวเล็กตัวใหญ่)
alphabet_inc = "abcdefghijklmnopqrstuvwxyzabcdef"
alphabet_dec = "zyxwvutsrqponmlkjihgfedcba"
has_let_seq = False
pwd_lower = pwd.lower()
for i in range(len(pwd_lower) - 3):
    sub = pwd_lower[i:i+4]
    if sub.isalpha():
        if sub in alphabet_inc or sub in alphabet_dec:
            has_let_seq = True
            break
if has_let_seq:
    errors.append("Letter sequence")

# 6. ลำดับปุ่มติดกันบนแป้นพิมพ์แนวนอน 4 ตัวติดกัน
rows = ["1234567890-=", "!@#$%^&*()_+", "qwertyuiop", "asdfghjkl", "zxcvbnm"]
kb_patterns = []
for r in rows:
    for i in range(len(r) - 3):
        kb_patterns.append(r[i:i+4])
        kb_patterns.append(r[i:i+4][::-1])

has_kb = False
for i in range(len(pwd_lower) - 3):
    sub = pwd_lower[i:i+4]
    if sub in kb_patterns:
        has_kb = True
        break
if has_kb:
    errors.append("Keyboard pattern")

# แสดงผลลัพธ์
if len(errors) == 0:
    print("OK")
else:
    for err in errors:
        print(err)
```
