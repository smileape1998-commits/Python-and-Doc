$baseDir = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_09_Nested_Structure"
$lecDir = Join-Path $baseDir "Lectures"

if (-not (Test-Path $lecDir)) {
    New-Item -ItemType Directory -Path $lecDir -Force | Out-Null
}

function Save-Notebook($filename, $cells) {
    $outNb = [ordered]@{
        cells          = $cells
        metadata       = [ordered]@{
            kernelspec    = [ordered]@{
                display_name = "Python 3"
                language     = "python"
                name         = "python3"
            }
            language_info = [ordered]@{
                name    = "python"
                version = "3.8.0"
            }
        }
        nbformat       = 4
        nbformat_minor = 4
    }
    $outPath = Join-Path $lecDir $filename
    $jsonStr = $outNb | ConvertTo-Json -Depth 100
    [System.IO.File]::WriteAllText($outPath, $jsonStr, [System.Text.Encoding]::UTF8)
    Write-Host "Created $outPath"
}

# 9.1
Save-Notebook "9_1_Nested_While_Loop.ipynb" @(
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @(
            "## 9.1 Nested while Loop (คำสั่ง while แบบซ้อน)`n",
            "`n",
            "### อธิบายแนวคิด (Concept Explanation)`n",
            "Nested while Loop คือ โครงสร้างการวนซ้ำที่มีคำสั่ง `while` ซ้อนอยู่ภายในคำสั่ง `while` อีกชุดหนึ่ง โดยเรียกลูปที่อยู่ภายนอกว่า **ลูปนอก (Outer Loop)** และเรียกลูปที่อยู่ภายในว่า **ลูปใน (Inner Loop)**`n",
            "`n",
            "หลักการทำงานคือ ในทุกๆ 1 รอบการทำงานของลูปนอก ลูปในจะทำการประมวลผลซ้ำตั้งแต่เริ่มต้นจนจบกระบวนการ (จนกระทั่งเงื่อนไขของลูปในเป็นเท็จ) ดังนั้น หากลูปนอกทำงาน $M$ รอบ และลูปในทำงาน $N$ รอบ คำสั่งภายในลูปในจะถูกประมวลผลทั้งหมด $M \times N$ ครั้ง`n",
            "`n",
            "### ข้อควรระวัง (Common Pitfalls)`n",
            "1. **การลืมกำหนดค่าเริ่มต้นตัวแปรลูปใน (Forget to Reset Inner Loop Variable):** ตัวแปรที่ใช้ควบคุมลูปในต้องถูกตั้งค่าเริ่มต้นใหม่ทุกครั้งก่อนเข้าสู่ลูปใน หากตั้งค่าไว้นอกลูปนอก ลูปในจะทำงานเพียงรอบแรกของลูปนอกเท่านั้น`n",
            "2. **การลืมปรับปรุงค่าตัวแปรลูป (Forget to Update Loop Variable):** หากลืมเพิ่มหรือลดค่าตัวแปรควบคุมลูปในหรือลูปนอก จะทำให้เกิดการวนลูปไม่รู้จบ (Infinite Loop)"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.1.1: การแสดงตารางพิกัด (Row, Column) ด้วย Nested while Loop")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.1.1: พิมพ์พิกัดแถว (row) และหลัก (col) ขนาด 3x3`n",
            "row = 1`n",
            "while row <= 3:`n",
            "    col = 1  # ตั้งค่าเริ่มต้นของตัวแปรลูปในทุกครั้งก่อนเข้าลูปใน`n",
            "    while col <= 3:`n",
            "        print(f`\"({row}, {col})`\", end=`\" `\")`n",
            "        col += 1  # ปรับปรุงค่าตัวแปรลูปใน`n",
            "    print()  # ขึ้นบรรทัดใหม่เมื่อจบลูปในแต่ละรอบ`n",
            "    row += 1  # ปรับปรุงค่าตัวแปรลูปนอก`n"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.1.2: การพิมพ์รูปแบบดาว (Pattern Printing)")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.1.2: พิมพ์สามเหลี่ยมดาวตามจำนวนแถว n`n",
            "n = 4`n",
            "i = 1`n",
            "while i <= n:`n",
            "    j = 1`n",
            "    while j <= i:`n",
            "        print(`\"*`\", end=`\"`\")`n",
            "        j += 1`n",
            "    print()`n",
            "    i += 1`n"
        )
    }
)

