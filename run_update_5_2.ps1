$notebookPath = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_05_List_Processing\01_Lecture_List_Processing.ipynb"

# Clean PowerShell script to rewrite notebook with updated 5.2
$jsonStr = @'
{
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "# Module 5: List Processing (การประมวลผลลิสต์)\n",
        "\n",
        "ในบทนี้เราจะเรียนรู้เกี่ยวกับการจัดการและประมวลผลข้อมูลโครงสร้างแบบลิสต์ (List) ในภาษา Python ซึ่งเป็นโครงสร้างข้อมูลประเภทลำดับ (Sequence Data Structure) ที่มีความยืดหยุ่นสูง สามารถเก็บข้อมูลได้หลายตัวและหลายชนิดในตัวแปรเดียว"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "## 5.1 Basic List Operation (การดำเนินการพื้นฐานกับลิสต์)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "ลิสต์ (List) คือกลุ่มของข้อมูลที่เรียงต่อกันเป็นลำดับ โดยสมาชิกแต่ละตัวจะมีดัชนี (Index) กำหนดตำแหน่ง เริ่มต้นจากตำแหน่งที่ 0 ลิสต์เป็นข้อมูลประเภท mutable หมายความว่าเราสามารถเปลี่ยนแปลง เพิ่ม หรือลบข้อมูลภายในลิสต์ได้หลังจากสร้างขึ้นมาแล้ว\n",
        "\n",
        "การดำเนินการพื้นฐานกับลิสต์ ได้แก่:\n",
        "1. การสร้างลิสต์ด้วยวงเล็บเหลี่ยม `[]` เช่น `x = []` หรือลิสต์ซ้อนลิสต์ `q = [x, y, 8, z]`\n",
        "2. การหาจำนวนสมาชิกด้วยฟังก์ชัน `len()`\n",
        "3. การเข้าถึงด้วยดัชนีและการตัดช่วง Slicing เช่น `z[1]`, `y[1:3]`\n",
        "4. การทำซ้ำลิสต์ด้วยเครื่องหมาย `*` เช่น `a = [0] * 10`\n",
        "5. การเชื่อมต่อลิสต์ด้วยเครื่องหมาย `+` เช่น `a = a + a`\n",
        "6. การแก้ไขสมาชิกผ่านดัชนี `a[i] = i` และการตรวจสอบสมาชิกด้วยตัวดำเนินการ `in` \n",
        "\n",
        "### ข้อควรระวัง (Common Pitfalls)\n",
        "- การเข้าถึงตำแหน่งที่ไม่มีอยู่จริงจะทำให้เกิดข้อผิดพลาด `IndexError: list index out of range` \n",
        "- การแก้ไขสมาชิกผ่านดัชนี สามารถทำได้เฉพาะตำแหน่งที่มีสมาชิกอยู่แล้วเท่านั้น ไม่สามารถแก้ไขดัชนีที่เกินจากขนาดของลิสต์เพื่อเพิ่มสมาชิกได้"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# 5.1.1 ตัวอย่างการใช้งานการดำเนินการพื้นฐานกับลิสต์\n",
        "x = []\n",
        "y = [2, 3, 4, 5]\n",
        "s = \"9\"\n",
        "t = \"ab\"\n",
        "z = [s, t, s]\n",
        "q = [x, y, 8, z]\n",
        "\n",
        "print(z[1])\n",
        "print(y[1:3])\n",
        "\n",
        "a = [0] * 10\n",
        "a = a + a\n",
        "\n",
        "for i in range(20):\n",
        "    a[i] = i\n",
        "\n",
        "for e in a:\n",
        "    if e % 2 == 0:\n",
        "        print(e)\n",
        "\n",
        "if 21 in a:\n",
        "    print(\"YES\")\n",
        "else:\n",
        "    print(\"NO\")\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### ตัวอย่างการค้นหาข้อมูลในลิสต์แบบขนาน (Parallel Lists Searching)\n",
        "\n",
        "#### ตัวอย่าง 5.1.1: การค้นหาราคาหุ้นจากชื่อหุ้น (Stock Price Lookup)\n",
        "\n",
        "**คำอธิบาย:** รับข้อมูลชื่อหุ้นและราคาในบรรทัดเดียวกัน เช่น `\"KTB 18.9 BBL 176.5 SCB 132.0 KBANK 172.0 TMB 1.8\"` แล้วรับชื่อหุ้นที่ต้องการค้นหาในบรรทัดถัดไป หากพบชื่อหุ้นให้แสดงราคาที่อยู่ถัดไป 1 ตำแหน่ง หากไม่พบให้แสดง `Not found`\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 5.1.1: ค้นหาราคาหุ้นจากชื่อหุ้น\n",
        "x = input().split()\n",
        "s = input()\n",
        "found = False\n",
        "for i in range(len(x)):\n",
        "    if x[i] == s:\n",
        "        print(x[i + 1])\n",
        "        found = True\n",
        "        break\n",
        "if found == False:\n",
        "    print(\"Not found\")\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "#### ตัวอย่าง 5.1.2: การค้นหาราคาสินค้าจากรหัสสินค้า (Product Price Lookup)\n",
        "\n",
        "![ผังงาน 5-1 ข้อ 1](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex05_01_01.png)\n",
        "\n",
        "**คำอธิบาย:** รับข้อมูล 3 บรรทัด บรรทัดแรกเป็นรายการรหัสสินค้า บรรทัดที่สองเป็นรายการราคาของสินค้าตามลำดับ บรรทัดสุดท้ายเป็นรหัสสินค้าที่ต้องการสอบถามราคา หากพบให้แสดงราคาของสินค้านั้น หากไม่พบให้แสดง `Not found`\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 5.1.2: ค้นหาราคาสินค้าจากรหัสสินค้า\n",
        "prod_ids = input().split()\n",
        "prices = input().split()\n",
        "qid = input()\n",
        "found = False\n",
        "for i in range(len(prod_ids)):\n",
        "    if qid == prod_ids[i]:\n",
        "        found = True\n",
        "        break\n",
        "if found:\n",
        "    print(prices[i])\n",
        "else:\n",
        "    print(\"Not found\")\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "#### ตัวอย่าง 5.1.3: การคัดกรองสินค้าตามงบประมาณ (Filter Products by Price)\n",
        "\n",
        "![ผังงาน 5-1 ข้อ 2](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex05_01_02.png)\n",
        "\n",
        "**คำอธิบาย:** รับข้อมูล 3 บรรทัด บรรทัดแรกเป็นรายการรหัสสินค้า บรรทัดที่สองเป็นรายการราคาสินค้า บรรทัดที่สามเป็นงบประมาณราคาสูงสุด ให้แสดงรหัสสินค้าทั้งหมดที่มีราคาไม่เกินงบประมาณ บรรทัดละรหัสเรียงตามลำดับเดิม หากไม่มีสินค้าใดราคาอยู่ในงบประมาณ ให้แสดง `Not found`\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 5.1.3: แสดงรหัสสินค้าที่ราคาไม่เกินงบประมาณ\n",
        "prod_ids = input().split()\n",
        "x = input().split()\n",
        "prices = [0.0] * len(x)\n",
        "for i in range(len(x)):\n",
        "    prices[i] = float(x[i])\n",
        "qprice = float(input())\n",
        "found = False\n",
        "for i in range(len(prod_ids)):\n",
        "    if prices[i] <= qprice:\n",
        "        print(prod_ids[i])\n",
        "        found = True\n",
        "if not found:\n",
        "    print(\"Not found\")\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## 5.2 List Method (เมธอดของลิสต์)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "เมธอด (Method) คือฟังก์ชันการทำงานประจำตัวแปรลิสต์ ช่วยให้จัดการข้อมูลภายในลิสต์ได้สะดวกยิ่งขึ้น เมธอดพื้นฐานที่สำคัญได้แก่:\n",
        "\n",
        "- `append(x)` : เพิ่มสมาชิก `x` ต่อท้ายลิสต์\n",
        "- `remove(x)` : ลบสมาชิกตัวแรกที่มีค่าเท่ากับ `x` ออกจากลิสต์\n",
        "- `insert(i, x)` : แทรกสมาชิก `x` ลงในตำแหน่งดัชนี `i`\n",
        "- `pop(i)` : ลบและคืนค่าสมาชิกในตำแหน่งดัชนี `i` (หากไม่ระบุ `i` จะลบตัวสุดท้าย)\n",
        "- `index(x)` : คืนค่าดัชนีตำแหน่งแรกที่พบ `x` ในลิสต์\n",
        "- `sort()` : จัดเรียงสมาชิกในลิสต์จากน้อยไปมาก\n",
        "- `x in d` : ตัวดำเนินการตรวจสอบว่ามี `x` อยู่ในลิสต์ `d` หรือไม่ (คืนค่า `True`/`False`)\n",
        "\n",
        "![ภาพรวมการทำงานของ List Methods](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex05_02_03.png)\n",
        "\n",
        "### ข้อควรระวัง (Common Pitfalls)\n",
        "- การเรียกใช้ `d.remove(e)` หรือ `d.index(e)` หากไม่พบค่า `e` อยู่ในลิสต์ `d` จะเกิดข้อผิดพลาด `ValueError` ทันที ดังนั้นควรใช้ตัวดำเนินการ `if e in d:` เพื่อตรวจสอบก่อนเสมอ"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# 5.2.1 ตัวอย่างภาพรวมการทำงานของ List Methods\n",
        "d = []\n",
        "for i in range(5):\n",
        "    d.append(10 * i)  # [0, 10, 20, 30, 40] ต่อท้ายลิสต์\n",
        "print(\"หลัง append:\", d)\n",
        "\n",
        "d.remove(20)  # [0, 10, 30, 40] ลบเลข 20\n",
        "print(\"หลัง remove(20):\", d)\n",
        "\n",
        "d.insert(2, 99)  # [0, 10, 99, 30, 40] แทรก 99 ที่ index 2\n",
        "print(\"หลัง insert(2, 99):\", d)\n",
        "\n",
        "d.insert(-1, 7)  # [0, 10, 99, 30, 7, 40]\n",
        "print(\"หลัง insert(-1, 7):\", d)\n",
        "\n",
        "x = d.pop(1)  # ลบสมาชิกตำแหน่งที่ 1 (10)\n",
        "print(\"pop(1) ได้ค่า:\", x, \"ลิสต์คงเหลือ:\", d)\n",
        "\n",
        "x = d.pop(-3)  # ลบสมาชิกตำแหน่งที่ -3 (30)\n",
        "print(\"pop(-3) ได้ค่า:\", x, \"ลิสต์คงเหลือ:\", d)\n",
        "\n",
        "j = d.index(99)  # ค้นหาตำแหน่งของ 99\n",
        "print(\"d.index(99) ->\", j)\n",
        "\n",
        "d.sort()  # จัดเรียงสมาชิกในลิสต์\n",
        "print(\"หลัง sort():\", d)\n",
        "\n",
        "b = 40 in d  # ตรวจสอบว่า 40 อยู่ใน d หรือไม่\n",
        "print(\"40 in d ->\", b)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "### ตัวอย่างการประยุกต์ใช้งาน List Methods\n",
        "\n",
        "#### ตัวอย่าง 5.2.1: การสร้างลิสต์ด้วย append()\n",
        "\n",
        "**ข้อ 1: สร้างลิสต์ผลคูณกำลังสอง**  \n",
        "รับจำนวนเต็ม `n` จากผู้ใช้ แล้วสร้างลิสต์เก็บค่า [1^2, 2^2, 3^2, ..., n^2]\n",
        "\n",
        "**ข้อ 2: การกลับลำดับสตริงในลิสต์**  \n",
        "อ่านลิสต์ของสตริงจากผู้ใช้ แล้วสร้างลิสต์ใหม่ที่มีขนาดเท่าเดิมโดยเก็บสตริงที่กลับลำดับอักขระ เช่น `[\"python\", \"java\"]` -> `[\"nohtyp\", \"avaj\"]`\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 5.2.1 ข้อที่ 1: สร้างลิสต์ผลคูณกำลังสอง 1 ถึง n\n",
        "n = int(input())\n",
        "a = []\n",
        "for i in range(1, n + 1):\n",
        "    a.append(i**2)\n",
        "print(\"ลิสต์ผลคูณกำลังสอง:\", a)\n",
        "\n",
        "# ตัวอย่าง 5.2.1 ข้อที่ 2: กลับลำดับอักขระในสตริงสมาชิก\n",
        "words = input().split()\n",
        "b = []\n",
        "for i in range(len(words)):\n",
        "    b.append(words[i][::-1])\n",
        "print(\"ลิสต์สตริงกลับลำดับ:\", b)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "#### ตัวอย่าง 5.2.2: การลบสมาชิกและการหาค่ามัธยฐาน (Median)\n",
        "\n",
        "**ข้อ 1: ตรวจสอบและลบสมาชิกจากลิสต์**  \n",
        "รับตัวเลข 5 จำนวนแรกใส่ลิสต์ `d` จากนั้นรับตัวเลขอีก 5 จำนวนถัดมา หากพบใน `d` ให้ลบออกด้วย `d.remove()` แล้วแสดงลิสต์ ถ้าไม่พบให้แสดง `Not found`\n",
        "\n",
        "**ข้อ 2: การหาค่ามัธยฐาน (Median)**  \n",
        "รับชุดตัวเลขในบรรทัดเดียว นำมาแปลงเป็นทศนิยมใส่ลิสต์ เรียงลำดับด้วย `.sort()` แล้วหาค่ากลาง (มัธยฐาน)\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 5.2.2 ข้อที่ 1: ตรวจสอบและลบสมาชิกจากลิสต์\n",
        "d = []\n",
        "for i in range(5):\n",
        "    k = int(input())\n",
        "    d.append(k)\n",
        "\n",
        "for i in range(5):\n",
        "    k = int(input())\n",
        "    if k in d:\n",
        "        d.remove(k)\n",
        "        print(d)\n",
        "    else:\n",
        "        print(\"Not found\")\n",
        "\n",
        "# ตัวอย่าง 5.2.2 ข้อที่ 2: หาค่ามัธยฐาน (Median) ด้วย .sort()\n",
        "x = input().split()\n",
        "data = []\n",
        "for e in x:\n",
        "    data.append(float(e))\n",
        "data.sort()\n",
        "\n",
        "n = len(data)\n",
        "if n % 2 == 1:\n",
        "    median = data[n // 2]\n",
        "else:\n",
        "    median = (data[n // 2 - 1] + data[n // 2]) / 2.0\n",
        "print(\"ค่ามัธยฐาน:\", median)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "#### ตัวอย่าง 5.2.3: โปรแกรมคำสั่งจัดการลิสต์ (List Command Dispatcher)\n",
        "\n",
        "**คำอธิบาย:** มีลิสต์เริ่มต้น `x = ['a', 'bb', 'ccc', 'd', 'e']` รับคำสั่งในการจัดการลิสต์ ได้แก่:\n",
        "- `A d` : นำข้อมูล `d` ไปต่อท้ายลิสต์ `x` (`append`)\n",
        "- `I j d` : แทรก `d` ที่ตำแหน่ง index `j` ใน `x` (`insert`)\n",
        "- `R data` : ลบ `data` ตัวแรกออกจากลิสต์ `x` (`remove`)\n",
        "- `P j` : ลบตัวที่ตำแหน่ง index `j` ออกจาก `x` (`pop`)\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 5.2.3: โปรแกรมจัดการลิสต์ตามคำสั่ง\n",
        "x = ['a', 'bb', 'ccc', 'd', 'e']\n",
        "c = input().split()\n",
        "\n",
        "if c[0] == \"A\":\n",
        "    x.append(c[1])\n",
        "elif c[0] == \"I\":\n",
        "    x.insert(int(c[1]), c[2])\n",
        "elif c[0] == \"R\":\n",
        "    x.remove(c[1])\n",
        "elif c[0] == \"P\":\n",
        "    x.pop(int(c[1]))\n",
        "\n",
        "print(\"ลิสต์หลังทำคำสั่ง:\", x)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "#### ตัวอย่าง 5.2.4: การค้นหาราคาสินค้าด้วย in และ index()\n",
        "\n",
        "![ผังงาน 5-2 ข้อ 5](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex05_02_05.png)\n",
        "\n",
        "**คำอธิบาย:** รับข้อมูล 3 บรรทัด\n",
        "- บรรทัดแรก: รายการรหัสสินค้า (`prod_ids`)\n",
        "- บรรทัดที่สอง: รายการราคา (`prices`)\n",
        "- บรรทัดที่สาม: รหัสสินค้าที่สอบถาม (`qid`)\n",
        "\n",
        "ใช้คำสั่ง `if qid in prod_ids:` เพื่อตรวจสอบก่อน หากพบในลิสต์ให้หาตำแหน่งด้วย `i = prod_ids.index(qid)` แล้วแสดงราคา `prices[i]` หากไม่พบให้แสดง `Not found`\n"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# ตัวอย่าง 5.2.4: ค้นหาราคาสินค้าด้วย in และ index()\n",
        "prod_ids = input().split()\n",
        "prices = input().split()\n",
        "qid = input()\n",
        "\n",
        "if qid in prod_ids:\n",
        "    i = prod_ids.index(qid)\n",
        "    print(prices[i])\n",
        "else:\n",
        "    print(\"Not found\")\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## 5.3 Reading Data into a List (การรับข้อมูลเข้าสู่ลิสต์)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "ในทางปฏิบัติ โปรแกรมมักจะต้องรับข้อมูลจำนวนมากจากผู้ใช้หรือไฟล์เข้าสู่ลิสต์ รูปแบบการรับข้อมูลที่ใช้บ่อยในภาษา Python ได้แก่:\n",
        "\n",
        "1. **การรับข้อมูลทีละบรรทัดด้วยลูป:** เหมาะกับกรณีที่ทราบจำนวนข้อมูลแน่ชัด หรือรับจนกว่าจะพบค่าหยุด (Sentinel Value)\n",
        "2. **การรับข้อมูลบรรทัดเดียวแยกด้วยช่องว่าง:** ใช้ฟังก์ชัน `input().split()` แล้วแปลงเป็นประเภทข้อมูลที่ต้องการด้วย List Comprehension\n",
        "\n",
        "### ข้อควรระวัง (Common Pitfalls)\n",
        "- ข้อมูลที่ได้จาก `input().split()` จะเป็นสตริงเสมอ หากต้องการนำไปคำนวณทางคณิตศาสตร์ ต้องแปลงเป็น `int` หรือ `float` ก่อนเสมอ"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# 5.3 ตัวอย่างการรับข้อมูลเข้าสู่ลิสต์\n",
        "\n",
        "# รูปแบบที่ 1: รับข้อมูลบรรทัดเดียวหลายจำนวน (คั่นด้วยช่องว่าง)\n",
        "# ตัวอย่างอินพุต: 10 20 30 40 50\n",
        "raw_input = input(\"ป้อนตัวเลขแยกด้วยช่องว่าง: \")\n",
        "data_list = [int(x) for x in raw_input.split()]\n",
        "print(\"ลิสต์ตัวเลขที่รับเข้ามา:\", data_list)\n",
        "\n",
        "# รูปแบบที่ 2: รับข้อมูล n จำนวน ทีละบรรทัด\n",
        "n = int(input(\"ป้อนจำนวนสมาชิกที่ต้องการรับ: \"))\n",
        "items = []\n",
        "for i in range(n):\n",
        "    val = float(input(f\"ป้อนข้อมูลตัวที่ {i + 1}: \"))\n",
        "    items.append(val)\n",
        "\n",
        "print(\"ลิสต์ทศนิยมที่ได้:\", items)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## 5.4 Accessing Elements One-by-One (การเข้าถึงสมาชิกทีละตัว)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "การวนลูปเพื่อเข้าถึงสมาชิกแต่ละตัวในลิสต์สามารถทำได้ 2 วิธีหลัก:\n",
        "\n",
        "1. **Member-based Iteration (`for item in list`):** เป็นวิธีที่อ่านง่ายที่สุด ดึงค่าสมาชิกแต่ละตัวออกมาทีละตัวโดยตรง\n",
        "2. **Index-based Iteration (`for i in range(len(list))`):** วนลูปตามดัชนีตำแหน่ง เหมาะสำหรับกรณีที่ต้องการทราบตำแหน่งอ้างอิง หรือต้องการแก้ไขค่าสมาชิกภายในลิสต์เดิม\n",
        "\n",
        "### ข้อควรระวัง (Common Pitfalls)\n",
        "- การวนลูปแบบ `for item in list` แล้วทำการแก้ไขตัวแปร `item` ภายในลูป จะไม่มีผลเปลี่ยนแปลงค่าสมาชิกภายในลิสต์เดิม หากต้องการแก้ไขค่าในลิสต์ ต้องใช้วิธีวนลูปตามดัชนี `list[i] = new_value` "
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# 5.4 ตัวอย่างการเข้าถึงสมาชิกทีละตัว\n",
        "\n",
        "scores = [85, 92, 78, 64, 95]\n",
        "\n",
        "# วิธีที่ 1: เข้าถึงสมาชิกโดยตรง (เพื่อการอ่านค่า)\n",
        "print(\"--- รายชื่อคะแนน ---\")\n",
        "for s in scores:\n",
        "    print(\"คะแนน:\", s)\n",
        "\n",
        "# วิธีที่ 2: เข้าถึงผ่านดัชนี (เพื่อแก้ไขค่า เช่น เพิ่มคะแนนฟรี 5 คะแนน)\n",
        "print(\"\\n--- ปรับเพิ่มคะแนน 5 คะแนน ---\")\n",
        "for i in range(len(scores)):\n",
        "    scores[i] = scores[i] + 5\n",
        "\n",
        "print(\"คะแนนหลังปรับปรุง:\", scores)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## 5.5 Accessing Consecutive Elements (การเข้าถึงสมาชิกแบบช่วงต่อเนื่อง / Slicing)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "การเลือกตัดเฉพาะบางส่วนของลิสต์ออกมาเป็นลิสต์ใหม่ เรียกว่า Slicing โดยใช้ไวยากรณ์:\n",
        "\n",
        "`list_name[start:stop:step]`\n",
        "\n",
        "- `start` : ดัชนีเริ่มต้น (รวมตำแหน่งนี้)\n",
        "- `stop` : ดัชนีสิ้นสุด (ไม่รวมตำแหน่งนี้ จะทำถึงก่อนดัชนี `stop`)\n",
        "- `step` : ช่วงระยะการข้าม (หากเป็นค่าลบจะวนจากขวาไปซ้าย)\n",
        "\n",
        "### ข้อควรระวัง (Common Pitfalls)\n",
        "- ตำแหน่ง `stop` จะไม่ถูกนำมารวมในผลลัพธ์ เช่น `data[1:4]` จะได้สมาชิกตำแหน่งที่ 1, 2 และ 3 เท่านั้น\n",
        "- การใช้ Slicing จะเป็นการสร้างลิสต์ใหม่ (Shallow Copy) ไม่ได้เป็นการแก้ไขลิสต์เดิม"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# 5.5 ตัวอย่างการตัดช่วงข้อมูลในลิสต์ (Slicing)\n",
        "\n",
        "data = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]\n",
        "\n",
        "# ดึงสมาชิกตำแหน่งที่ 2 ถึง 5 (ได้ตำแหน่ง 2, 3, 4)\n",
        "sub_1 = data[2:5]\n",
        "print(\"data[2:5] ->\", sub_1)\n",
        "\n",
        "# ดึงสมาชิกตั้งแต่เริ่มต้น ถึงตำแหน่งที่ 4\n",
        "sub_2 = data[:4]\n",
        "print(\"data[:4] ->\", sub_2)\n",
        "\n",
        "# ดึงสมาชิกตั้งแต่ตำแหน่งที่ 5 ไปจนถึงตัวสุดท้าย\n",
        "sub_3 = data[5:]\n",
        "print(\"data[5:] ->\", sub_3)\n",
        "\n",
        "# ดึงสมาชิกโดยข้ามทีละ 2 ตำแหน่ง\n",
        "sub_4 = data[::2]\n",
        "print(\"data[::2] ->\", sub_4)\n",
        "\n",
        "# กลับทิศทางลิสต์จากขวาไปซ้าย\n",
        "reversed_data = data[::-1]\n",
        "print(\"data[::-1] ->\", reversed_data)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## 5.6 List Searching (การค้นหาข้อมูลในลิสต์)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "การตรวจสอบและค้นหาข้อมูลภายในลิสต์สามารถทำได้หลายระดับ:\n",
        "\n",
        "1. **การตรวจสอบการมีอยู่:** ใช้ตัวดำเนินการ `in` หรือ `not in` คืนค่าเป็น `True` หรือ `False` \n",
        "2. **การหาตำแหน่ง index:** ใช้เมธอด `index(x)`\n",
        "3. **การค้นหาแบบกำหนดเงื่อนไขเอง:** ใช้การวนลูป `for` หรือ `while` ร่วมกับคำสั่ง `break` เมื่อพบข้อมูลที่ต้องการ\n",
        "\n",
        "### ข้อควรระวัง (Common Pitfalls)\n",
        "- ควรใช้ `in` ตรวจสอบก่อนเรียกใช้ `list.index(x)` เพื่อป้องกันโปรแกรมหยุดทำงานจากข้อผิดพลาด `ValueError` เมื่อไม่พบข้อมูล"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# 5.6 ตัวอย่างการค้นหาข้อมูลในลิสต์\n",
        "\n",
        "fruits = [\"apple\", \"banana\", \"cherry\", \"mango\", \"orange\"]\n",
        "target = \"cherry\"\n",
        "\n",
        "# 1. การตรวจสอบด้วย in\n",
        "if target in fruits:\n",
        "    pos = fruits.index(target)\n",
        "    print(f\"พบ {target} ในลิสต์ ที่ตำแหน่งดัชนี {pos}\")\n",
        "else:\n",
        "    print(f\"ไม่พบ {target} ในลิสต์\")\n",
        "\n",
        "# 2. การค้นหาตัวเลขแรกที่ตรงตามเงื่อนไข (เช่น ค้นหาตัวเลขคู่ตัวแรกที่มากกว่า 20)\n",
        "numbers = [15, 7, 22, 19, 34, 11]\n",
        "found_val = None\n",
        "\n",
        "for num in numbers:\n",
        "    if num > 20 and num % 2 == 0:\n",
        "        found_val = num\n",
        "        break  # หยุดค้นหาทันทีเมื่อเจอตัวแรก\n",
        "\n",
        "print(\"ตัวเลขคู่ตัวแรกที่มากกว่า 20 คือ:\", found_val)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## 5.7 List Sorting (การเรียงลำดับข้อมูลในลิสต์)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "การเรียงลำดับข้อมูลในภาษา Python มี 2 วิธีหลักที่มีลักษณะการทำงานแตกต่างกัน:\n",
        "\n",
        "1. **`list.sort()` (In-place Sort):** จัดเรียงข้อมูลในตัวแปรลิสต์เดิมทันที ไม่สร้างลิสต์ใหม่ และไม่คืนค่ากลับมา (`None`)\n",
        "2. **`sorted(iterable)` (Function Sort):** รับลิสต์เข้าไปเรียงลำดับ แล้วคืนค่าเป็นลิสต์ใหม่ โดยที่ลิสต์เดิมไม่เปลี่ยนแปลง\n",
        "\n",
        "ทั้งสองแบบสามารถกำหนดพารามิเตอร์ `reverse=True` เพื่อเรียงจากมากไปน้อยได้\n",
        "\n",
        "### ข้อควรระวัง (Common Pitfalls)\n",
        "- สตริงและตัวเลขต้องไม่ปะปนกันในลิสต์เดียวกันขณะทำการเรียงลำดับ มิฉะนั้นจะเกิด `TypeError` \n",
        "- การเรียงลำดับสตริงจะใช้ค่ารหัส ASCII/Unicode ตัวอักษรภาษาอังกฤษตัวใหญ่จะถูกจัดเรียงมาก่อนตัวเล็กเสมอ (เช่น `\"Apple\"` มาก่อน `\"banana\"`)"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# 5.7 ตัวอย่างการเรียงลำดับข้อมูลในลิสต์\n",
        "\n",
        "nums = [42, 12, 89, 7, 25]\n",
        "\n",
        "# แบบที่ 1: ใช้ sorted() เพื่อสร้างลิสต์ใหม่\n",
        "sorted_nums = sorted(nums)\n",
        "print(\"ลิสต์เดิมคงเดิม:\", nums)\n",
        "print(\"ลิสต์ใหม่ที่เรียงจากน้อยไปมาก:\", sorted_nums)\n",
        "\n",
        "# แบบที่ 2: ใช้ list.sort() เพื่อเรียงลำดับในลิสต์เดิม\n",
        "nums.sort()\n",
        "print(\"ลิสต์เดิมหลังเรียก .sort():\", nums)\n",
        "\n",
        "# เรียงจากมากไปน้อย (Descending order)\n",
        "nums.sort(reverse=True)\n",
        "print(\"ลิสต์หลังเรียงจากมากไปน้อย:\", nums)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## 5.8 Split & Join (การแยกและรวมสตริงกับลิสต์)\n",
        "\n",
        "### อธิบายแนวคิด (Concept Explanation)\n",
        "การแปลงข้อมูลระหว่าง สตริง (String) และ ลิสต์ของสตริง (List of Strings) เป็นทักษะสำคัญในการจัดการข้อมูลข้อความ:\n",
        "\n",
        "1. **`str.split(sep)`:** แปลงสตริงให้กลายเป็นลิสต์ โดยใช้ตัวคั่น `sep` (หากไม่ระบุจะใช้อักขระช่องว่าง/เว้นวรรค)\n",
        "2. **`sep.join(list)`:** รวมสมาชิกในลิสต์ของสตริงเข้าด้วยกันให้เป็นสตริงเดียว โดยคั่นด้วย `sep` \n",
        "\n",
        "### ข้อควรระวัง (Common Pitfalls)\n",
        "- เมธอด `join()` จะต้องใช้กับลิสต์ที่สมาชิกทุกตัวเป็น **สตริง (String)** เท่านั้น หากสมาชิกในลิสต์เป็นตัวเลข ต้องแปลงเป็นสตริงก่อนด้วย List Comprehension เช่น `\"\".join([str(x) for x in list])`"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "# 5.8 ตัวอย่างการใช้งาน split และ join\n",
        "\n",
        "# 1. การใช้ split() เพื่อเปลี่ยนข้อความให้เป็นลิสต์\n",
        "sentence = \"python,java,cpp,javascript\"\n",
        "tech_list = sentence.split(\",\")\n",
        "print(\"ผลจาก split():\", tech_list)\n",
        "\n",
        "# 2. การใช้ join() เพื่อรวมลิสต์กลับเป็นข้อความ\n",
        "new_sentence = \" | \".join(tech_list)\n",
        "print(\"ผลจาก join():\", new_sentence)\n",
        "\n",
        "# 3. การรวมลิสต์ตัวเลขเป็นข้อความ (ต้องแปลงตัวเลขเป็นสตริงก่อน)\n",
        "num_list = [2026, 8, 11]\n",
        "date_str = \"-\".join([str(n) for n in num_list])\n",
        "print(\"วันที่ในรูปแบบสตริง:\", date_str)\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "---\n",
        "\n",
        "## แบบฝึกหัด (Exercises)\n",
        "\n",
        "*(เนื้อหาแบบฝึกหัดสำหรับผู้เรียนเพื่อทดสอบความรู้ความเข้าใจใน Module 5)*"
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

$nb = $jsonStr | ConvertFrom-Json
$jsonOut = $nb | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText($notebookPath, $jsonOut, [System.Text.Encoding]::UTF8)

Write-Host "REBUILT MODULE 05 NOTEBOOK WITH UPDATED SECTION 5.2 SUCCESSFULLY!"
