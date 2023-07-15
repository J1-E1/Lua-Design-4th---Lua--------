# Lua Design(4th)-(Lua程序设计第四版)
 (Lua程序设计第四版)

reference：
https://github.com/0kk470/pil4

# 数据结构

## 字典形式
参考了Dictionary.lua（来源： EmmyLua的群文件） 的代码。

问题
1.由于代码第53行获取keyList的长度函数无法使用，所以尝试在表空间中添加 **count** 参数，但是怀疑将无法添加 count key 的参数。

- table.getn(self.keyList) 是可以使用的 ，（待查：代码跳转似乎没有）
- 使用 self[key] = value 的形式直接添加的原因是
	- ** print(D1.valueList["the one"]) ** ，可以这样使用
	- 而不是 print(D1.valueList["the one"])

## 对象池

为解决游戏中在lua存储表与Scrollview自动生成之间的冲突。

参考
1. https://github.com/RayStudio36/pool.lua