# 9.2
Save-Notebook "9_2_Nested_For_Loop.ipynb" @(
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @(
            "## 9.2 Nested for Loop (คำสั่ง for แบบซ้อน)`n",
            "`n",
            "### อธิบายแนวคิด (Concept Explanation)`n",
            "Nested for Loop คือ การใช้คำสั่ง `for` ซ้อนอยู่ภายในคำสั่ง `for` อีกชุดหนึ่ง เป็นรูปแบบที่นิยมใช้อย่างแพร่หลายสำหรับการประมวลผลข้อมูลที่มีลักษณะเป็นสองมิติ เช่น ตาราง ข้อมูลแถวและหลัก (Rows and Columns) ภาพดิจิทัล (Pixels) หรือเมทริกซ์ (Matrix)`n",
            "`n",
            "เนื่องจากคำสั่ง `for` ในภาษา Python จะจัดการลำดับและปรับปรุงค่าตัวแปรลูปร่วมกับ `range()` ให้อัตโนมัติ จึงช่วยลดความเสี่ยงจากการลืมปรับปรุงค่าตัวแปรหรือลืมกำหนดค่าเริ่มต้นเมื่อเปรียบเทียบกับ `while``n",
            "`n",
            "### ข้อควรระวัง (Common Pitfalls)`n",
            "1. **การสับสนลำดับตัวแปรลูป (Loop Variable Confusion):** มือใหม่มักสับสนการอ้างอิงตัวแปร เช่น นำตัวแปรลูปนอกไปใช้ในตำแหน่งที่ควรเป็นของตัวแปรลูปใน`n",
            "2. **ประสิทธิภาพการทำงาน (Time Complexity):** การซ้อนลูป $N$ ชั้นที่มี $K$ รอบ จะทำให้มีการประมวลผล $O(K^N)$ ครั้ง การซ้อนลูปหลายชั้นเกินไปจะทำให้โปรแกรมทำงานช้าลงอย่างมาก"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.2.1: การสร้างตารางสูตรคูณ (Multiplication Table)")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.2.1: พิมพ์ตารางสูตรคูณแม่ 2 ถึงแม่ 4 (คูณ 1 ถึง 5)`n",
            "for i in range(2, 5):  # ลูปนอก: ตัวคูณหลัก (แม่สูตรคูณ)`n",
            "    print(f`\"--- แม่ {i} ---`\")`n",
            "    for j in range(1, 6):  # ลูปใน: ตัวคูณย่อย`n",
            "        print(f`\"{i} x {j} = {i * j}`\")`n",
            "    print()  # เว้นบรรทัดระหว่างแม่`n"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.2.2: การพิมพ์รูปแบบตัวเลขสองมิติ")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.2.2: พิมพ์ตารางตัวเลขเรียงตามลำดับแถวและหลัก`n",
            "rows = 3`n",
            "cols = 4`n",
            "for r in range(rows):`n",
            "    for c in range(cols):`n",
            "        print(f`\"{r*cols + c + 1:2d}`\", end=`\" `\")`n",
            "    print()`n"
        )
    }
)

