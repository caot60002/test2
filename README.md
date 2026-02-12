# 📘 Lộ Trình Học Luau Từ Cơ Bản Đến Nâng Cao

## 📋 Tổng Quan
Lộ trình này được thiết kế để bạn học Luau (ngôn ngữ lập trình dùng cho Roblox) một cách có hệ thống, đi kèm với giải thích **CÁCH HOẠT ĐỘNG** của từng khái niệm và các bài tập thực hành.

---

## PHẦN 1: CƠ BẢN (Fundamentals)

### 🎯 Bài 1: Giới Thiệu & Cài Đặt

#### 📖 Giải thích:
- **Luau**: Ngôn ngữ lập trình dựa trên Lua, được Roblox cải tiến
- **Roblox Studio**: IDE để tạo game Roblox
- **Script**: Chạy trên server (mọi người chơi đều thấy)
- **LocalScript**: Chạy trên client (chỉ người chơi đó thấy)
- **ModuleScript**: Chứa code để tái sử dụng (như library)

#### ⚙️ Cách hoạt động:
```
Server (Script) ←→ Client (LocalScript)
     ↓                    ↓
  Shared Data        UI, Effects
     ↓
ModuleScript (code tái sử dụng)
```

**Thực hành:**
- Tạo một place trong Roblox Studio
- Tạo một Script trong Workspace
- In ra dòng "Xin chào Luau!" dùng `print()`

---

### 🎯 Bài 2: Biến & Kiểu Dữ Liệu

#### 📖 Giải thích:
**Biến (Variable)** là một "nhãn" gắn vào một ô trong bộ nhớ (memory) để lưu trữ dữ liệu.

#### ⚙️ Cách hoạt động của biến:

```
MEMORY (Bộ nhớ):
┌─────────────────────────────────┐
│  0x001  │  "NguyenVanA"         │ ← ten trỏ vào đây
│  0x002  │  18                   │ ← tuoi trỏ vào đây
│  0x003  │  8.5                  │ ← diemToan trỏ vào đây
│  0x004  │  true                 │ ← laHocSinh trỏ vào đây
└─────────────────────────────────┘

Code:
local ten = "NguyenVanA"  → ten → 0x001 → "NguyenVanA"
```

**Local vs Global:**
```lua
-- Local variable: chỉ tồn tại trong scope (block) hiện tại
local x = 10  → Chỉ có thể truy cập trong file/script này

-- Global variable: có thể truy cập từ mọi nơi (KHÔNG NÊN DÙNG)
y = 20  → Có thể truy cập từ bất kỳ đâu

-- Tại sao nên dùng local?
-- 1. Nhanh hơn (trình tối ưu hóa của Luau hoạt động tốt hơn)
-- 2. Tránh xung đột tên biến
-- 3. Dọn dẹp bộ nhớ tự động khi hết scope
```

#### ⚙️ Các kiểu dữ liệu trong Memory:

**1. nil** - Không có gì (con trỏ null)
```
local x = nil  → x trỏ vào "không có gì"
```

**2. boolean** - 1 bit
```
local isActive = true  → 1 bit trong memory
```

**3. number** - Số thực 64-bit (double)
```
local age = 18       → 8 bytes
local pi = 3.14      → 8 bytes
```

**4. string** - Chuỗi ký tự (immutable)
```
local name = "Hello"  → Lưu trong memory, không thể thay đổi từng ký tự
name = "Hello World"  → Tạo chuỗi mới trong memory
```

**5. table** - Tham chiếu (reference type)
```
local arr = {1, 2, 3}  → arr trỏ vào địa chỉ 0x100
local arr2 = arr       → arr2 cũng trỏ vào 0x100 (cùng object!)

arr[1] = 10  → Thay đổi ảnh hưởng cả arr và arr2 (vì cùng trỏ vào 1 object)
```

**Thực hành:**
```lua
-- Tạo biến lưu tên, tuổi, điểm số
local ten = "NguyenVanA"      → ten trỏ vào string "NguyenVanA"
local tuoi = 18               → tuoi trỏ vào number 18
local diemToan = 8.5          → diemToan trỏ vào number 8.5
local laHocSinh = true        → laHocSinh trỏ vào boolean true

-- In ra thông tin
print("Tên: " .. ten)         → Nối chuỗi: "Tên: " + "NguyenVanA"
print("Tuổi: " .. tostring(tuoi))  → Chuyển số thành chuỗi để nối

-- Tính trung bình cộng 3 môn
local diem1, diem2, diem3 = 7, 8, 9  → Gán nhiều giá trị cùng lúc
local dtb = (diem1 + diem2 + diem3) / 3  → Tính toán và lưu vào dtb
print("Điểm trung bình: " .. tostring(dtb))

-- Ví dụ về reference type (table)
local arr1 = {1, 2, 3}  → arr1 trỏ vào địa chỉ A
local arr2 = arr1       → arr2 cũng trỏ vào địa chỉ A
arr1[1] = 99            → Thay đổi giá trị tại địa chỉ A
print(arr2[1])          → In ra 99 (vì arr2 và arr2 cùng trỏ vào A)
```

---

### 🎯 Bài 3: Toán Tử & Biểu Thức

#### 📖 Giải thích:
**Toán tử** là ký hiệu để thực hiện phép toán trên dữ liệu.

#### ⚙️ Cách hoạt động của từng toán tử:

**1. Toán tử số học:**
```lua
+  Addition (cộng):      5 + 3  → 8
-  Subtraction (trừ):    5 - 3  → 2
*  Multiplication (nhân): 5 * 3  → 15
/  Division (chia):      6 / 3  → 2
%  Modulus (số dư):      5 % 3  → 2  (5 = 3*1 + 2)
^  Power (lũy thừa):     2 ^ 3  → 8  (2*2*2)
```

**2. Toán tử so sánh:**
```lua
==  Bằng:           5 == 5  → true
~=  Khác:           5 ~= 3  → true
<   bé hơn:         3 < 5   → true
>   lớn hơn:        5 > 3   → true
<=  bé hơn hoặc bằng:  5 <= 5  → true
>=  lớn hơn hoặc bằng: 5 >= 3  → true
```

**3. Toán tử logic:**
```lua
and  VÀ:  true and false  → false  (cả 2 phải true)
or   HOẶC: true or false  → true   (1 trong 2 true là được)
not  PHỦ ĐỊNH: not true  → false

-- Short-circuit evaluation:
false and error()  → error() KHÔNG chạy (vì false đã đủ)
true or error()    → error() KHÔNG chạy (vì true đã đủ)
```

**4. Toán tử nối chuỗi:**
```lua
..  Nối chuỗi:  "Hello" .. " " .. "World"  → "Hello World"

-- Cẩn thận: Lua không tự động chuyển đổi!
-- "10" + 5  → LỖI! (không thể cộng string với number)
-- "10" .. 5 → "105" (nối chuỗi)
```

**Thực hành:**
```lua
-- Chuyển đổi nhiệt độ từ C sang F
local doC = 30
local doF = doC * 9/5 + 32
-- Quy trình:
-- 1. doC * 9 = 270
-- 2. 270 / 5 = 54
-- 3. 54 + 32 = 86
print(doC .. "°C = " .. doF .. "°F")

-- Kiểm tra số chẵn/lẻ
local so = 15
if so % 2 == 0 then
    -- 15 % 2 = 1 (số dư khi chia 15 cho 2)
    print(so .. " là số chẵn")
else
    print(so .. " là số lẻ")
end

-- Tính diện tích hình tròn
local banKinh = 5
local dienTich = math.pi * banKinh ^ 2
-- Quy trình:
-- 1. banKinh ^ 2 = 25
-- 2. math.pi * 25 = 78.54...
print("Diện tích: " .. tostring(dienTich))
```

---

### 🎯 Bài 4: Cấu Trúc Điều Khiển

#### 📖 Giải thích:
**Cấu trúc điều khiển** dùng để điều hướng flow của chương trình.

#### ⚙️ Cách hoạt động của từng cấu trúc:

**1. if statement (điều kiện):**
```lua
if condition then
    -- Chạy khi condition = true
elseif condition2 then
    -- Chạy khi condition = false và condition2 = true
else
    -- Chạy khi tất cả đều false
end

-- Flow:
-- condition → true → chạy block if → kết thúc
-- condition → false → condition2 → true → chạy block elseif → kết thúc
-- condition → false → condition2 → false → chạy block else → kết thúc
```

