$notebookPath = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_04_Repetition\01_Lecture_Repetition.ipynb"

# Complete notebook JSON string using single-quoted heredoc to prevent variable expansion
$fullNotebookJson = @'
{
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "# Module 4: Repetition (การทำงานซ้ำวนลูป)\n",
        "\n",
        "ในบทนี้เราจะเรียนรู้เกี่ยวกับการควบคุมทิศทางการทำงานของโปรแกรมให้ทำงานคำสั่งเดิมซ้ำๆ (Looping หรือ Iteration) ตามเงื่อนไขที่กำหนด ช่วยลดความซ้ำซ้อนของโค้ดและเพิ่มประสิทธิภาพในการประมวลผลข้อมูลชุดใหญ่"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "## 4.1 Flowchart (ผังงานการทำงานซ้ำ)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "ผังงานแสดงการทำงานซ้ำ (Loop Flowchart) ใช้สัญลักษณ์รูปเพชร (Decision Symbol) ในการตรวจสอบเงื่อนไข:\n",
        "- หากเงื่อนไขเป็น **จริง (True)** โปรแกรมจะเข้าไปทำงานในกลุ่มคำสั่งภายในลูป (Loop Body) แล้ววนกลับมาตรวจสอบเงื่อนไขเดิมอีกครั้ง\n",
        "- หากเงื่อนไขเป็น **เท็จ (False)** โปรแกรมจะหลุดออกจากลูปแล้วข้ามไปทำงานในคำสั่งถัดไปที่อยู่หลังลูป\n",
        "\n",
        "### องค์ประกอบสำคัญ 3 ประการของการวนลูป\n",
        "1. **การกำหนดค่าเริ่มต้น (Initialization):** การตั้งค่าตัวแปรควบคุมลูปก่อนเข้าลูป\n",
        "2. **เงื่อนไขทดสอบ (Condition):** นิพจน์บูลีนที่ใช้ตัดสินใจว่าจะวนซ้ำต่อไปหรือไม่\n",
        "3. **การปรับปรุงค่า (Update):** การเปลี่ยนค่าตัวแปรควบคุมลูปในแต่ละรอบ เพื่อให้เข้าใกล้เงื่อนไขสิ้นสุดลูป"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### ตัวอย่างผังงาน 1: การนับจำนวนครั้งที่ n ถูกหารด้วย 2\n",
        "\n",
        "![ผังงานนับการหารด้วย 2](images/ex04_01_01.png)"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 4.1.1: นับจำนวนครั้งที่ n ถูกหารด้วย 2 จนกว่า n <= 0\n",
        "n = 16\n",
        "c = 0\n",
        "while n > 0:\n",
        "    n //= 2\n",
        "    c += 1\n",
        "print(c)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### ตัวอย่างผังงาน 2: การแปลงเลขฐานสองเป็นเลขฐานสิบ\n",
        "\n",
        "![ผังงานแปลงเลขฐานสองเป็นฐานสิบ](images/ex04_01_02.png)"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 4.1.2: แปลงสตริงเลขฐานสอง b เป็นเลขฐานสิบ d\n",
        "b = \"1011\"\n",
        "n = len(b)\n",
        "k = 0\n",
        "d = 0\n",
        "while k < n:\n",
        "    d += 2**k * int(b[n - k - 1])\n",
        "    k += 1\n",
        "print(d)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### ตัวอย่างผังงาน 3: การใช้เงื่อนไขซ้อนภายในลูป\n",
        "\n",
        "![ผังงานเงื่อนไขซ้อนในลูป](images/ex04_01_03.png)"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 4.1.3: การทำงานซ้ำร่วมกับเงื่อนไข if ซ้อนภายในลูป\n",
        "n = 10\n",
        "c = 0\n",
        "while n > 0:\n",
        "    n = n - 1\n",
        "    if n % 3 == 0:\n",
        "        n = n - c\n",
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
        "## 4.2 while (การวนซ้ำด้วยคำสั่ง while)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "คำสั่ง `while` จะตรวจสอบเงื่อนไขก่อนเริ่มทำงานเสมอ หากเงื่อนไขเป็นจริง จะทำงานตามคำสั่งภายในบล็อกย่อหน้า เหมาะสำหรับกรณีที่ไม่ทราบจำนวนรอบการทำงานซ้ำที่แน่นอนล่วงหน้า ขึ้นอยู่กับเงื่อนไขในขณะประมวลผล\n",
        "\n",
        "### รูปแบบไวยากรณ์\n",
        "```python\n",
        "while เงื่อนไข:\n",
        "    คำสั่งที่ต้องการทำซ้ำ\n",
        "```"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### ตัวอย่าง 4.2.1: การหาค่าน้อยที่สุดจากข้อมูล n จำนวน"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 4.2.1: หาค่าน้อยที่สุด min_x จากข้อมูล n จำนวน\n",
        "n = int(input())\n",
        "min_x = int(input())\n",
        "k = 0\n",
        "while k < n - 1:\n",
        "    x = int(input())\n",
        "    if x < min_x:\n",
        "        min_x = x\n",
        "    k += 1\n",
        "print(min_x)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### ตัวอย่าง 4.2.2: การนับจำนวนเลข 0 จากข้อมูลที่แยกด้วย space"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 4.2.2: นับจำนวนเลข 0 จากข้อมูลในบรรทัดเดียวกัน\n",
        "# ตัวอย่างข้อมูลอินพุต: 10 20 3 0 3 0 43 0 3 20 0 2\n",
        "x = input().split()\n",
        "i = 0\n",
        "c = 0\n",
        "while i < len(x):\n",
        "    if int(x[i]) == 0:\n",
        "        c += 1\n",
        "    i += 1\n",
        "print(c)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### ตัวอย่าง 4.2.3: นับสระในข้อความ t โดยใช้ while loop (พัฒนาต่อจากแบบฝึกหัดบทก่อน)"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 4.2.3: อ่านข้อความ t เพื่อนับจำนวนสระ (ทั้งตัวเล็กและตัวใหญ่)\n",
        "t = input()\n",
        "c = 0\n",
        "vowels = \"aeiouAEIOU\"\n",
        "k = 0\n",
        "while k < len(t):\n",
        "    if t[k] in vowels:\n",
        "        c += 1\n",
        "    k += 1\n",
        "print(c)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### แบบฝึกหัด 4-2"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# แบบฝึกหัด 4-2 ข้อที่ 1:\n",
        "# รับจำนวนเต็ม n จาก input เพื่อแสดงจำนวนเต็มคี่ตั้งแต่ 1 ถึงจำนวนคี่ที่ไม่เกิน n (โดยใช้ขณะวน while)\n",
        "n = int(input())\n",
        "i = 1\n",
        "while i <= n:\n",
        "    print(i)\n",
        "    i += 2\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# แบบฝึกหัด 4-2 ข้อที่ 2:\n",
        "# บรรทัดแรกเป็นจำนวนเต็ม n ตามด้วยอีก n บรรทัดเป็นจำนวนเต็ม d0, d1, ..., dn-1 จงหาผลรวมของจำนวนทั้งหมด\n",
        "n = int(input())\n",
        "k = 0\n",
        "s = 0\n",
        "while k < n:\n",
        "    s += int(input())\n",
        "    k += 1\n",
        "print(s)\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# แบบฝึกหัด 4-2 ข้อที่ 3:\n",
        "# รับจำนวนเต็มบรรทัดละจำนวน เพื่อหาผลรวมของจำนวนที่อ่านเข้ามา จนพบจำนวนลบ (ไม่รวมจำนวนลบ)\n",
        "s = 0\n",
        "x = int(input())\n",
        "while x >= 0:\n",
        "    s += x\n",
        "    x = int(input())\n",
        "print(s)\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# แบบฝึกหัด 4-2 ข้อที่ 4:\n",
        "# รับจำนวนเต็มบรรทัดละจำนวน จนถึงบรรทัดสุดท้ายจะเป็นคำว่า \"end\" เพื่อหาผลรวมของจำนวนที่อ่านเข้ามา\n",
        "s = 0\n",
        "x = input()\n",
        "while x != \"end\":\n",
        "    s += int(x)\n",
        "    x = input()\n",
        "print(s)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## 4.3 Bisection (วิธีการแบ่งครึ่งช่วงเพื่อหาคำตอบ)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "Bisection Method เป็นอัลกอริทึมค้นหาหาคำตอบโดยใช้การวนซ้ำ `while` เพื่อแบ่งครึ่งช่วงคำตอบออกเป็นสองส่วนในแต่ละรอบ ทำให้ขอบเขตคำตอบแคบลงเรื่อยๆ จนกระทั่งได้ความถูกต้องตามค่าความคลาดเคลื่อน (Tolerance) ที่ยอมรับได้"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 4.3: การหาค่ารากที่สองของ x โดยใช้วิธี Bisection Search\n",
        "x = 25.0\n",
        "epsilon = 0.00001 # ความคลาดเคลื่อนที่ยอมรับได้\n",
        "low = 0.0\n",
        "high = max(1.0, x)\n",
        "ans = (high + low) / 2.0\n",
        "\n",
        "while abs(ans**2 - x) >= epsilon:\n",
        "    if ans**2 < x:\n",
        "        low = ans\n",
        "    else:\n",
        "        high = ans\n",
        "    ans = (high + low) / 2.0\n",
        "\n",
        "print(\"Square root of\", x, \"is approximately\", ans)\n"
      ]
    },
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
  ],
  "metadata": {
    "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
    },
    "language_info": {
      "codemirror_mode": {
        "name": "ipython",
        "version": 3
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3",
      "version": "3.8.0"
    }
  },
  "nbformat": 4,
  "nbformat_minor": 4
}
'@

$nb = $fullNotebookJson | ConvertFrom-Json
$updatedJson = $nb | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText($notebookPath, $updatedJson, [System.Text.Encoding]::UTF8)

Write-Host "RESTORED ALL SECTIONS 4.1 TO 4.7 SUCCESSFULLY!"
