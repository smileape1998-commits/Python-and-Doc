import json

notebook_path = r"c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_04_Repetition\02_Lab_Exercises.ipynb"

with open(notebook_path, "r", encoding="utf-8") as f:
    nb = json.load(f)

# Find cell 04-08 markdown cell
for cell in nb["cells"]:
    if cell["cell_type"] == "markdown":
        src = "".join(cell["source"])
        if "04-08: การวาดสามเหลี่ยมสูง h" in src:
            cell["source"] = [
                "## 04-08: การวาดสามเหลี่ยมสูง h\n",
                "\n",
                "จงเขียนโปรแกรมรับจำนวนเต็มที่แทนความสูง $h$ แล้ววาดสามเหลี่ยมหน้าจั่วความสูง $h$ ฐานกว้าง $2h - 1$\n",
                "\n",
                "### ข้อมูลนำเข้า\n",
                "จำนวนเต็มหนึ่งจำนวนแทนความสูงสามเหลี่ยมหน้าจั่ว (ความสูง $\\ge 2$)\n",
                "\n",
                "### ข้อมูลส่งออก\n",
                "สตริงจำนวนบรรทัดเท่ากับความสูงที่ได้รับ แทนรูปสามเหลี่ยมหน้าจั่ว ดังตัวอย่างข้างล่างนี้\n",
                "\n",
                "### ตัวอย่าง\n",
                "\n",
                "<table>\n",
                "  <thead>\n",
                "    <tr>\n",
                "      <th style=\"text-align:left;\">Input (จากแป้นพิมพ์)</th>\n",
                "      <th style=\"text-align:left;\">Output (ทางจอภาพ)</th>\n",
                "    </tr>\n",
                "  </thead>\n",
                "  <tbody>\n",
                "    <tr>\n",
                "      <td style=\"vertical-align:top;\"><code>2</code></td>\n",
                "      <td><pre style=\"font-family:monospace; margin:0;\"> *\n",
                "***</pre></td>\n",
                "    </tr>\n",
                "    <tr>\n",
                "      <td style=\"vertical-align:top;\"><code>3</code></td>\n",
                "      <td><pre style=\"font-family:monospace; margin:0;\">  *\n",
                " * *\n",
                "*****</pre></td>\n",
                "    </tr>\n",
                "    <tr>\n",
                "      <td style=\"vertical-align:top;\"><code>8</code></td>\n",
                "      <td><pre style=\"font-family:monospace; margin:0;\">       *\n",
                "      * *\n",
                "     *   *\n",
                "    *     *\n",
                "   *       *\n",
                "  *         *\n",
                " *           *\n",
                "***************</pre></td>\n",
                "    </tr>\n",
                "  </tbody>\n",
                "</table>\n"
            ]

with open(notebook_path, "w", encoding="utf-8") as f:
    json.dump(nb, f, ensure_ascii=False, indent=1)

print("Updated 04-08 using HTML table successfully!")
