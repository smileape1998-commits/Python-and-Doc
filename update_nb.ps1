$notebookPath = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_04_Repetition\01_Lecture_Repetition.ipynb"
$rawContent = [System.IO.File]::ReadAllText($notebookPath, [System.Text.Encoding]::UTF8)

# Convert from JSON
$nb = $rawContent | ConvertFrom-Json

# Find Section 4.4 cell index
$idx_4_4 = -1
for ($i = 0; $i -lt $nb.cells.Length; $i++) {
    if ($nb.cells[$i].cell_type -eq "markdown") {
        $src = [string]::Join("", $nb.cells[$i].source)
        if ($src -like "*## 4.4 for i in range*") {
            $idx_4_4 = $i
            break
        }
    }
}

Write-Host "Index 4.4 = $idx_4_4"

# New cells JSON string using single-quoted heredoc to prevent variable expansion
$newCellsJson = @'
[
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "---\n",
      "\n",
      "## 4.4 for i in range (การวนซ้ำตามช่วงตัวเลข)\n",
      "\n",
      "### อธิบายแนวคิด (Concept Explanation)\n",
      "คำสั่ง `for` ร่วมกับฟังก์ชัน `range()` ใช้เมื่อทราบจำนวนรอบการวนซ้ำที่แน่นอนล่วงหน้า โดยฟังก์ชัน `range()` จะสร้างลำดับของจำนวนเต็มตามพารามิเตอร์ที่กำหนด\n",
      "\n",
      "### รูปแบบการใช้งาน range()\n",
      "1. `range(stop)` : เริ่มจาก `0` ถึง `stop - 1` (เพิ่มทีละ 1)\n",
      "2. `range(start, stop)` : เริ่มจาก `start` ถึง `stop - 1` (เพิ่มทีละ 1)\n",
      "3. `range(start, stop, step)` : เริ่มจาก `start` ถึงก่อนถึง `stop` เพิ่ม/ลด ครั้งละ `step`\n",
      "\n",
      "![ตัวอย่างการทำงานของ range](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex04_04_11.png)\n",
      "\n",
      "**ตัวอย่างช่วงค่าตัวแปรจาก range ในแบบต่างๆ:**\n",
      "- `range(4, 100, 2)` $\\rightarrow$ `k = 4, 6, 8, ..., 98`\n",
      "- `range(100, 0, -1)` $\\rightarrow$ `k = 100, 99, 98, ..., 1`\n",
      "- `range(5, 100)` $\\rightarrow$ `k = 5, 6, 7, ..., 99`\n",
      "- `range(100)` $\\rightarrow$ `k = 0, 1, 2, ..., 99`\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่างการพิมพ์ค่า 0 ถึง n-1 โดยใช้ range(n)\n",
      "n = int(input())\n",
      "for i in range(n):\n",
      "    print(i)\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.4: แสดงแม่สูตรคูณแม่ 5 โดยใช้ range(start, stop)\n",
      "for i in range(1, 13):\n",
      "    print(f\"5 x {i} = {5 * i}\")\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "### ตัวอย่างการแปลงผังงาน (Flowchart) เป็นโปรแกรมด้วย for loop\n",
      "\n",
      "#### ตัวอย่าง 4.4.1: การหาผลรวม 0 ถึง n-1\n",
      "\n",
      "![ผังงาน 4-4 ข้อ 1](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex04_04_01.png)\n",
      "\n",
      "**คำอธิบาย:** รับค่า `n` จากผู้ใช้ จากนั้นวนลูป `i` ตั้งแต่ `0` ถึง `n-1` แล้วบวกสะสมค่า `i` เข้าในตัวแปร `s` แล้วพิมพ์ผลลัพธ์ `s` ออกมา\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.4.1: คำนวณผลรวม i = 0 ถึง n-1\n",
      "n = int(input())\n",
      "s = 0\n",
      "for i in range(n):\n",
      "    s += i\n",
      "print(s)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.4.2: การคำนวณผลรวมเงื่อนไขเลขคู่ (วนจาก 1 ถึง n)\n",
      "\n",
      "![ผังงาน 4-4 ข้อ 2](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex04_04_02.png)\n",
      "\n",
      "**คำอธิบาย:** รับค่า `n` จากผู้ใช้ วนลูป `i` ตั้งแต่ `1` ถึง `n` (`range(1, n+1)`)\n",
      "- ตรวจสอบว่า `i` เป็นเลขคู่หรือไม่ (`i % 2 == 0`)\n",
      "- หากเป็นเลขคู่ ให้บวก `s += i` เพิ่มอีกรอบหนึ่ง\n",
      "- ทุกๆ รอบจะมีการบวก `s += i` เสมอ\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.4.2: คำนวณผลรวมเงื่อนไขเลขคู่ (1 ถึง n)\n",
      "n = int(input())\n",
      "s = 0\n",
      "for i in range(1, n + 1):\n",
      "    if i % 2 == 0:\n",
      "        s += i\n",
      "    s += i\n",
      "print(s)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.4.3: การวนลูปถอยหลังพร้อมปรับเปลี่ยนตัวแปร k\n",
      "\n",
      "![ผังงาน 4-4 ข้อ 3](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex04_04_03.png)\n",
      "\n",
      "**คำอธิบาย:** รับค่า `n` ตั้งค่า `s = 0` และ `k = 1` วนลูปถอยหลัง `i` ตั้งแต่ `n` ถึง `1` (`range(n, 0, -1)`)\n",
      "- ถ้า `i` เป็นเลขคู่ ให้ทำ `s += i * k`\n",
      "- ถ้า `i` เป็นเลขคี่ ให้ทำ `s -= k`\n",
      "- ในทุกรอบการวนซ้ำจะบวก `k += 2` และบวก `s += i * k`\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.4.3: วนลูปถอยหลังพร้อมปรับเปลี่ยนตัวแปร k\n",
      "n = int(input())\n",
      "s = 0\n",
      "k = 1\n",
      "for i in range(n, 0, -1):\n",
      "    if i % 2 == 0:\n",
      "        s += i * k\n",
      "    else:\n",
      "        s -= k\n",
      "    k += 2\n",
      "    s += i * k\n",
      "print(s)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "---\n",
      "\n",
      "## 4.5 for c in string (การวนลูปทีละตัวอักษรในสตริง)\n",
      "\n",
      "### อธิบายแนวคิด (Concept Explanation)\n",
      "การใช้คำสั่ง `for` ท่องไปในข้อความ ตัวแปรลูปจะดึงตัวอักษรทีละอักขระออกมารายตัวจากซ้ายไปขวาจนครบทุกอักขระในข้อความ\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.5: นับจำนวนสระภาษาอังกฤษในข้อความ\n",
      "text = \"Python Programming\"\n",
      "vowel_count = 0\n",
      "\n",
      "for c in text:\n",
      "    if c in \"aeiouAEIOU\":\n",
      "        vowel_count += 1\n",
      "\n",
      "print(\"จำนวนสระที่พบ:\", vowel_count)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "### ตัวอย่างเพิ่มเติมสำหรับการวนลูปใน String\n",
      "\n",
      "#### ตัวอย่าง 4.5.1: นับจำนวนตัวเลข 0 ถึง 9 ในสตริง\n",
      "\n",
      "![ผังงาน 4-5 ข้อ 1](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex04_05_01.png)\n",
      "\n",
      "**คำอธิบาย:** รับสตริง `t` เข้ามาจากผู้ใช้ ตั้งค่าเริ่มต้น `s = 0` แล้ววนลูปตรวจเช็คอักขระ `c` ทีละตัวว่าอยู่ในช่วงตัวเลข `'0'` ถึง `'9'` หรือไม่ หากใช่ให้เพิ่มค่า `s` ขึ้นทีละ 1 แล้วพิมพ์ผลรวม `s` ออกมา\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.5.1: นับจำนวนตัวเลข 0 ถึง 9 ในสตริง\n",
      "t = input()\n",
      "s = 0\n",
      "for c in t:\n",
      "    if \"0\" <= c <= \"9\":\n",
      "        s += 1\n",
      "print(s)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.5.2: การแทนที่เครื่องหมายวรรคตอนด้วยช่องว่าง\n",
      "\n",
      "![ผังงาน 4-5 ข้อ 2](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex04_05_02.png)\n",
      "\n",
      "**คำอธิบาย:** รับสตริง `t` ตั้งค่าสตริงว่าง `s = \"\"` แล้วท่องไปในแต่ละอักขระ `c` ใน `t` หาก `c` เป็นสัญลักษณ์ `, . ( )` ให้ต่อช่องว่าง `\" \"` เข้าไปใน `s` หากไม่ใช่สัญลักษณ์ดังกล่าวให้ต่อตัวอักษร `c` เดิมเข้าไป\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.5.2: เปลี่ยนสัญลักษณ์ .,() เป็นช่องว่าง\n",
      "t = input()\n",
      "s = \"\"\n",
      "for c in t:\n",
      "    if c in \".,()\":\n",
      "        s += \" \"\n",
      "    else:\n",
      "        s += c\n",
      "print(s)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.5.3: แสดงเฉพาะตัวอักษรภาษาอังกฤษทีละบรรทัด\n",
      "\n",
      "**คำอธิบาย:** อ่านสตริงจาก input จากนั้นแสดงเฉพาะตัวอักษรภาษาอังกฤษ (A-Z หรือ a-z) จากซ้ายไปขวาบรรทัดละตัว เช่น อ่านมาเป็น `\"A-B-123 &\"` จะแสดงแค่ A กับ B (บรรทัดละตัว)\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.5.3: แสดงเฉพาะตัวอักษรภาษาอังกฤษ\n",
      "t = input()\n",
      "for c in t:\n",
      "    if \"a\" <= c <= \"z\" or \"A\" <= c <= \"Z\":\n",
      "        print(c)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.5.4: แสดงเฉพาะอักขระที่ตำแหน่ง Index คี่\n",
      "\n",
      "**คำอธิบาย:** อ่านสตริงจาก input จากนั้นแสดงเฉพาะตัวอักษรในสตริงที่อยู่ที่ Index คี่ (1, 3, 5, ...) บรรทัดละตัว โดยใช้ Slicing `t[1::2]` ร่วมกับ for loop\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.5.4: แสดงเฉพาะอักขระที่ Index คี่\n",
      "t = input()\n",
      "for c in t[1::2]:\n",
      "    print(c)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "---\n",
      "\n",
      "## 4.6 for e in list (การวนลูปทีละสมาชิกในลิสต์)\n",
      "\n",
      "### อธิบายแนวคิด (Concept Explanation)\n",
      "การใช้คำสั่ง `for` ท่องไปในลิสต์ ตัวแปรลูปจะเข้าถึงสมาชิกแต่ละตัวในลิสต์ทีละธาตุเรียงตามลำดับ Index จากซ้ายไปขวา\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.6: คัดกรองเฉพาะจำนวนคู่จากลิสต์ของตัวเลข\n",
      "numbers = [12, 7, 9, 20, 15, 30]\n",
      "even_numbers = []\n",
      "\n",
      "for e in numbers:\n",
      "    if e % 2 == 0:\n",
      "        even_numbers.append(e)\n",
      "\n",
      "print(\"จำนวนคู่ในลิสต์:\", even_numbers)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "### ตัวอย่างเพิ่มเติมสำหรับการวนลูปใน List\n",
      "\n",
      "#### ตัวอย่าง 4.6.1: การวนลูปใน Sub-list (Slicing)\n",
      "\n",
      "**คำอธิบาย:** ตัดเฉพาะช่วงข้อมูลของลิสต์ด้วย Slicing เช่น `x[2:-2]` แล้วใช้ `for e in ...` เพื่อท่องไปในแต่ละสมาชิกของช่วงที่ตัดออกมา\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.6.1: วนลูปในช่วงสมาชิกที่ต้องการโดยใช้ Slicing\n",
      "x = [1, 3, 4, 5, 7, 8]\n",
      "for e in x[2:-2]:\n",
      "    print(e)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.6.2: อ่านและแสดงรหัสสินค้าจาก input\n",
      "\n",
      "**คำอธิบาย:** รับรายการรหัสสินค้าแยกด้วยช่องว่าง เช่น `\"A1023 P223 A392\"` นำมาแยกด้วย `.split()` เป็นลิสต์ แล้วแสดงรหัสสินค้าทีละบรรทัดจากซ้ายไปขวา\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.6.2: อ่านรายการรหัสสินค้าและแสดงทีละบรรทัด\n",
      "prod_ids = input().split()\n",
      "for pid in prod_ids:\n",
      "    print(pid)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.6.3: แสดงรายการสินค้าจากขวาไปซ้าย (Reverse List Slicing)\n",
      "\n",
      "**คำอธิบาย:** รับข้อมูลรูปแบบ `\"Office Product: A1023 P223 A392\"` แยกด้วย `\":\"` เพื่อเอารายการรหัสสินค้ามาแยกด้วย `.split()` แล้ววนลูปกลับทิศทางจากขวามาซ้ายด้วย `prod_ids[::-1]`\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.6.3: แสดงเฉพาะรหัสสินค้าย้อนกลับจากขวาไปซ้าย\n",
      "x = input().split(\":\")\n",
      "prod_ids = x[1].split()\n",
      "for pid in prod_ids[::-1]:\n",
      "    print(pid)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.6.4: นับจำนวนสมาชิกที่ตรงกับค่า a ในลิสต์ x\n",
      "\n",
      "**คำอธิบาย:** รับบรรทัดแรกแยกด้วย `.split()` เก็บในลิสต์ `x` อ่านบรรทัดที่สองเก็บใน `a` จากนั้นวนลูปนับว่ามีค่าใน `a` ซ้ำอยู่ในลิสต์ `x` ทั้งหมดกี่ตัว\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.6.4: นับจำนวนครั้งที่พบค่า a ในลิสต์ x\n",
      "x = input().split()\n",
      "a = input()\n",
      "c = 0\n",
      "for e in x:\n",
      "    if e == a:\n",
      "        c += 1\n",
      "print(c)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "---\n",
      "\n",
      "## 4.7 break (คำสั่งออกจากลูปทันที)\n",
      "\n",
      "### อธิบายแนวคิด (Concept Explanation)\n",
      "คำสั่ง `break` ใช้สำหรับการยกเลิกและออกจากลูปการทำงานทันทีโดยไม่ต้องรอให้เงื่อนไขลูปเป็นเท็จ\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.7: การค้นหาตัวเลขแรกที่หารด้วย 7 ลงตัวในช่วง 1 ถึง 50\n",
      "for i in range(1, 51):\n",
      "    if i % 7 == 0:\n",
      "        print(\"พบตัวเลขแรกที่หารด้วย 7 ลงตัวคือ:\", i)\n",
      "        break\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "### ตัวอย่างเพิ่มเติมสำหรับการใช้คำสั่ง break\n",
      "\n",
      "#### ตัวอย่าง 4.7.1: คำนวณผลรวมข้อมูลสูงสุด 10 จำนวน (หรือหยุดเมื่อเจอ -1)\n",
      "\n",
      "**คำอธิบาย:** วนลูปอ่านจำนวนเต็มสูงสุด 10 จำนวน หากผู้ใช้ป้อน `-1` ให้หลุดออกจากลูปวนซ้ำด้วยคำสั่ง `break` ทันที แล้วแสดงผลรวม `s` ที่คำนวณได้จนถึงก่อนเจอ `-1`  \n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.7.1: ผลรวมข้อมูลสูงสุด 10 จำนวน หยุดเมื่อเจอ -1\n",
      "s = 0\n",
      "k = 0\n",
      "while k < 10:\n",
      "    x = int(input())\n",
      "    if x == -1:\n",
      "        break\n",
      "    s += x\n",
      "    k += 1\n",
      "print(s)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.7.2: การตรวจสอบจำนวนเฉพาะ (Prime Number Test)\n",
      "\n",
      "**คำอธิบาย:** รับจำนวนเต็ม `n` แล้วทดสอบนำ `k` ตั้งแต่ 2 ถึง `n` มาหาร `n` หากหารลงตัว (`n % k == 0`) ให้หยุดลูปด้วย `break` ทันที หากหยุดลูปแล้ว `k == n` แสดงว่าเป็นจำนวนเฉพาะ (Prime) แต่ถ้าไม่เท่ากับ `n` แสดงว่าเป็นจำนวนประกอบ (Composite)\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.7.2: ตรวจสอบจำนวนเฉพาะ Prime/Composite\n",
      "n = int(input())\n",
      "for k in range(2, n + 1):\n",
      "    if n % k == 0:\n",
      "        break\n",
      "if k == n:\n",
      "    print(\"Prime\")\n",
      "else:\n",
      "    print(\"Composite\")\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.7.3: เกมทายตัวเลข (Number Guessing Game)\n",
      "\n",
      "**คำอธิบาย:** สุ่มตัวเลข 0-99 ให้ผู้ใช้มีโอกาสทาย 7 ครั้ง ในแต่ละครั้งหากทายถูกจะออกจากลูปด้วย `break` หากทายไม่ถูกจะบอกคำใบ้ว่า \"Higher\" หรือ \"Lower\" เมื่อจบลูปจะแสดงผลว่าชนะหรือแพ้\n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.7.3: เกมทายตัวเลข\n",
      "import random\n",
      "\n",
      "my_number = random.randint(0, 99)\n",
      "print(\"You have 7 tries\")\n",
      "for i in range(1, 8):\n",
      "    print(\"#\" + str(i))\n",
      "    guess = int(input())\n",
      "    if guess == my_number:\n",
      "        break\n",
      "    if guess < my_number:\n",
      "        print(\"Higher\")\n",
      "    else:\n",
      "        print(\"Lower\")\n",
      "\n",
      "if guess == my_number:\n",
      "    print(\"You win\")\n",
      "else:\n",
      "    print(\"You lose\")\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.7.4: การแปลงผังงานที่มี break (ขณะวน while)\n",
      "\n",
      "![ผังงาน 4-7 ข้อ 1](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex04_07_01.png)\n",
      "\n",
      "**คำอธิบาย:** รับค่า `n` จากนั้นวนลูป `while k < n` อ่านค่า `x` หากเจอค่าลบ (`x < 0`) ให้ `break` ออกจากลูปทันที หากไม่ใช่ค่าลบ ให้คำนวณ `s += x * k` และเพิ่ม `k += 1` แล้วพิมพ์ `s` \n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.7.4: while loop ร่วมกับ break เมื่อพบค่าลบ\n",
      "n = int(input())\n",
      "s = 0\n",
      "k = 0\n",
      "while k < n:\n",
      "    x = int(input())\n",
      "    if x < 0:\n",
      "        break\n",
      "    s += x * k\n",
      "    k += 1\n",
      "print(s)\n"
    ]
  },
  {
    "cell_type": "markdown",
    "metadata": {},
    "source": [
      "#### ตัวอย่าง 4.7.5: การแปลงผังงานที่มี break (ขณะวน for loop)\n",
      "\n",
      "![ผังงาน 4-7 ข้อ 2](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex04_07_02.png)\n",
      "\n",
      "**คำอธิบาย:** รับค่า `n` แล้ววนลูป `for k in range(n)` อ่านค่า `x` หากเจอค่าลบ (`x < 0`) ให้ `break` ออกจากลูปทันที หากไม่ใช่ค่าลบ ให้คำนวณ `s += x * k` แล้วพิมพ์ `s` \n"
    ]
  },
  {
    "cell_type": "code",
    "execution_count": null,
    "metadata": {},
    "outputs": [],
    "source": [
      "# ตัวอย่าง 4.7.5: for loop ร่วมกับ break เมื่อพบค่าลบ\n",
      "n = int(input())\n",
      "s = 0\n",
      "for k in range(n):\n",
      "    x = int(input())\n",
      "    if x < 0:\n",
      "        break\n",
      "    s += x * k\n",
      "print(s)\n"
    ]
  }
]
'@

$newCells = $newCellsJson | ConvertFrom-Json

# Replace from idx_4_4 onwards
$retainedCells = $nb.cells[0..($idx_4_4 - 1)]
$nb.cells = $retainedCells + $newCells

# Convert back to JSON and write to file
$updatedJson = $nb | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText($notebookPath, $updatedJson, [System.Text.Encoding]::UTF8)

Write-Host "Notebook successfully updated via PowerShell!"