# 9.3
Save-Notebook "9_3_Break_in_Nested_Loops.ipynb" @(
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @(
            "## 9.3 Break in Nested Loops (คำสั่ง break ในโครงสร้างวนซ้ำแบบซ้อน)`n",
            "`n",
            "### อธิบายแนวคิด (Concept Explanation)`n",
            "เมื่อใช้งานคำสั่ง `break` ภายในโครงสร้างการวนซ้ำแบบซ้อน (Nested Loop) คำสั่ง `break` จะทำการยุติการทำงานและหลุดออกจาก **ลูปเฉพาะชั้นที่คำสั่งนั้นประดิษฐานอยู่เท่านั้น (Immediate Enclosing Loop)** โดยจะไม่หลุดออกจากลูปชั้นนอกสุดทันที`n",
            "`n",
            "หากต้องการให้โปรแกรมหลุดออกจากลูปทุกชั้นเมื่อเจอเงื่อนไขที่กำหนด สามารถทำได้ 2 วิธีหลัก:`n",
            "1. **การใช้ตัวแปรสถานะ (Flag Variable):** ตั้งค่าตัวแปรสถานะในลูปใน แล้วตรวจสอบค่าตัวแปรนั้นในลูปนอกเพื่อสั่ง `break` ซ้ำอีกครั้ง`n",
            "2. **การบรรจุโครงสร้างซ้อนในฟังก์ชัน (Function Return):** ใช้คำสั่ง `return` เพื่อหยุดการทำงานของฟังก์ชันทั้งหมดทันที`n",
            "`n",
            "### ข้อควรระวัง (Common Pitfalls)`n",
            "ผู้เริ่มต้นมักเข้าใจผิดว่าการใช้ `break` ในลูปในจะทำให้โปรแกรมหลุดออกจากลูปนอกด้วย ส่งผลให้โปรแกรมยังคงวนลูปนอกในรอบถัดไปโดยไม่ได้ตั้งใจ"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.3.1: การทำงานของ break ในลูปชั้นใน")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.3.1: สั่ง break ในลูปในเมื่อ j == 2`n",
            "for i in range(1, 4):`n",
            "    print(f`\"รอบลูปนอก i = {i}`\")`n",
            "    for j in range(1, 4):`n",
            "        if j == 2:`n",
            "            break  # หลุดเฉพาะลูปใน (j) ไปทำงานต่อที่ลูปนอก (i)`n",
            "        print(f`\"  ลูปใน j = {j}`\")`n"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.3.2: การใช้ Flag Variable เพื่อหยุดการทำงานทุกลูป")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.3.2: ค้นหาพิกัดแรกที่ผลคูณ i * j == 6 แล้วหยุดทุกลูป`n",
            "found = False`n",
            "for i in range(1, 5):`n",
            "    for j in range(1, 5):`n",
            "        if i * j == 6:`n",
            "            print(f`\"พบผลลัพธ์ที่ i={i}, j={j}`\")`n",
            "            found = True`n",
            "            break  # หลุดจากลูปใน`n",
            "    if found:`n",
            "        break  # หลุดจากลูปนอก`n"
        )
    }
)

# 9.4
Save-Notebook "9_4_Nested_List.ipynb" @(
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @(
            "## 9.4 Nested List (ลิสต์ซ้อนลิสต์)`n",
            "`n",
            "### อธิบายแนวคิด (Concept Explanation)`n",
            "Nested List คือ ลิสต์ที่มีสมาชิกภายในเป็นลิสต์อีกชุดหนึ่ง (List of Lists) เป็นโครงสร้างข้อมูลที่ใช้เก็บข้อมูลแบบลำดับหลายมิติ เช่น ข้อมูลตาราง ข้อมูลพิกัด หรือข้อมูลกลุ่มย่อย`n",
            "`n",
            "**การเข้าถึงสมาชิก:**`n",
            "- ดัชนีแรก `data[i]` หมายถึงการเข้าถึงลิสต์ย่อยแถวที่ `i``n",
            "- ดัชนีที่สอง `data[i][j]` หมายถึงการเข้าถึงสมาชิกตำแหน่งที่ `j` ภายในลิสต์ย่อยแถวที่ `i``n",
            "`n",
            "### ข้อควรระวัง (Common Pitfalls)`n",
            "**การสร้าง Nested List ด้วยตัวดำเนินการคูณ `[[0]*n]*m` (Shallow Copy Bug):**`n",
            "การสร้างลิสต์ซ้อนด้วยไวยากรณ์ `[[0] * 3] * 3` จะเป็นการคัดลอกจุดอ้างอิง (Reference) ของลิสต์ย่อยเดียวกัน เมื่อแก้ไขสมาชิกในแถวหนึ่ง สมาชิกในแถวอื่นจะถูกเปลี่ยนตามไปด้วย วิธีการสร้างที่ถูกต้องคือการใช้ Loop หรือ List Comprehension"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.4.1: การอ้างอิงและการแก้ไขสมาชิกใน Nested List")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.4.1: การอ้างอิงและการแก้ไขสมาชิกใน Nested List`n",
            "students = [`n",
            "    [`\"Somchai`\", 85, 90],`n",
            "    [`\"Somsri`\", 78, 88],`n",
            "    [`\"Somsak`\", 92, 95]`n",
            "]`n",
            "`n",
            "print(`\"แถวที่ 0 (Somchai):`\", students[0])`n",
            "print(`\"คะแนนสอบที่ 2 ของ Somsri:`\", students[1][2])`n",
            "`n",
            "# แก้ไขคะแนนสอบของ Somchai`n",
            "students[0][1] = 88`n",
            "print(`\"หลังแก้ไข:`\", students[0])`n"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.4.2: การวนลูปอ่านสมาชิกใน Nested List")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.4.2: แสดงผลสมาชิกทุกคนและหาคะแนนเฉลี่ย`n",
            "for row in students:`n",
            "    name = row[0]`n",
            "    score1 = row[1]`n",
            "    score2 = row[2]`n",
            "    avg = (score1 + score2) / 2`n",
            "    print(f`\"{name}: คะแนนเฉลี่ย = {avg:.2f}`\")`n"
        )
    }
)

