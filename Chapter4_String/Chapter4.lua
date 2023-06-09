---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2023/6/4 21:16
---

--- 练习 4.1 lua字符串处理一下XML片段
-- 常用方法
local s1 = "<![CDATA[\n   Hello world\n]]>"

-- 长注释，可以使用[[]] 嵌套的方式处理多行
-- 或 使用[=[]=] 系统只有遇到相同数量等号的两个右方括号时才会结束

local s2 = [=[
<![CDATA[
   Hello world
]]>
]=]

-- 测试
print(s1)
print("========")
print(s2)

---练习 4.2

--- 练习 4.3 编写一函数，实现在某个字符串的指定位置插入另一个字符串

function insert( str1 , index , str2)
    if str1~= nil then
        if str2 == nil or index == nil then
            print("no change \n")
            return str1
        else
            local len = string.len(str1)
            local part1 = string.sub(str1, 1, index-1)
            local part2 = string.sub(str1, index, len)

            if(index == 1)then
                return str2 .." ".. str1
            elseif (index == len) then
                return str1 .." ".. str2
            else
                -- 检查part1 最后一位是不是“ ”
                if (part1:sub(index-1) == " ")then
                    return part1 .. str2 .." ".. part2
                else
                    return part1.." " .. str2 .." ".. part2
                end
            end
        end

    end
end

-- 测试
local s1 = insert("hello world",1,"start:")
print(s1)

local s2= insert("hello world",7,"small")
print(s2)