**2. while loop (vòng lặp "trước khi làm"):**
```lua
while condition do
    -- Lặp chừng nào condition còn true
end

-- Flow:
-- condition → true → chạy code → quay lại check condition
-- condition → false → thoát loop
```

**3. repeat...until (vòng lặp "làm rồi mới check"):**
```lua
repeat
    -- Chạy ít nhất 1 lần
until condition

-- Flow:
-- chạy code → condition → true → thoát
--              condition → false → chạy lại → check condition
```

**4. for loop (vòng lặp đếm):**
```lua
for i = start, stop, step do
    -- i chạy từ start đến stop, mỗi lần tăng step
end

-- Ví dụ: for i = 1, 10, 2 do
-- i = 1 → chạy
-- i = 3 → chạy
-- i = 5 → chạy
-- i = 7 → chạy
-- i = 9 → chạy
-- i = 11 → > 10 → thoát

-- Generic for (dùng với table):
for index, value in ipairs(array) do
    -- index: vị trí (1, 2, 3...)
    -- value: giá trị tại vị trí đó
end
```

**Thực hành:**
```lua
-- 1. In ra số từ 1 đến 10
for i = 1, 10 do
    print(i)
end
-- Flow:
-- i = 1 → print(1)
-- i = 2 → print(2)
-- ...
-- i = 10 → print(10)
-- i = 11 → > 10 → thoát

-- 2. Đoán số game
local soBiMat = math.random(1, 100)
local doan = 0
while doan ~= soBiMat do
    print("Đoán số (1-100):")
    doan = math.random(1, 100) -- Giả lập
    if doan < soBiMat then
        print("Số của bạn bé quá!")
    elseif doan > soBiMat then
        print("Số của bạn lớn quá!")
    end
end
print("Chính xác!")

-- 3. Tính tổng từ 1 đến n
local n = 100
local tong = 0
for i = 1, n do
    tong = tong + i
end
-- Flow:
-- i = 1 → tong = 0 + 1 = 1
-- i = 2 → tong = 1 + 2 = 3
-- i = 3 → tong = 3 + 3 = 6
-- ...
print("Tổng 1 đến " .. n .. " = " .. tong)
```

---

## PHẦN 2: TRUNG BÌNH (Intermediate)

### 🎯 Bài 5: Functions (Hàm)

#### 📖 Giải thích:
**Function (Hàm)** là một khối code có tên, có thể gọi lại nhiều lần.

#### ⚙️ Cách hoạt động của function:

**1. Function trong Memory:**
```lua
local function tinhTong(a, b)
    return a + b
end

-- Trong memory:
┌────────────────────────────────┐
│  Function Object               │
│  - Code: {return a + b}        │
│  - Parameters: a, b            │
└────────────────────────────────┘
       ↑
     tinhTong (biến trỏ vào function object)
```

**2. Gọi function (Call stack):**
```lua
local ketQua = tinhTong(5, 3)

-- Flow:
-- 1. Push frame mới vào Call Stack:
--    ┌─────────────┐
--    │ tinhTong    │ ← a = 5, b = 3
--    └─────────────┘
--
-- 2. Thực thi code trong function: 5 + 3 = 8
--
-- 3. Return 8, pop frame khỏi Call Stack
--
-- 4. ketQua = 8
```

**3. Parameters vs Arguments:**
```lua
local function xinChao(ten)  → "ten" là parameter (tên giả)
    print("Xin chào " .. ten)
end

xinChao("An")  → "An" là argument (giá trị thật)
-- Flow: ten = "An" → print("Xin chào An")
```

**4. Return values:**
```lua
local function tinh(a, b)
    return a + b, a - b  → Trả về 2 giá trị
end

local tong, hieu = tinh(10, 3)
-- tong = 13, hieu = 7

-- Nếu không nhận đủ:
local chiTong = tinh(10, 3)
-- chiTong = 13, giá trị thứ 2 bị bỏ qua
```

**5. Scope trong function:**
```lua
local x = 10  → Global scope (của file)

local function ham()
    local y = 20  → Local scope (chỉ trong ham)
    print(x)  → OK (x có thể truy cập từ trong)
end

print(y)  → LỖI! (y không tồn tại ở đây)
```

**Thực hành:**
```lua
-- 1. Hàm tính giai thừa (đệ quy)
local function giaiThua(n)
    if n <= 1 then
        return 1  → Base case (điều kiện dừng)
    end
    return n * giaiThua(n - 1)  → Recursive call
end

-- Flow của giaiThua(5):
-- giaiThua(5) → 5 * giaiThua(4)
--             → 5 * (4 * giaiThua(3))
--             → 5 * (4 * (3 * giaiThua(2)))
--             → 5 * (4 * (3 * (2 * giaiThua(1))))
--             → 5 * (4 * (3 * (2 * 1)))
--             → 5 * 4 * 3 * 2 * 1
--             → 120

print("5! = " .. tostring(giaiThua(5)))

-- 2. Hàm kiểm tra số nguyên tố
local function laSoNguyenTo(n)
    if n < 2 then return false end
    for i = 2, math.sqrt(n) do
        if n % i == 0 then
            return false  → Tìm thấy ước số → không phải số nguyên tố
        end
    end
    return true  → Không tìm thấy ước số → là số nguyên tố
end

-- 3. Hàm với nhiều giá trị trả về
local function phanChiaThuaSo(n)
    local nguyen = math.floor(n)  → Phần nguyên
    local du = n - nguyen         → Phần dư
    return nguyen, du
end

-- 4. Hàm tính trung bình cộng (varargs)
local function trungBinhCong(...)
    local args = {...}  → Lấy tất cả arguments vào table
    local tong = 0
    for _, v in ipairs(args) do
        tong = tong + v
    end
    return tong / #args  → #args = số lượng phần tử
end
print("TBC: " .. tostring(trungBinhCong(7, 8, 9, 10)))
```

---

### 🎯 Bài 6: Tables (Bảng)

#### 📖 Giải thích:
**Table** là cấu trúc dữ liệu duy nhất trong Lua/Luau, có thể dùng như array, dictionary, object, v.v.

#### ⚙️ Cách hoạt động của table trong Memory:

**1. Table là reference type:**
```lua
local arr = {1, 2, 3}
local arr2 = arr

-- Trong memory:
┌─────────────────────────────┐
│  Table Object (địa chỉ A)   │
│  [1] = 1                    │
│  [2] = 2                    │
│  [3] = 3                    │
└─────────────────────────────┘
       ↑              ↑
      arr           arr2  (cả 2 đều trỏ vào A!)

arr[1] = 99
print(arr2[1])  → 99 (vì cùng 1 object!)
```

**2. Table như Array (mảng):**
```lua
local arr = {10, 20, 30}

-- Trong memory:
┌──────────────────┐
│  [1] = 10        │  Lua arrays bắt đầu từ index 1!
│  [2] = 20        │
│  [3] = 30        │
└──────────────────┘

arr[0]  → nil (không có index 0!)
arr[1]  → 10
arr[4]  → nil (chưa gán)
```

**3. Table như Dictionary:**
```lua
local player = {
    name = "An",
    age = 18,
    score = 100
}

-- Trong memory:
┌────────────────────┐
│  ["name"] = "An"   │  Key là string "name"
│  ["age"] = 18      │  Key là string "age"
│  ["score"] = 100   │  Key là string "score"
└────────────────────┘

player.name  → "An"  (syntactic sugar cho player["name"])
player["name"]  → "An"
```

**4. Nested tables:**
```lua
local game = {
    player = {
        name = "An",
        hp = 100
    },
    enemies = {
        {name = "Enemy1", hp = 50},
        {name = "Enemy2", hp = 60}
    }
}

-- Truy cập:
game.player.name  → "An"
game.enemies[1].name  → "Enemy1"
```

**5. Table methods:**
```lua
local arr = {3, 1, 4, 1, 5}

-- table.insert: Thêm vào cuối
table.insert(arr, 9)
-- arr = {3, 1, 4, 1, 5, 9}

-- table.remove: Xóa khỏi cuối
table.remove(arr)
-- arr = {3, 1, 4, 1, 5}

-- table.sort: Sắp xếp
table.sort(arr)  → Mặc định tăng dần
-- arr = {1, 1, 3, 4, 5}

table.sort(arr, function(a, b)
    return a > b  → Giảm dần
end)
-- arr = {5, 4, 3, 1, 1}
```

