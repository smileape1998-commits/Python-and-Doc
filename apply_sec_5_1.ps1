$notebookPath = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_05_List_Processing\01_Lecture_List_Processing.ipynb"

# Pure PowerShell JSON update
$rawJson = [System.IO.File]::ReadAllText($notebookPath, [System.Text.Encoding]::UTF8)
$nb = $rawJson | ConvertFrom-Json

$sec51_md1 = @(
  "## 5.1 Basic List Operation (การดำเนินการพื้นฐานกับลิสต์)`n",
  "`n",
  "### อธิบายแนวคิด (Concept Explanation)`n",
  "ลิสต์ (List) คือกลุ่มของข้อมูลที่เรียงต่อกันเป็นลำดับ โดยสมาชิกแต่ละตัวจะมีดัชนี (Index) กำหนดตำแหน่ง เริ่มต้นจากตำแหน่งที่ 0 ลิสต์เป็นข้อมูลประเภท mutable หมายความว่าเราสามารถเปลี่ยนแปลง เพิ่ม หรือลบข้อมูลภายในลิสต์ได้หลังจากสร้างขึ้นมาแล้ว`n",
  "`n",
  "การดำเนินการพื้นฐานกับลิสต์ ได้แก่:`n",
  "1. การสร้างลิสต์ด้วยวงเล็บเหลี่ยม `[]` เช่น `x = []` หรือลิสต์ซ้อนลิสต์ `q = [x, y, 8, z]``n",
  "2. การหาจำนวนสมาชิกด้วยฟังก์ชัน `len()``n",
  "3. การเข้าถึงด้วยดัชนีและการตัดช่วง Slicing เช่น `z[1]`, `y[1:3]``n",
  "4. การทำซ้ำลิสต์ด้วยเครื่องหมาย `*` เช่น `a = [0] * 10``n",
  "5. การเชื่อมต่อลิสต์ด้วยเครื่องหมาย `+` เช่น `a = a + a``n",
  "6. การแก้ไขสมาชิกผ่านดัชนี `a[i] = i` และการตรวจสอบสมาชิกด้วยตัวดำเนินการ `in``n",
  "`n",
  "### ข้อควรระวัง (Common Pitfalls)`n",
  "- การเข้าถึงตำแหน่งที่ไม่มีอยู่จริงจะทำให้เกิดข้อผิดพลาด `IndexError: list index out of range``n",
  "- การแก้ไขสมาชิกผ่านดัชนี สามารถทำได้เฉพาะตำแหน่งที่มีสมาชิกอยู่แล้วเท่านั้น ไม่สามารถแก้ไขดัชนีที่เกินจากขนาดของลิสต์เพื่อเพิ่มสมาชิกได้"
)

$sec51_code1 = @(
  "# 5.1.1 ตัวอย่างการใช้งานการดำเนินการพื้นฐานกับลิสต์`n",
  "x = []`n",
  "y = [2, 3, 4, 5]`n",
  "s = `"9`"`n",
  "t = `"ab`"`n",
  "z = [s, t, s]`n",
  "q = [x, y, 8, z]`n",
  "`n",
  "print(z[1])`n",
  "print(y[1:3])`n",
  "`n",
  "a = [0] * 10`n",
  "a = a + a`n",
  "`n",
  "for i in range(20):`n",
  "    a[i] = i`n",
  "`n",
  "for e in a:`n",
  "    if e % 2 == 0:`n",
  "        print(e)`n",
  "`n",
  "if 21 in a:`n",
  "    print(`"YES`")`n",
  "else:`n",
  "    print(`"NO`")`n"
)

$sec51_md2 = @(
  "### ตัวอย่างการค้นหาข้อมูลในลิสต์แบบขนาน (Parallel Lists Searching)`n",
  "`n",
  "#### ตัวอย่าง 5.1.1: การค้นหาราคาหุ้นจากชื่อหุ้น (Stock Price Lookup)`n",
  "`n",
  "**คำอธิบาย:** รับข้อมูลชื่อหุ้นและราคาในบรรทัดเดียวกัน แล้วรับชื่อหุ้นที่ต้องการค้นหาในบรรทัดถัดไป หากพบชื่อหุ้นให้แสดงราคาที่อยู่ถัดไป 1 ตำแหน่ง หากไม่พบให้แสดง `Not found``n"
)

$sec51_code2 = @(
  "# ตัวอย่าง 5.1.1: ค้นหาราคาหุ้นจากชื่อหุ้น`n",
  "x = input().split()`n",
  "s = input()`n",
  "found = False`n",
  "for i in range(len(x)):`n",
  "    if x[i] == s:`n",
  "        print(x[i + 1])`n",
  "        found = True`n",
  "        break`n",
  "if found == False:`n",
  "    print(`"Not found`")`n"
)

