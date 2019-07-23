//: [Previous](@previous)

/*
 
 747. 至少是其他数字两倍的最大数
 
 在一个给定的数组nums中，总是存在一个最大元素 。
 
 查找数组中的最大元素是否至少是数组中每个其他数字的两倍。
 
 如果是，则返回最大元素的索引，否则返回-1。
 
 示例 1:
 
 输入: nums = [3, 6, 1, 0]
 输出: 1
 解释: 6是最大的整数, 对于数组中的其他整数,
 6大于数组中其他元素的两倍。6的索引是1, 所以我们返回1.
   
 
 示例 2:
 
 输入: nums = [1, 2, 3, 4]
 输出: -1
 解释: 4没有超过3的两倍大, 所以我们返回 -1.
   
 
 提示:
 
 nums 的长度范围在[1, 50].
 每个 nums[i] 的整数范围在 [0, 99].
 
 */

import Foundation

class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        if nums.count == 1 {
            return 0
        }
        
        var maxIndex = 0
        var max = -1
        var secMaxIndex = 0
        var secMax = -1
        for (index, num) in nums.enumerated() {
            if num > max {
                secMax = max
                secMaxIndex = maxIndex
                
                max = num
                maxIndex = index
            } else if num > secMax {
                secMax = num
                secMaxIndex = index
            }
        }
        
        if nums[secMaxIndex] * 2 <= nums[maxIndex] {
            return maxIndex
        }
        
        return -1
    }
}

Solution.init().dominantIndex([0,0,2,3])

//: [Next](@next)
