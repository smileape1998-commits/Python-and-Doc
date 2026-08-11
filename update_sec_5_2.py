import json

notebook_path = r"c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_05_List_Processing\01_Lecture_List_Processing.ipynb"

with open(notebook_path, "r", encoding="utf-8") as f:
    nb = json.load(f)

new_52_cells = [
    {
        "cell_type": "markdown",
        "metadata": {},
        "source": [
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
        "execution_count": None,
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
            "รับจำนวนเต็ม `n` จากผู้ใช้ แล้วสร้างลิสต์เก็บค่า $[1^2, 2^2, 3^2, \\dots, n^2]$\n",
            "\n",
            "**ข้อ 2: การกลับลำดับสตริงในลิสต์**  \n",
            "อ่านลิสต์ของสตริงจากผู้ใช้ แล้วสร้างลิสต์ใหม่ที่มีขนาดเท่าเดิมโดยเก็บสตริงที่กลับลำดับอักขระ เช่น `[\"python\", \"java\"]` $\\rightarrow$ `[\"nohtyp\", \"avaj\"]`\n"
        ]
    },
    {
        "cell_type": "code",
        "execution_count": None,
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
        "execution_count": None,
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
        "execution_count": None,
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
        "execution_count": None,
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
    }
]

idx_52_start = -1
idx_53_start = -1

for i, cell in enumerate(nb["cells"]):
    src = "".join(cell.get("source", []))
    if "5.2 List Method" in src:
        idx_52_start = i
    elif "5.3 Reading Data into a List" in src:
        idx_53_start = i

if idx_52_start != -1 and idx_53_start != -1:
    updated_cells = nb["cells"][:idx_52_start] + new_52_cells + nb["cells"][idx_53_start:]
    nb["cells"] = updated_cells

with open(notebook_path, "w", encoding="utf-8") as f:
    json.dump(nb, f, ensure_ascii=False, indent=1)

print("UPDATED SECTION 5.2 SUCCESSFULLY!")