**Thực hành:**
```lua
-- 1. Quản lý danh sách học sinh
local danhSachHS = {
    {ten = "An", tuoi = 18, diem = 8.5},
    {ten = "Bình", tuoi = 17, diem = 7.0},
    {ten = "Chi", tuoi = 18, diem = 9.0}
}

-- Trong memory: 3 objects, mỗi object là 1 table

-- In ra danh sách
for i, hs in ipairs(danhSachHS) do
    -- i = index (1, 2, 3)
    -- hs = reference đến table tại index đó
    print(i .. ". " .. hs.ten .. " - " .. hs.diem)
end

-- 2. Tìm học sinh có điểm cao nhất
local function timDiemCaoNhat(danhSach)
    local max = danhSach[1]  → Giả sử phần tử đầu là max
    for _, hs in ipairs(danhSach) do
        if hs.diem > max.diem then
            max = hs  → Cập nhật max
        end
    end
    return max  → Trả về reference đến object có điểm cao nhất
end

-- 3. Sắp xếp theo điểm
table.sort(danhSachHS, function(a, b)
    return a.diem > b.diem  → True nếu a.diem > b.diem
end)
-- Note: a và b là references!

-- 4. Đếm số lần xuất hiện
local function demSoLanXuatHien(arr)
    local dem = {}  → Tạo table rỗng
    for _, v in ipairs(arr) do
        -- dem[v] = (dem[v] or 0) + 1
        -- Nếu dem[v] = nil → (nil or 0) = 0 → 0 + 1 = 1
        -- Nếu dem[v] = 3 → (3 or 0) = 3 → 3 + 1 = 4
        dem[v] = (dem[v] or 0) + 1
    end
    return dem
end
```

---

### 🎯 Bài 7: String Operations

#### 📖 Giải thích:
**String** trong Lua/Luau là **immutable** (không thể thay đổi) - mọi thao tác đều tạo ra string mới.

#### ⚙️ Cách hoạt động của string trong Memory:

**1. String là immutable:**
```lua
local s = "Hello"

-- Trong memory:
┌──────────────────┐
│  "Hello" (0x100) │  String object
└──────────────────┘
     ↑
    s  → s trỏ vào "Hello"

s = s .. " World"
-- Tạo string MỚI trong memory:
┌──────────────────┐
│  "Hello World" (0x200) │  String object MỚI
└──────────────────┘
     ↑
    s  → s bây giờ trỏ vào string mới

-- "Hello" (0x100) vẫn còn trong memory, chờ garbage collector
```

**2. Nối chuỗi (..):**
```lua
local s1 = "Hello"
local s2 = "World"
local s3 = s1 .. " " .. s2

-- Flow:
-- 1. s1 .. " " → "Hello " (tạo string mới)
-- 2. "Hello " .. s2 → "Hello World" (tạo string mới khác)
-- 3. s3 trỏ vào "Hello World"
```

