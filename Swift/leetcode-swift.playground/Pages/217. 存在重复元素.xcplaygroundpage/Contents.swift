//: [Previous](@previous)

/*
 
 217. 存在重复元素
 
 给定一个整数数组，判断是否存在重复元素。
 
 如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
 
 示例 1:
 
 输入: [1,2,3,1]
 输出: true
 示例 2:
 
 输入: [1,2,3,4]
 输出: false
 示例 3:
 
 输入: [1,1,1,3,3,4,3,2,4,2]
 输出: true
 
 方案：
 1. 遍历数组，将其每个元素放到 set 中，发现有重复即得解
 2. 先对数组排序，然后遍历，相邻元素有重复即得解
 3. 遍历数组，将每个元素加以之后再看是否存在相同元素（超出时间限制）
 
 */

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // boundary conditions
        if nums.count < 2 {
            return false
        }
        
        let way = 1
        if way == 1 {
            var set = Set<Int>.init()
            for (_, num) in nums.enumerated() {
                if set.contains(num) {
                    return true
                } else {
                    set.insert(num)
                }
            }
            return false
            
        } else if way == 2 {
            
        } else if way == 3 {
            var newNums = nums
            for (index, num) in newNums.enumerated() {
                newNums[index] += 1
                if newNums.contains(num) {
                    return true
                } else {
                    newNums[index] = num
                }
            }
            return false
        }
    }
}

// test
print(Solution.init().containsDuplicate([1,2,3,1]))
print(Solution.init().containsDuplicate([1,2,3,4]))
print(Solution.init().containsDuplicate([1,1,1,3,3,4,3,2,4,2]))

//: [Next](@next)
