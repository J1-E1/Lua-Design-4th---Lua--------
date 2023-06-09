---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2023/7/9 13:24
---

--- 叙述
-- 返回 此序号下元素的值
-- 迭代器，返回一个t的闭包
function values(t)
    local i = 0
    return function() i = i + 1 ; return t[i]  end
end

-- 迭代调用
--[[
t = {10, 20 ,30}
for element in values(t) do
    print(element)
end
]]--

--- 无状态迭代器
-- 调用
a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i , v)
end

--
local function iter(t,i)
    i = i + 1
    local v = t[i]
    if v then
        return i,v
    end
end

function ipairs(t)
    return iter, t, 0
end

--- 练习
--- 练习18.1 ： 请编写一个迭代器 fromto ，使得如下循环与数值型 for 等价：
-- formoto: 数值型： for i=1, 10  do print(i) end
function fromto(n,m)
    local i = n
    local i_FLag = true
    return function()
        -- for first element n
        if(i_FLag) then
            i_FLag = false; return i
        end

        if(i < m)then
            i = i + 1; return i
        end
    end
end

-- 无状态
local function iter_fromto(v_end, v_start, i)
    i = i + 1
    -- start from v_start : 1+1-1; 1+2-1
    local v = v_start + i - 1
    if v <= v_end then
        return i,v
    end
end

function ipairs_fromto(t_n, t_m)
    return iter_fromto, t_m, t_n
end

-- test
for i in fromto(1,3)do
    print(i)
end
--- 练习18.2 ：向上一个练习中的迭代器增加一个步进的参数。你能否也用元状态迭代器实现？

function fromto(n,m, step)
    local step = step or 1
    local i = n
    local i_FLag = true
    return function()
        -- for first element n
        if(i_FLag) then
            i_FLag = false; return i
        end

        if(i < m)then
            i = i + step; return i
        end
    end
end