**3. Lấy độ dài (#):**
```lua
local s = "Hello"
print(#s)  → 5

-- Trong memory, string có metadata:
┌────────────────────────────┐
│  "Hello"                   │
│  length: 5                 │  Metadata này được truy cập bằng #
│  hash: 0x12345...          │
└────────────────────────────┘
```

**4. Cắt chuỗi (string.sub):**
```lua
local s = "Hello World"
local sub = string.sub(s, 1, 5)  → "Hello"

-- Không thay đổi string gốc!
print(s)  → "Hello World" (vẫn nguyên)

-- Indices:  H    e   l   l   o       W   o   r   l   d
--            1    2   3   4   5   6   7   8   9   10  11
```

**5. Tìm kiếm (string.find):**
```lua
local s = "Hello World"
local pos = string.find(s, "World")  → 7

-- Flow:
-- 1. Tìm "World" trong "Hello World"
-- 2. Tìm thấy bắt đầu tại index 7
-- 3. Return 7

local notFound = string.find(s, "xyz")  → nil (không tìm thấy)
```

**Thực hành:**
```lua
-- 1. Đảo ngược chuỗi
local function daoNguocChuoi(str)
    local result = ""
    for i = #str, 1, -1 do
        result = result .. string.sub(str, i, i)
        -- Mỗi lần lặp: Tạo string MỚI (không efficient!)
    end
    return result
end

-- Flow với str = "abc":
-- i = 3: result = "" .. "c" = "c"
-- i = 2: result = "c" .. "b" = "cb"
-- i = 1: result = "cb" .. "a" = "cba"

-- 2. Kiểm tra palindrome
local function laPalindrome(str)
    str = string.lower(str)  → Chuyển thành chữ thường (tạo string mới)
    return str == daoNguocChuoi(str)
    → So sánh 2 strings: nếu bằng → palindrome
end

-- 3. Đếm số lần xuất hiện của ký tự
local function demKyTu(str, char)
    local count = 0
    for i = 1, #str do
        if string.sub(str, i, i) == char then
            count = count + 1
        end
    end
    return count
end

-- 4. Format tên
local function formatTen(ho, tenDem, ten)
    return ten .. " " .. tenDem .. " " .. ho
end
-- Note: Tạo 3 strings trung gian! (không efficient với nhiều lần)
```

---

### 🎯 Bài 8: Scope & Modules

#### 📖 Giải thích:
**Scope** là phạm vi mà biến có thể truy cập được.

#### ⚙️ Cách hoạt động của Scope:

**1. Local Scope:**
```lua
do  → Block bắt đầu
    local x = 10  → x chỉ tồn tại trong block này
    print(x)  → OK (x có thể truy cập)
end  → Block kết thúc

print(x)  → LỖI! x đã bị hủy khi block kết thúc
```

**2. Global Scope (file-level):**
```lua
-- File: Script.lua
local x = 10  → File-level scope (local cho cả file)

local function ham()
    print(x)  → OK (x có thể truy cập từ trong function)
end

-- Trong script KHÁC:
local Script = require(script.Parent.Script)
print(Script.x)  → LỖI! x là local, không thể truy cập từ bên ngoài
```

**3. Variable shadowing:**
```lua
local x = 10  → Outer x

local function ham()
    local x = 20  → Inner x (shadow outer x)
    print(x)  → 20 (inner)
end

ham()
print(x)  → 10 (outer, không bị ảnh hưởng)
```

**4. Block scope:**
```lua
local arr = {1, 2, 3}

for i = 1, #arr do
    local value = arr[i]  → value chỉ tồn tại trong loop
    print(value)
end

print(value)  → LỖI! value đã bị hủy
```

**5. ModuleScript:**
```lua
-- File: MyModule.lua (ModuleScript)
local MyModule = {}  → Tạo table để export

-- Thêm functions vào module
function MyModule.tong(a, b)
    return a + b
end

function MyModule.hieu(a, b)
    return a - b
end

-- Export: Return table này
return MyModule
-- Mọi thứ KHÔNG trong MyModule sẽ là private (local)
```

**6. Require module:**
```lua
-- Trong script khác:
local MyModule = require(game.ReplicatedStorage.MyModule)

-- Flow:
-- 1. Tìm MyModule trong ReplicatedStorage
-- 2. Chạy MyModule.lua (nếu chưa chạy)
-- 3. Nhận giá trị return (table MyModule)
-- 4. Gán vào biến local MyModule

print(MyModule.tong(5, 3))  → 8
```

**Thực hành:**
```lua
-- Tạo file ModuleScript: "Utils.lua"
local Utils = {}

-- Public: Có thể truy cập từ bên ngoài
function Utils.tong(a, b)
    return a + b
end

function Utils.hieu(a, b)
    return a - b
end

-- Private: Chỉ dùng bên trong module
local function privateFunction()
    print("Đây là hàm private!")
end

function Utils.publicUsingPrivate()
    privateFunction()  → OK (có thể gọi từ trong module)
end

return Utils

-- Trong Script khác:
local Utils = require(game.ReplicatedStorage.Utils)
print(Utils.tong(5, 3))  → 8
Utils.publicUsingPrivate()  → "Đây là hàm private!"
Utils.privateFunction()  → LỖI! (không thể truy cập private)
```

---

## PHẦN 3: NÂNG CAO (Advanced)

### 🎯 Bài 9: Metatables & Metamethods

#### 📖 Giải thích:
**Metatable** là một table đặc biệt gắn vào table khác, định nghĩa cách table đó "hành xử" khi gặp các thao tác đặc biệt.

#### ⚙️ Cách hoạt động của Metatable:

**1. Cơ bản về Metatable:**
```lua
local t = {1, 2, 3}
local mt = {}  → Metatable

setmetatable(t, mt)  → Gắn mt vào t

-- Trong memory:
┌──────────────────┐
│  Table t         │
│  [1] = 1         │
│  [2] = 2         │
│  [3] = 3         │
│  metatable → mt  │  ← Con trỏ đến metatable
└──────────────────┘
       ↓
┌──────────────────┐
│  Metatable mt    │
│  (chứa metamethods)│
└──────────────────┘
```

**2. __index (quan trọng nhất!):**
```lua
local parent = {
    name = "Parent"
}

local child = setmetatable({}, {
    __index = parent  → Khi không tìm thấy key trong child, tìm trong parent
})

print(child.name)  → "Parent"

-- Flow:
-- 1. Tìm "name" trong child → không có → nil
-- 2. Có __index? → Có!
-- 3. Tìm "name" trong __index (parent) → có → "Parent"
-- 4. Return "Parent"

-- Nếu gán giá trị:
child.name = "Child"
print(child.name)  → "Child" (không cần dùng __index)

-- Flow:
-- 1. Tìm "name" trong child → có → "Child"
-- 2. Return "Child" (không cần __index)
```

**3. __index là function:**
```lua
local t = setmetatable({}, {
    __index = function(table, key)
        print("Đang tìm key: " .. key)
        return "Giá trị mặc định"
    end
})

print(t.khongTonTai)  → In ra "Đang tìm key: khongTonTai"
                     → Return "Giá trị mặc định"
```

**4. __newindex:**
```lua
local t = setmetatable({}, {
    __newindex = function(table, key, value)
        print("Đang gán " .. key .. " = " .. tostring(value))
        rawset(table, key, value)  → Thực sự gán giá trị
    end
})

t.x = 10  → In ra "Đang gán x = 10"
print(t.x)  → 10

-- Note: Nếu không dùng rawset, giá trị sẽ không được gán!
```

**5. Toán tử arithmetic metamethods:**
```lua
local Vector2D = {}
Vector2D.__index = Vector2D

function Vector2D.new(x, y)
    return setmetatable({x = x, y = y}, Vector2D)
end

function Vector2D.__add(a, b)
    → Khi a + b, function này được gọi
    return Vector2D.new(a.x + b.x, a.y + b.y)
end

local v1 = Vector2D.new(3, 4)
local v2 = Vector2D.new(1, 2)
local v3 = v1 + v2

-- Flow:
-- 1. Lua thấy v1 + v2
-- 2. Kiểm tra v1 có metatable không? → Có (Vector2D)
-- 3. Kiểm tra Vector2D có __add không? → Có!
-- 4. Gọi Vector2D.__add(v1, v2)
-- 5. Return Vector2D.new(4, 6)
-- 6. v3 = Vector2D.new(4, 6)
```

**6. __tostring:**
```lua
local t = setmetatable({x = 10, y = 20}, {
    __tostring = function(table)
        return "(" .. table.x .. ", " .. table.y .. ")"
    end
})

print(t)  → "(10, 20)" (thay vì "table: 0x...")

-- Flow:
-- 1. print(t) cần chuyển t thành string
-- 2. Kiểm tra t có metatable với __tostring không? → Có!
-- 3. Gọi __tostring(t)
-- 4. Return "(10, 20)"
-- 5. In ra "(10, 20)"
```

**7. __call:**
```lua
local t = setmetatable({value = 10}, {
    __call = function(table, arg)
        print("Được gọi với arg: " .. arg)
        return table.value + arg
    end
})

local result = t(5)  → In ra "Được gọi với arg: 5"
                → Return 15

-- Flow:
-- 1. Lua thấy t(5) (như gọi function)
-- 2. Kiểm tra t có metatable với __call không? → Có!
-- 3. Gọi __call(t, 5)
-- 4. Return 15
```

**Thực hành:**
```lua
-- 1. Tạo class Vector2D đầy đủ
local Vector2D = {}
Vector2D.__index = Vector2D

function Vector2D.new(x, y)
    → Tạo table mới với x, y
    → Gán metatable là Vector2D
    return setmetatable({x = x or 0, y = y or 0}, Vector2D)
end

function Vector2D.__add(a, b)
    → Override toán tử +
    return Vector2D.new(a.x + b.x, a.y + b.y)
end

function Vector2D.__sub(a, b)
    → Override toán tử -
    return Vector2D.new(a.x - b.x, a.y - b.y)
end

function Vector2D.__tostring(vec)
    → Override tostring()
    return "(" .. vec.x .. ", " .. vec.y .. ")"
end

function Vector2D:magnitude()
    → Method (tham số đầu là self)
    return math.sqrt(self.x^2 + self.y^2)
end

local v1 = Vector2D.new(3, 4)
local v2 = Vector2D.new(1, 2)
print(v1 + v2)  → "(4, 6)"
print(v1:magnitude())  → 5

-- Flow của v1:magnitude():
-- 1. v1:magnitude(10) là syntactic sugar cho Vector2D.magnitude(v1, 10)
-- 2. Gọi Vector2D.magnitude(v1, 10)
-- 3. Trong function: self = v1
-- 4. Return sqrt(3^2 + 4^2) = 5
```

---

### 🎯 Bài 10: OOP trong Luau

#### 📖 Giải thích:
**OOP (Object-Oriented Programming)** là cách lập trình dựa trên "objects" có:
- Properties (thuộc tính - dữ liệu)
- Methods (phương thức - functions)
- Inheritance (kế thừa)
- Encapsulation (đóng gói)

#### ⚙️ Cách hoạt động của OOP trong Luau:

**1. Class với Metatable:**
```lua
local Enemy = {}
Enemy.__index = Enemy  → Quan trọng! Để __index hoạt động

function Enemy.new(name, hp)
    → Constructor: Tạo object mới
    local self = {
        name = name,
        hp = hp,
        maxHp = hp
    }
    → Gán metatable để Enemy có thể dùng methods
    setmetatable(self, Enemy)
    return self
end

function Enemy:takeDamage(damage)
    → Method: self là object gọi method
    self.hp = math.max(0, self.hp - damage)
    if self.hp == 0 then
        self:die()
    end
end

function Enemy:die()
    print(self.name .. " đã chết!")
end

-- Sử dụng:
local enemy = Enemy.new("Goblin", 100)
→ enemy = {name = "Goblin", hp = 100, maxHp = 100}
→ enemy metatable = Enemy

enemy:takeDamage(30)
→ Flow: Enemy.takeDamage(enemy, 30)
→ self = enemy
→ enemy.hp = 100 - 30 = 70
```

**2. Inheritance (Kế thừa):**
```lua
local Enemy = {}
Enemy.__index = Enemy

function Enemy.new(name, hp)
    local self = {name = name, hp = hp, maxHp = hp}
    setmetatable(self, Enemy)
    return self
end

function Enemy:attack()
    print(self.name .. " tấn công!")
end

-- Boss kế thừa từ Enemy
local Boss = setmetatable({}, {__index = Enemy})
→ Boss.__index = Boss
→ Boss.__index = Enemy (khi không tìm thấy trong Boss, tìm trong Enemy)

function Boss.new(name, hp, specialPower)
    → Gọi constructor của Enemy
    local self = Enemy.new(name, hp)
    self.specialPower = specialPower
    → Override metatable thành Boss
    setmetatable(self, Boss)
    return self
end

function Boss:useSpecialAttack()
    → Method riêng của Boss
    print(self.name .. " dùng đòn đặc biệt!")
end

-- Sử dụng:
local boss = Boss.new("Dragon", 500, 1000)
boss:attack()  → "Dragon tấn công!" (kế thừa từ Enemy)
boss:useSpecialAttack()  → "Dragon dùng đòn đặc biệt!" (của Boss)

-- Flow của boss:attack():
-- 1. boss có metatable là Boss
-- 2. Tìm "attack" trong Boss → không có
-- 3. Boss có __index = Enemy
-- 4. Tìm "attack" trong Enemy → có!
-- 5. Gọi Enemy.attack(boss)
```

**3. Method override:**
```lua
function Boss:die()
    → Override method die() của Enemy
    print(self.name .. " Boss đã bị đánh bại!")
    → Gọi method die() của class cha (nếu muốn)
    -- Enemy.die(self)  → Gọi die của Enemy
end

boss:die()  → "Dragon Boss đã bị đánh bại!" (không phải của Enemy)

-- Flow:
-- 1. boss có metatable là Boss
-- 2. Tìm "die" trong Boss → có!
-- 3. Gọi Boss.die(boss)
-- 4. Không cần tìm trong Enemy
```

**4. Encapsulation (đóng gói):**
```lua
local BankAccount = {}
BankAccount.__index = BankAccount

function BankAccount.new(balance)
    local self = {
        _balance = balance  → _ tiền tố convention cho private
    }
    setmetatable(self, BankAccount)
    return self
end

function BankAccount:deposit(amount)
    if amount <= 0 then
        error("Số tiền phải dương!")
    end
    self._balance = self._balance + amount
end

function BankAccount:getBalance()
    → Getter method (chỉ đọc, không ghi)
    return self._balance
end

-- Sử dụng:
local acc = BankAccount.new(100)
acc:deposit(50)
print(acc:getBalance())  → 150

acc._balance = 999999  → VẪN CÓ THỂ GÁN (không thực sự private!)
→ Lua không có true private, chỉ là convention
```

**Thực hành:**
```lua
-- Hệ thống Enemy đầy đủ với inheritance
local Enemy = {}
Enemy.__index = Enemy

function Enemy.new(name, hp)
    local self = setmetatable({
        name = name,
        hp = hp,
        maxHp = hp
    }, Enemy)
    return self
end

function Enemy:takeDamage(damage)
    self.hp = math.max(0, self.hp - damage)
    print(self.name .. " mất " .. damage .. " HP. Còn " .. self.hp)
    if self.hp == 0 then
        self:die()
    end
end

function Enemy:heal(amount)
    self.hp = math.min(self.maxHp, self.hp + amount)
    print(self.name .. " hồi " .. amount .. " HP. Còn " .. self.hp)
end

function Enemy:die()
    print(self.name .. " đã chết!")
end

-- Boss kế thừa từ Enemy
local Boss = setmetatable({}, {__index = Enemy})
Boss.__index = Boss

function Boss.new(name, hp, specialAttack)
    → Gọi Enemy.new để tạo base object
    local self = Enemy.new(name, hp)
    → Thêm properties riêng của Boss
    self.specialAttack = specialAttack or 50
    → Override metatable
    setmetatable(self, Boss)
    return self
end

function Boss:useSpecialAttack(target)
    print(self.name .. " dùng kỹ năng đặc biệt!")
    target:takeDamage(self.specialAttack)
end

function Boss:die()
    → Override die method của Enemy
    print(self.name .. " Boss đã bị đánh bại! Thưởng x100!")
end

-- Sử dụng:
local goblin = Enemy.new("Goblin", 50)
local dragon = Boss.new("Dragon", 200, 80)

goblin:takeDamage(30)  → "Goblin mất 30 HP. Còn 20"
dragon:useSpecialAttack(goblin)  → "Dragon dùng kỹ năng đặc biệt!"
                               → "Goblin mất 80 HP. Còn 0"
                               → "Goblin đã chết!"
dragon:die()  → "Dragon Boss đã bị đánh bại! Thưởng x100!"
```

---

### 🎯 Bài 11: Coroutines

#### 📖 Giải thích:
**Coroutine** là function có thể tạm dừng (pause) và tiếp tục (resume) sau đó.

#### ⚙️ Cách hoạt động của Coroutine:

**1. Coroutine States:**
```lua
States của coroutine:
1. suspended  → Đang tạm dừng (có thể resume)
2. running    → Đang chạy
3. normal     → Đang chạy coroutine khác
4. dead       → Đã kết thúc
```

**2. Tạo và chạy coroutine:**
```lua
local function foo()
    print("foo 1")
    coroutine.yield()  → Tạm dừng ở đây
    print("foo 2")
end

local co = coroutine.create(foo)  → Tạo coroutine, state = suspended
print(coroutine.status(co))  → "suspended"

coroutine.resume(co)  → Chạy coroutine
→ In ra "foo 1"
→ Gặp yield() → tạm dừng
print(coroutine.status(co))  → "suspended"

coroutine.resume(co)  → Tiếp tục từ yield()
→ In ra "foo 2"
→ Function kết thúc
print(coroutine.status(co))  → "dead"
```

**3. Truyền dữ liệu qua yield/resume:**
```lua
local function producer()
    local data = "Data 1"
    local value = coroutine.yield(data)
    → yield return "Data 1", và nhận value từ resume tiếp theo
    print("Nhận: " .. value)
end

local co = coroutine.create(producer)

local ok, data = coroutine.resume(co)
→ data = "Data 1" (giá trị yield return)

coroutine.resume(co, "Hello")
→ Truyền "Hello" vào yield()
→ In ra "Nhận: Hello"
```

**4. Coroutine.wrap:**
```lua
local function foo()
    print("Start")
    coroutine.yield()
    print("End")
end

local wrapped = coroutine.wrap(foo)
→ Tạo wrapped function (không cần resume)

wrapped()  → Chạy như function bình thường
wrapped()  → Tiếp tục

-- Khác với create():
-- create() trả về coroutine object
-- wrap() trả về function có thể gọi
```

**Thực hành:**
```lua
-- 1. Countdown với coroutine
local function countdown(seconds)
    for i = seconds, 1, -1 do
        print(i)
        coroutine.yield()  → Tạm dừng sau mỗi in
    end
    print("Het gio!")
end

local co = coroutine.create(countdown)
for _ = 1, 10 do
    coroutine.resume(co)  → Chạy 1 lần, tạm dừng ở yield
    wait(1)  → Roblox function, đợi 1 giây
end

-- 2. Spawn enemy liên tục
local spawnerCo = coroutine.create(function()
    while true do
        print("Spawn enemy!")
        coroutine.yield()  → Tạm dừng, đợi resume lần sau
    end
end)

while true do
    coroutine.resume(spawnerCo)
    wait(2)  → Spawn enemy mỗi 2 giây
end

-- 3. Xử lý nhiều task song song
local function task1()
    for i = 1, 5 do
        print("Task 1: " .. i)
        coroutine.yield()
    end
end

local function task2()
    for i = 1, 5 do
        print("Task 2: " .. i)
        coroutine.yield()
    end
end

local co1 = coroutine.create(task1)
local co2 = coroutine.create(task2)

-- Chạy xen kẽ:
coroutine.resume(co1)  → "Task 1: 1"
coroutine.resume(co2)  → "Task 2: 1"
coroutine.resume(co1)  → "Task 1: 2"
coroutine.resume(co2)  → "Task 2: 2"
...
```

---

### 🎯 Bài 12: Error Handling

#### 📖 Giải thích:
**Error Handling** là cách xử lý lỗi khi code gặp vấn đề, thay vì crash chương trình.

#### ⚙️ Cách hoạt động của Error Handling:

**1. pcall (Protected Call):**
```lua
local success, result = pcall(function()
    → Code này sẽ chạy "an toàn"
    return 10 / 0  → Lỗi! (chia cho 0)
end)

-- Nếu không có lỗi:
-- success = true
-- result = giá trị return

-- Nếu có lỗi:
-- success = false
-- result = error message

print(success)  → false
print(result)   → "attempt to divide by zero"

-- Flow:
-- 1. pcall bắt đầu chạy function
-- 2. Gặp lỗi (10 / 0)
-- 3. Thay vì crash, pcall bắt lỗi
-- 4. Return success = false, result = error message
-- 5. Chương trình TIẾP TỤC CHẠY!
```

**2. pcall với function đã có tên:**
```lua
local function chia(a, b)
    return a / b
end

local success, result = pcall(chia, 10, 0)
→ pcall sẽ gọi chia(10, 0) và bắt lỗi

-- Nếu không có lỗi:
local success, result = pcall(chia, 10, 2)
→ success = true, result = 5
```

**3. xpcall (Extended pcall with error handler):**
```lua
local function errorHandler(err)
    print("Custom error handler: " .. err)
    → Có thể log, stack trace, v.v.
    return err
end

local success, result = xpcall(
    function()
        error("Có lỗi xảy ra!")
    end,
    errorHandler
)

→ success = false
→ result = error message
→ errorHandler được gọi TRƯỚC khi return
```

**4. error() - Tạo lỗi:**
```lua
local function chia(a, b)
    if b == 0 then
        error("Không thể chia cho 0!", 2)
        → Level 2: báo lỗi tại dòng gọi chia(), không phải dòng error()
    end
    return a / b
end

local success, result = pcall(chia, 10, 0)
→ success = false
→ result = "Không thể chia cho 0!"
```

**5. assert() - Validate:**
```lua
local function chia(a, b)
    assert(b ~= 0, "Không thể chia cho 0!")
    → Nếu b ~= 0 là false → error message = "Không thể chia cho 0!"
    return a / b
end

local success, result = pcall(chia, 10, 0)
→ success = false
→ result = "Không thể chia cho 0!"

-- Tương đương với:
if b ~= 0 then
    error("Không thể chia cho 0!")
end
```

**Thực hành:**
```lua
-- 1. Xử lý lỗi chia cho 0
local function chia(a, b)
    local success, result = pcall(function()
        return a / b
    end)

    if success then
        print("Kết quả: " .. result)
    else
        print("Lỗi: " .. result)
    end
end

chia(10, 2)  → "Kết quả: 5"
chia(10, 0)  → "Lỗi: attempt to divide by zero"

-- 2. Hàm an toàn với pcall
local function safeCall(func, ...)
    local args = {...}
    local success, result = pcall(func, unpack(args))

    if success then
        return true, result
    else
        warn("Lỗi: " .. tostring(result))
        return false, nil
    end
end

local ok, result = safeCall(function(a, b)
    return a + b
end, 5, 3)

if ok then
    print(result)  → 8
end

-- 3. Validate input
local function chiaAnToan(a, b)
    assert(type(a) == "number", "a phải là số")
    assert(type(b) == "number", "b phải là số")
    assert(b ~= 0, "Không thể chia cho 0!")

    return a / b
end

-- Chạy với pcall để bắt lỗi:
local success, result = pcall(chiaAnToan, 10, 0)
if not success then
    print(result)  → "Không thể chia cho 0!"
end
```

---

## PHẦN 4: ROBLOX SPECIFIC (Roblox chuyên dụng)

### 🎯 Bài 13: Roblox API Cơ Bản

#### 📖 Giải thích:
**Roblox API** là các service, objects, events được Roblox cung cấp để tương tác với game.

#### ⚙️ Cách hoạt động của Roblox API:

**1. Hierarchy (Cấu trúc cây):**
```
game (DataModel)
├── Workspace (Nơi chứa objects 3D)
│   ├── Part1
│   ├── Model1
│   │   └── Part2
│   └── ...
├── Players (Quản lý người chơi)
│   ├── Player1
│   ├── Player2
│   └── ...
├── ReplicatedStorage (Chia sẻ server-client)
├── ServerStorage (Chỉ server)
└── ...
```

**2. Truy cập objects:**
```lua
local part = workspace.Part1
→ Truy cập trực tiếp

local model = workspace.Model1
local part2 = model.Part2
→ Truy cập qua path: workspace.Model1.Part2

local part = workspace:FindFirstChild("Part1")
→ Tìm child theo tên (an toàn hơn)

local part = workspace:WaitForChild("Part1")
→ Đợi cho đến khi Part1 tồn tại (nếu chưa có)
```

**3. Properties:**
```lua
local part = workspace.Part

part.Name = "MyPart"  → Đặt tên
part.Size = Vector3.new(5, 1, 5)  → Kích thước
part.Position = Vector3.new(0, 10, 0)  → Vị trí
part.Anchored = true  → Cố định (không bị rơi)
part.CanCollide = false  → Không va chạm
```

**4. Events:**
```lua
-- Touched event
part.Touched:Connect(function(hit)
    → hit là object chạm vào part
    print("Chạm vào: " .. hit.Name)
end)

-- Flow:
-- 1. Khi có object chạm vào part
-- 2. Event được kích hoạt
-- 3. Function được gọi với hit là object chạm
-- 4. Code trong function chạy

-- Changed event
part.Changed:Connect(function(property)
    → property là tên property thay đổi
    print("Property " .. property .. " đã thay đổi")
end)

-- Flow:
-- 1. Khi bất kỳ property của part thay đổi
-- 2. Event được kích hoạt
-- 3. Function được gọi với tên property
```

**5. Player events:**
```lua
-- PlayerAdded: Khi player vào game
game.Players.PlayerAdded:Connect(function(player)
    → player là object Player mới vào
    print(player.Name .. " đã tham gia!")
end)

-- PlayerRemoving: Khi player rời game
game.Players.PlayerRemoving:Connect(function(player)
    print(player.Name .. " đã rời!")
end)

-- CharacterAdded: Khi character của player spawn
player.CharacterAdded:Connect(function(character)
    → character là Model của player
    print("Character đã spawn!")
end)
```

**Thực hành:**
```lua
-- 1. Kill brick
local part = workspace.KillBrill
part.Touched:Connect(function(hit)
    → hit có thể là bất kỳ phần nào của character
    local humanoid = hit.Parent:FindFirstChild("Humanoid")
    → Tìm Humanoid trong parent của hit

    if humanoid then
        → Tìm thấy Humanoid → đây là player
        humanoid.Health = 0  → Giết player
    end
end)

-- 2. Checkpoint system
local checkpoint = workspace.Checkpoint
checkpoint.Touched:Connect(function(hit)
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    → Lấy Player từ Character

    if player then
        → Lưu checkpoint cho player (sẽ học ở DataStore)
        local checkpointValue = player:FindFirstChild("Checkpoint")
        if not checkpointValue then
            checkpointValue = Instance.new("IntValue")
            checkpointValue.Name = "Checkpoint"
            checkpointValue.Parent = player
        end
        checkpointValue.Value = checkpoint.CheckpointId.Value
    end
end)

-- 3. Hiệu ứng khi player join
game.Players.PlayerAdded:Connect(function(player)
    print(player.Name .. " đã tham gia!")

    player.CharacterAdded:Connect(function(character)
        → Character vừa spawn
        print("Character đã spawn!")

        → Tìm Humanoid
        local humanoid = character:WaitForChild("Humanoid")

        → Hiệu ứng khi chết
        humanoid.Died:Connect(function()
            print(character.Name .. " đã chết!")
        end)
    end)
end)
```

---

### 🎯 Bài 14: UI & GUI

#### 📖 Giải thích:
**UI/GUI** là giao diện người dùng hiển thị trên màn hình (HUD, menu, v.v.).

#### ⚙️ Cách hoạt động của UI:

**1. UI Hierarchy:**
```
Player (Player object)
└── PlayerGui
    └── ScreenGui
        ├── Frame
        │   ├── TextLabel
        │   └── TextButton
        └── ImageButton
```

**2. ScreenGui:**
```lua
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
→ Tạo ScreenGui mới
screenGui.Parent = playerGui
→ Thêm vào PlayerGui của player

→ ScreenGui có các properties quan trọng:
screenGui.ResetOnSpawn = false  → Không xóa khi character respawn
screenGui.IgnoreGuiInset = true  → Bỏ qua topbar (10px)
```

**3. TextButton với Event:**
```lua
local textButton = Instance.new("TextButton")
textButton.Size = UDim2.new(0, 200, 0, 50)
→ UDim2.new(scaleX, offsetX, scaleY, offsetY)
→ scaleX = 0.5 → 50% chiều rộng màn hình
→ offsetX = 100 → +100 pixels

textButton.Position = UDim2.new(0.5, -100, 0.5, -25)
→ Trung tâm màn hình (50% - 100px, 50% - 25px)

textButton.AnchorPoint = Vector2.new(0.5, 0.5)
→ Anchor point ở trung tâm (mặc định là top-left)

textButton.Text = "Click me!"
textButton.Parent = screenGui

→ Events:
textButton.MouseButton1Click:Connect(function()
    → Click chuột trái
    print("Clicked!")
end)

textButton.MouseEnter:Connect(function()
    → Khi chuột đi vào button
    textButton.BackgroundColor3 = Color3.new(1, 0, 0)  → Đỏ
end)

textButton.MouseLeave:Connect(function()
    → Khi chuột rời button
    textButton.BackgroundColor3 = Color3.new(0, 0, 1)  → Xanh
end)
```

**4. TweenService (Animation):**
```lua
local TweenService = game:GetService("TweenService")

local frame = script.Parent
local goal = {}
goal.Position = UDim2.new(0.5, -100, 0.5, -25)
goal.BackgroundColor3 = Color3.new(1, 0, 0)

local tweenInfo = TweenInfo.new(
    1,              → Duration (giây)
    Enum.EasingStyle.Quad,  → Easing style
    Enum.EasingDirection.Out,  → Easing direction
    0,              → Repeat count (-1 = vô hạn)
    false,          → Reverses
    0               → Delay time
)

local tween = TweenService:Create(frame, tweenInfo, goal)
tween:Play()

→ Flow:
→ 1. Tạo tween với object, info, goal
→ 2. Play tween
→ 3. Frame di chuyển từ vị trí cũ đến goal trong 1 giây
```

**Thực hành:**
```lua
-- 1. Nút click để tăng điểm
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local textButton = Instance.new("TextButton")
textButton.Size = UDim2.new(0, 200, 0, 50)
textButton.Position = UDim2.new(0.5, -100, 0.5, -25)
textButton.AnchorPoint = Vector2.new(0.5, 0.5)
textButton.Text = "Click me!"
textButton.Parent = screenGui

local diem = 0
textButton.MouseButton1Click:Connect(function()
    diem = diem + 1
    textButton.Text = "Điểm: " .. diem
end)

-- 2. Thanh máu (Health Bar)
local healthBar = script.Parent  → Frame
local humanoid = script.Parent.Parent.Parent:WaitForChild("Humanoid")

humanoid.HealthChanged:Connect(function(health)
    → Khi HP thay đổi
    local percent = health / humanoid.MaxHealth
    → Tính phần trăm HP (0 đến 1)

    healthBar.Size = UDim2.new(percent, 0, 1, 0)
    → Thay đổi width theo phần trăm

    → Đổi màu theo HP:
    if percent > 0.5 then
        healthBar.BackgroundColor3 = Color3.new(0, 1, 0)  → Xanh lá
    elseif percent > 0.25 then
        healthBar.BackgroundColor3 = Color3.new(1, 1, 0)  → Vàng
    else
        healthBar.BackgroundColor3 = Color3.new(1, 0, 0)  → Đỏ
    end
end)

-- 3. Shop UI với frame ẩn/hiện
local shopButton = script.Parent.ShopButton
local shopFrame = script.Parent.ShopFrame
shopFrame.Visible = false  → Ẩn ban đầu

shopButton.MouseButton1Click:Connect(function()
    shopFrame.Visible = not shopFrame.Visible
    → Toggle (ẩn ↔ hiện)
end)
```

---

### 🎯 Bài 15: Remote Functions & Events

#### 📖 Giải thích:
**Remote Functions/Events** là cách giao tiếp giữa Client và Server (vì Client không thể gọi trực tiếp Server function và ngược lại).

#### ⚙️ Cách hoạt động của Remote:

**1. Client-Server Model:**
```
Server (Script)                    Client (LocalScript)
     │                                     │
     │          ┌──────────────────┐       │
     │          │  RemoteEvent     │       │
     │          │  (ReplicatedStorage)      │
     │          └──────────────────┘       │
     │                  │                 │
     │  FireClient()    │    FireServer()  │
     ├──────────────────┼─────────────────┤
     │                  │                 │
     ↓                  ↓                 ↓
Server        ←→   Remote      ←→    Client
```

**2. RemoteEvent (2-way, không return):**
```lua
-- Script (Server):
local repStorage = game:GetService("ReplicatedStorage")
local remoteEvent = repStorage:WaitForChild("RemoteEvent")

remoteEvent.OnServerEvent:Connect(function(player, action, data)
    → player: Player gửi request (tự động)
    → action, data: Data người chơi gửi

    if action == "napTien" then
        print(player.Name .. " muốn nạp " .. data .. " xu")
        → Xử lý nạp tiền
        → Gửi kết quả về client:
        remoteEvent:FireClient(player, "thanhCong", data * 100)
    end
end)

-- LocalScript (Client):
local repStorage = game:GetService("ReplicatedStorage")
local remoteEvent = repStorage:WaitForChild("RemoteEvent")

remoteEvent.OnClientEvent:Connect(function(action, data)
    → Nhận data từ server
    if action == "thanhCong" then
        print("Nạp thành công! Nhận được " .. data .. " xu")
    end
end)

→ Gửi lên server:
remoteEvent:FireServer("napTien", 100)

→ Flow:
→ 1. Client: FireServer("napTien", 100)
→ 2. RemoteEvent chuyển request lên server
→ 3. Server: OnServerEvent nhận (player, "napTien", 100)
→ 4. Server xử lý
→ 5. Server: FireClient(player, "thanhCong", 10000)
→ 6. RemoteEvent chuyển response về client
→ 7. Client: OnClientEvent nhận ("thanhCong", 10000)
```

**3. RemoteFunction (2-way, có return):**
```lua
-- Script (Server):
local repStorage = game:GetService("ReplicatedStorage")
local remoteFunction = repStorage:WaitForChild("RemoteFunction")

remoteFunction.OnServerInvoke = function(player, num1, num2)
    → Khi client gọi, function này chạy
    → PHẢI return giá trị!
    return num1 + num2
end

-- LocalScript (Client):
local result = remoteFunction:InvokeServer(5, 3)
→ Gọi server và ĐỢI kết quả
print(result)  → 8

→ Flow:
→ 1. Client: InvokeServer(5, 3)
→ 2. Client ĐÓNG BĂNG (block) chờ kết quả
→ 3. Server: OnServerInvoke nhận (player, 5, 3)
→ 4. Server tính: 5 + 3 = 8
→ 5. Server return 8
→ 6. Client nhận 8
→ 7. Client TIẾP TỤC CHẠY
```

**4. Broadcast (Server → All Clients):**
```lua
-- Script (Server):
remoteEvent:FireAllClients("message", "Hello everyone!")
→ Gửi đến TẤT CẢ clients

remoteEvent:FireAllClients("announcement", "Server sẽ restart trong 5 phút!")

-- LocalScript (Client):
remoteEvent.OnClientEvent:Connect(function(action, data)
    if action == "message" then
        print("Server: " .. data)
    end
end)
```

**Thực hành:**
```lua
-- Script (Server):
local repStorage = game:GetService("ReplicatedStorage")
local remoteEvent = repStorage:WaitForChild("RemoteEvent")

remoteEvent.OnServerEvent:Connect(function(player, action, data)
    if action == "napTien" then
        → Validate
        if type(data) ~= "number" or data <= 0 then
            remoteEvent:FireClient(player, "error", "Số tiền không hợp lệ!")
            return
        end

        → Xử lý nạp tiền
        local coins = player.leaderstats.Coins
        local nhanDuoc = data * 100
        coins.Value = coins.Value + nhanDuoc

        → Gửi kết quả
        remoteEvent:FireClient(player, "success", nhanDuoc)

    elseif action == "muaItem" then
        → Logic mua item
        local itemName = data
        local price = 100  → Giả sử

        if player.leaderstats.Coins.Value >= price then
            player.leaderstats.Coins.Value -= price
            remoteEvent:FireClient(player, "success", "Đã mua " .. itemName)
        else
            remoteEvent:FireClient(player, "error", "Không đủ tiền!")
        end
    end
end)

-- LocalScript (Client):
local repStorage = game:GetService("ReplicatedStorage")
local remoteEvent = repStorage:WaitForChild("RemoteEvent")

local napButton = script.Parent
napButton.MouseButton1Click:Connect(function()
    remoteEvent:FireServer("napTien", 100)
end)

remoteEvent.OnClientEvent:Connect(function(action, data)
    if action == "success" then
        if type(data) == "number" then
            print("Nạp thành công! Nhận được " .. data .. " xu")
        else
            print(data)  → String message
        end
    elseif action == "error" then
        warn("Lỗi: " .. data)
    end
end)
```

---

### 🎯 Bài 16: Data Store System

#### 📖 Giải thích:
**DataStore** là hệ thống lưu trữ dữ liệu của Roblox, cho phép lưu progress của player khi họ rời game.

#### ⚙️ Cách hoạt động của DataStore:

**1. DataStoreService:**
```lua
local DataStoreService = game:GetService("DataStoreService")
local playerDataStore = DataStoreService:GetDataStore("PlayerData")
→ "PlayerData" là tên DataStore (có thể đặt tên bất kỳ)

→ Trong Roblox Cloud:
┌──────────────────────────────┐
│  DataStore: "PlayerData"     │
│  ├─ "Player_123456"          │  ← Key-value pair
│  │   └─ {coins: 100, ...}    │
│  ├─ "Player_789012"          │
│  │   └─ {coins: 50, ...}     │
│  └─ ...                      │
└──────────────────────────────┘
```

**2. GetAsync (Lấy data):**
```lua
local success, data = pcall(function()
    return playerDataStore:GetAsync("Player_123456")
end)

→ Flow:
→ 1. Gửi request lên Roblox server
→ 2. Tìm key "Player_123456" trong DataStore
→ 3. Nếu tìm thấy → return data
→ 4. Nếu không tìm thấy → return nil
→ 5. Nếu có lỗi (network, v.v.) → error
→ 6. pcall bắt lỗi

if success and data then
    print("Coins: " .. data.coins)
else
    print("Không có data hoặc lỗi!")
end
```

**3. SetAsync (Lưu data):**
```lua
local data = {
    coins = 100,
    level = 5,
    xp = 500
}

local success, err = pcall(function()
    playerDataStore:SetAsync("Player_123456", data)
end)

→ Flow:
→ 1. Serialize data (chuyển thành JSON string)
→ 2. Gửi lên Roblox server
→ 3. Lưu vào DataStore với key "Player_123456"
→ 4. Nếu thành công → success = true
→ 5. Nếu lỗi → success = false, err = error message

if not success then
    warn("Không thể lưu data: " .. err)
end
```

**4. UpdateAsync (Lưu an toàn hơn):**
```lua
local success, err = pcall(function()
    playerDataStore:UpdateAsync("Player_123456", function(oldData)
        → oldData là data hiện tại trong DataStore

        local newData = oldData or {}
        → Nếu chưa có data, tạo table rỗng

        newData.coins = (newData.coins or 0) + 100
        → Cập nhật data

        return newData  → Return data MỚI để lưu
    end)
end)

→ Flow:
→ 1. Lấy data hiện tại (oldData) từ DataStore
→ 2. Chạy function với oldData
→ 3. Function return newData
→ 4. Lưu newData vào DataStore

→ Tại sao nên dùng UpdateAsync?
→ Tránh conflict khi nhiều requests cùng lúc!
→ Ví dụ: Player mua 2 item cùng lúc
→ - SetAsync: Có thể bị ghi đè
→ - UpdateAsync: Chắc chắn cả 2 đều được tính
```

**5. Limit (Giới hạn):**
```lua
→ Limits của DataStore:
→ - GetAsync: 60 + playerCount * 10 mỗi phút
→ - SetAsync: 60 + playerCount * 10 mỗi phút
→ - Data size: Max 4MB per key
→ - Key length: Max 50 characters
→ - Value types: Chỉ lưu được table, number, string, boolean

→ KHÔNG THỂ lưu:
→ - Functions
→ - Userdata (Objects, Instances, v.v.)
→ - Metatables

→ Giải pháp: Chuyển thành dạng có thể lưu
local object = workspace.Part  → KHÔNG THỂ lưu!

→ Thay vào đó, lưu properties:
local saveData = {
    position = {x = 10, y = 20, z = 30},  → Có thể lưu
    size = {x = 5, y = 5, z = 5},
    name = "MyPart"
}
```

**Thực hành:**
```lua
-- Hệ thống lưu data đầy đủ
local DataStoreService = game:GetService("DataStoreService")
local playerDataStore = DataStoreService:GetDataStore("PlayerData")

local function loadPlayerData(player)
    local success, data = pcall(function()
        return playerDataStore:GetAsync("Player_" .. player.UserId)
    end)

    if success and data then
        → Data tồn tại
        print("Đã load data cho " .. player.Name)
        return data
    else
        → Không có data hoặc lỗi
        print("Tạo data mới cho " .. player.Name)
        return {
            coins = 0,
            level = 1,
            xp = 0,
            items = {}
        }
    end
end

local function savePlayerData(player, data)
    local success, err = pcall(function()
        playerDataStore:UpdateAsync("Player_" .. player.UserId, function(oldData)
            → Kiểm tra và merge data (tránh mất data)
            local merged = oldData or {}
            for key, value in pairs(data) do
                merged[key] = value
            end
            return merged
        end)
    end)

    if not success then
        warn("Không thể lưu data cho " .. player.Name .. ": " .. err)
        return false
    end
    return true
end

→ Player added
game.Players.PlayerAdded:Connect(function(player)
    → Tạo leaderstats
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local coins = Instance.new("IntValue")
    coins.Name = "Coins"
    coins.Parent = leaderstats

    → Load data
    local data = loadPlayerData(player)
    coins.Value = data.coins

    → Auto-save mỗi 60 giây
    while true do
        task.wait(60)
        local currentData = {
            coins = player.leaderstats.Coins.Value
        }
        savePlayerData(player, currentData)
    end
end)

→ Player removing (save lần cuối)
game.Players.PlayerRemoving:Connect(function(player)
    local data = {
        coins = player.leaderstats.Coins.Value,
        level = 1,
        xp = 0
    }
    savePlayerData(player, data)
end)
```

---

## PHẦN 5: DỰ ÁN THỰC CHIẾN (Projects)

### 🎮 Project 1: Obby (Obstacle Course)
**Yêu cầu:**
- Tạo 10 chướng ngại vật
- Checkpoint system
- Leaderboard (thời gian hoàn thành)
- Kill bricks
- Moving platforms

**Kỹ năng:** Workspace, Events, DataStore

---

### 🎮 Project 2: Tycoon Game
**Yêu cầu:**
- Hệ thống tiền tệ
- Mua các nút để mở rộng
- Tự động kiếm tiền
- Upgrades
- Save/load data

**Kỹ năng:** DataStore, UI, RemoteEvents, OOP

---

### 🎮 Project 3: Battle Arena
**Yêu cầu:**
- Chọn vũ khí
- Hệ thống HP
- Điểm giết/chết
- Leaderboard
- Respawn system

**Kỹ năng:** Combat system, Teams, RemoteEvents, DataStore

---

### 🎮 Project 4: Simulation Game (ví dụ: Pet Simulator)
**Yêu cầu:**
- Thu thập pet
- Hatching eggs
- Pet có rarity
- Upgrade pet
- Trading system

**Kỹ năng:** DataStore, UI, Inventory system, OOP, Complex logic

---

### 🎮 Project 5: Full RPG Game
**Yêu cầu:**
- Hệ thống level & XP
- Skills & Abilities
- Quest system
- Inventory & Equipment
- Enemies & Bosses
- Save/load progress

**Kỹ năng:** Tất cả kỹ năng đã học + Advanced systems

---

## 📚 TÀI NGUYÊN HỌC TẬP THÊM

### Official Documentation
- [Roblox Creator Hub](https://create.roblox.com/)
- [Luau Reference](https://create.roblox.com/docs/reference/engine/libraries/luau)
- [Roblox API Reference](https://create.roblox.com/docs/reference/engine)

### YouTube Channels (Tiếng Việt)
- AlvinBlox
- TheDevKing
- Rozado

### YouTube Channels (Tiếng Anh)
- Roblox Developer
- CodeBay
- Zapperdex

### Practice Platforms
- Roblox Studio (Tự tạo project)
- Roblox DevForum (Xem và hỏi bài)
- GitHub (Xem source code mở)

---

## 💡 MẸO HỌC TẬP HIỆU QUẢ

1. **Hiểu sâu trước khi code**: Đọc phần "Cách hoạt động" kỹ để hiểu mechanism
2. **Vẽ diagram**: Vẽ flow diagram trên giấy khi gặp logic phức tạp
3. **Debug với print():** In ra giá trị biến để xem flow hoạt động
4. **Học mỗi ngày**: Dành ít nhất 30-60 phút mỗi ngày
5. **Thực hành nhiều**: Đừng chỉ đọc, hãy code thật!
6. **Xem code người khác**: Học từ open source projects
7. **Tham gia cộng đồng**: Tham gia Discord, Forum
8. **Làm project cá nhân**: Tự làm game theo ý tưởng

---

## 🎯 KIỂM TRA TIẾN ĐỘ

Đánh giá skill của bạn:

### Kiến thức lý thuyết:
- [ ] Hiểu cách biến hoạt động trong memory
- [ ] Hiểu scope (local, global, block)
- [ ] Hiểu call stack của function
- [ ] Hiểu table là reference type
- [ ] Hiểu string là immutable
- [ ] Hiểu metatables và __index
- [ ] Hiểu coroutine flow
- [ ] Hiểu pcall và error handling

### Kỹ năng thực hành:
- [ ] Biến & Kiểu dữ liệu
- [ ] Điều kiện & Vòng lặp
- [ ] Functions cơ bản
- [ ] Tables & Arrays
- [ ] String manipulation
- [ ] Modules
- [ ] Metatables & OOP
- [ ] Coroutines
- [ ] Error Handling
- [ ] Roblox Workspace & Objects
- [ ] UI/GUI
- [ ] Remote Events/Functions
- [ ] DataStore
- [ ] Đã hoàn thành ít nhất 3 projects

---

**Chúc bạn học tốt! 🚀**

Nhớ: "Hiểu sâu, code nhiều, tạo ra những game tuyệt vời!"