# 9.5
Save-Notebook "9_5_Nested_List_as_Matrix.ipynb" @(
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @(
            "## 9.5 Nested List as Matrix (การใช้ลิสต์ซ้อนเป็นเมทริกซ์)`n",
            "`n",
            "### อธิบายแนวคิด (Concept Explanation)`n",
            "ในทางคอมพิวเตอร์ เราสามารถประยุกต์ใช้ Nested List เพื่อแทนโครงสร้างทางคณิตศาสตร์แบบ **เมทริกซ์ (Matrix)** ขนาด $M \times N$ โดยที่:`n",
            "- $M$ คือ จำนวนแถว (Rows)`n",
            "- $N$ คือ จำนวนหลัก (Columns)`n",
            "`n",
            "การดำเนินการกับเมทริกซ์ เช่น การบวกเมทริกซ์ การคูณด้วยสเกลาร์ หรือการสลับเปลี่ยนแถวเป็นหลัก (Transpose) สามารถทำได้โดยใช้ Nested Loop เพื่อเข้าถึงสมาชิกแต่ละตำแหน่งผ่านดัชนีแถวและหลัก `matrix[r][c]``n",
            "`n",
            "### ข้อควรระวัง (Common Pitfalls)`n",
            "1. **มิติของเมทริกซ์ไม่เท่ากัน:** การบวกเมทริกซ์สองชุดได้ เมทริกซ์ทั้งสองต้องมีจำนวนแถวและจำนวนหลักเท่ากันทุกมิติ`n",
            "2. **การพยายามเปลี่ยนค่าโดยใช้ Member Loop:** การวนลูปแบบ `for row in A: for e in row: e = 0` จะไม่เปลี่ยนค่าในลิสต์ต้นฉบับ ต้องอ้างอิงผ่านดัชนี `A[r][c] = 0` เท่านั้น"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.5.1: การบวกเมทริกซ์สองมิติ (Matrix Addition)")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.5.1: การบวกเมทริกซ์ A และ B ขนาด 2x3`n",
            "A = [`n",
            "    [1, 2, 3],`n",
            "    [4, 5, 6]`n",
            "]`n",
            "`n",
            "B = [`n",
            "    [7, 8, 9],`n",
            "    [1, 2, 3]`n",
            "]`n",
            "`n",
            "rows = len(A)`n",
            "cols = len(A[0])`n",
            "`n",
            "# สร้างเมทริกซ์ผลลัพธ์ C ขนาดเท่ากับ A`n",
            "C = []`n",
            "for r in range(rows):`n",
            "    row_list = []`n",
            "    for c in range(cols):`n",
            "        row_list.append(A[r][c] + B[r][c])`n",
            "    C.append(row_list)`n",
            "`n",
            "print(`\"ผลบวกเมทริกซ์ C:`\")`n",
            "for row in C:`n",
            "    print(row)`n"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.5.2: การทรานสโพสเมทริกซ์ (Matrix Transpose)")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.5.2: สลับแถวเป็นหลัก (Transpose) เมทริกซ์ A ขนาด 2x3 เป็น 3x2`n",
            "A = [`n",
            "    [1, 2, 3],`n",
            "    [4, 5, 6]`n",
            "]`n",
            "`n",
            "rows = len(A)`n",
            "cols = len(A[0])`n",
            "`n",
            "A_transpose = []`n",
            "for c in range(cols):`n",
            "    new_row = []`n",
            "    for r in range(rows):`n",
            "        new_row.append(A[r][c])`n",
            "    A_transpose.append(new_row)`n",
            "`n",
            "print(`\"เมทริกซ์สลับเปลี่ยน (Transpose):`\")`n",
            "for row in A_transpose:`n",
            "    print(row)`n"
        )
    }
)