$sec51_md3 = @(
  "#### ตัวอย่าง 5.1.2: การค้นหาราคาสินค้าจากรหัสสินค้า (Product Price Lookup)`n",
  "`n",
  "![ผังงาน 5-1 ข้อ 1](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex05_01_01.png)`n",
  "`n",
  "**คำอธิบาย:** รับข้อมูล 3 บรรทัด บรรทัดแรกเป็นรายการรหัสสินค้า บรรทัดที่สองเป็นรายการราคาของสินค้าตามลำดับ บรรทัดสุดท้ายเป็นรหัสสินค้าที่ต้องการสอบถามราคา หากพบให้แสดงราคาของสินค้านั้น หากไม่พบให้แสดง `Not found``n"
)

$sec51_code3 = @(
  "# ตัวอย่าง 5.1.2: ค้นหาราคาสินค้าจากรหัสสินค้า`n",
  "prod_ids = input().split()`n",
  "prices = input().split()`n",
  "qid = input()`n",
  "found = False`n",
  "for i in range(len(prod_ids)):`n",
  "    if qid == prod_ids[i]:`n",
  "        found = True`n",
  "        break`n",
  "if found:`n",
  "    print(prices[i])`n",
  "else:`n",
  "    print(`"Not found`")`n"
)

$sec51_md4 = @(
  "#### ตัวอย่าง 5.1.3: การคัดกรองสินค้าตามงบประมาณ (Filter Products by Price)`n",
  "`n",
  "![ผังงาน 5-1 ข้อ 2](https://www.cp.eng.chula.ac.th/~somchai/python101/images/ex05_01_02.png)`n",
  "`n",
  "**คำอธิบาย:** รับข้อมูล 3 บรรทัด บรรทัดแรกเป็นรายการรหัสสินค้า บรรทัดที่สองเป็นรายการราคาสินค้า บรรทัดที่สามเป็นงบประมาณราคาสูงสุด ให้แสดงรหัสสินค้าทั้งหมดที่มีราคาไม่เกินงบประมาณ บรรทัดละรหัสเรียงตามลำดับเดิม หากไม่มีสินค้าใดราคาอยู่ในงบประมาณ ให้แสดง `Not found``n"
)

$sec51_code4 = @(
  "# ตัวอย่าง 5.1.3: แสดงรหัสสินค้าที่ราคาไม่เกินงบประมาณ`n",
  "prod_ids = input().split()`n",
  "x = input().split()`n",
  "prices = [0.0] * len(x)`n",
  "for i in range(len(x)):`n",
  "    prices[i] = float(x[i])`n",
  "qprice = float(input())`n",
  "found = False`n",
  "for i in range(len(prod_ids)):`n",
  "    if prices[i] <= qprice:`n",
  "        print(prod_ids[i])`n",
  "        found = True`n",
  "if not found:`n",
  "    print(`"Not found`")`n"
)

$cell_md1 = [PSCustomObject]@{ cell_type = "markdown"; metadata = [PSCustomObject]@{}; source = $sec51_md1 }
$cell_code1 = [PSCustomObject]@{ cell_type = "code"; execution_count = $null; metadata = [PSCustomObject]@{}; outputs = @(); source = $sec51_code1 }
$cell_md2 = [PSCustomObject]@{ cell_type = "markdown"; metadata = [PSCustomObject]@{}; source = $sec51_md2 }
$cell_code2 = [PSCustomObject]@{ cell_type = "code"; execution_count = $null; metadata = [PSCustomObject]@{}; outputs = @(); source = $sec51_code2 }
$cell_md3 = [PSCustomObject]@{ cell_type = "markdown"; metadata = [PSCustomObject]@{}; source = $sec51_md3 }
$cell_code3 = [PSCustomObject]@{ cell_type = "code"; execution_count = $null; metadata = [PSCustomObject]@{}; outputs = @(); source = $sec51_code3 }
$cell_md4 = [PSCustomObject]@{ cell_type = "markdown"; metadata = [PSCustomObject]@{}; source = $sec51_md4 }
$cell_code4 = [PSCustomObject]@{ cell_type = "code"; execution_count = $null; metadata = [PSCustomObject]@{}; outputs = @(); source = $sec51_code4 }

$new51 = @($cell_md1, $cell_code1, $cell_md2, $cell_code2, $cell_md3, $cell_code3, $cell_md4, $cell_code4)

$idx52 = -1
for ($i = 0; $i -lt $nb.cells.Count; $i++) {
    $src = $nb.cells[$i].source -join ""
    if ($src -match "5.2 List Method") {
        $idx52 = $i
        break
    }
}

$updatedCells = @($nb.cells[0]) + $new51
for ($j = $idx52; $j -lt $nb.cells.Count; $j++) {
    $updatedCells += $nb.cells[$j]
}

$nb.cells = $updatedCells
$jsonOut = $nb | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText($notebookPath, $jsonOut, [System.Text.Encoding]::UTF8)

Write-Host "APPLIED SECTION 5.1 CLEANLY!"
