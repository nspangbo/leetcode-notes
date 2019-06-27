//: [Previous](@previous)

/*
 
 136. 只出现一次的数字
 
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 
 说明：
 
 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 
 示例 1:
 
 输入: [2,2,1]
 输出: 1
 示例 2:
 
 输入: [4,1,2,1,2]
 输出: 4
 
 方案：
 1. 先排序，然后遍历
 2. 先排序，只出现一次的元素一定在偶数位置，如果偶数位置的数和其后的数不相等， 得解
 3. 出现两次的数做异或运算之后结果为 0，0 和任何数异或运算结果为后者本身，直接遍历
 
 */

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for (_, num) in nums.enumerated() {
            result = result ^ num
        }
        return result
    }
}

// test
Solution.init().singleNumber([2,2,1])
Solution.init().singleNumber([4,1,2,1,2])

//: [Next](@next)