# 9.6
Save-Notebook "9_6_List_Comprehension.ipynb" @(
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @(
            "## 9.6 List Comprehension (การสร้างลิสต์แบบกระชับ)`n",
            "`n",
            "### อธิบายแนวคิด (Concept Explanation)`n",
            "List Comprehension เป็นไวยากรณ์พิเศษในภาษา Python ที่ช่วยให้สร้างลิสต์ใหม่จากกลุ่มข้อมูลเดิม (Iterable) ได้ในบรรทัดเดียว มีความกระชับ อ่านง่าย และประมวลผลได้รวดเร็ว`n",
            "`n",
            "**รูปแบบไวยากรณ์พื้นฐาน:**`n",
            "```python`n",
            "[expression for item in iterable if condition]`n",
            "````n",
            "`n",
            "**การสร้าง Nested List ด้วย List Comprehension:**`n",
            "สามารถใช้ List Comprehension ซ้อนกันเพื่อสร้างเมทริกซ์หรือลิสต์สองมิติได้อย่างปลอดภัย ปราศจากปัญหา Shallow Copy Bug`n",
            "`n",
            "### ข้อควรระวัง (Common Pitfalls)`n",
            "1. **ความซับซ้อนเกินไป (Over-complication):** หากซ้อนเงื่อนไขหรือลูปหลายชั้นใน List Comprehension เกินไป จะทำให้โค้ดอ่านและดูแลรักษายาก ให้ซ้อนไม่เกิน 2 ชั้น`n",
            "2. **สับสนลำดับ for loop:** ใน Nested List Comprehension ลูปนอกจะเขียนไว้ทางซ้าย และลูปในจะเขียนต่อทางขวา"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.6.1: การเปรียบเทียบการสร้างลิสต์แบบปกติกับ List Comprehension")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# 1. สร้างลิสต์ผลคูณกำลังสองเฉพาะเลขคู่ 1 ถึง 10 แบบปกติ`n",
            "evens_squared_normal = []`n",
            "for x in range(1, 11):`n",
            "    if x % 2 == 0:`n",
            "        evens_squared_normal.append(x**2)`n",
            "`n",
            "# 2. สร้างด้วย List Comprehension`n",
            "evens_squared_comp = [x**2 for x in range(1, 11) if x % 2 == 0]`n",
            "`n",
            "print(`\"แบบปกติ:`\", evens_squared_normal)`n",
            "print(`\"แบบ Comprehension:`\", evens_squared_comp)`n"
        )
    },
    [ordered]@{
        cell_type = "markdown"
        metadata  = [ordered]@{}
        source    = @("### ตัวอย่าง 9.6.2: การสร้างเมทริกซ์ด้วย Nested List Comprehension")
    },
    [ordered]@{
        cell_type       = "code"
        execution_count = $null
        metadata        = [ordered]@{}
        outputs         = @()
        source          = @(
            "# ตัวอย่าง 9.6.2: สร้างเมทริกซ์ขนาด 3x4 ที่มีค่าเริ่มต้นเป็น 0 ทั้งหมดอย่างปลอดภัย`n",
            "matrix_zeros = [[0 for c in range(4)] for r in range(3)]`n",
            "print(`\"เมทริกซ์เริ่มต้น:`\", matrix_zeros)`n",
            "`n",
            "# ทดสอบแก้ไขค่าแถวที่ 0 หลักที่ 1`n",
            "matrix_zeros[0][1] = 99`n",
            "print(`\"หลังแก้ไข (ไม่มีปัญหาเปลี่ยนตามทุกแถว):`\", matrix_zeros)`n"
        )
    }
)

Write-Host "CREATE_MODULE09_COMPLETED"
