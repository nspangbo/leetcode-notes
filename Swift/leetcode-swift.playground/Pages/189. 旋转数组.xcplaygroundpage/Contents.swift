//: [Previous](@previous)

/*
 
 189. 旋转数组
 
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 
 示例 1:
 
 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 示例 2:
 
 输入: [-1,-100,3,99] 和 k = 2
 输出: [3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]
 说明:
 
 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 要求使用空间复杂度为 O(1) 的 原地 算法。
 
 方案：
 1. 每次移动 1 步，移动 k 次（超出时间限制）
 2. 把第一个元素直接移动 k 步，直到所有元素都完成移动，一共移动 nums.count 次
 3. 分别旋转前 nums.count-k 位和后 k 位，再旋转整个数组
 
 */

import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        // boundary conditions
        if nums.count < 2 {
            return
        }
        
        let steper = k % nums.count
        if steper == 0 {
            return
        }
        
        let way = 3
        if way == 1 {
            // ways-1
            var step = 0
            while step < steper {
                rotateOneStep(&nums)
                step += 1
            }
            
        } else if way == 2 {
            // ways-2
            
        } else if way == 3 {
            // ways-3
            rotateNums(&nums, in: Range<Int>.init(uncheckedBounds: (nums.startIndex, nums.endIndex - steper - 1)))
            rotateNums(&nums, in: Range<Int>.init(uncheckedBounds: (nums.endIndex - steper, nums.endIndex - 1)))
            rotateNums(&nums, in: Range<Int>.init(uncheckedBounds: (nums.startIndex, nums.endIndex - 1)))
        }
        
    }
    
    func rotateOneStep(_ nums: inout [Int]) {
        var newValue = nums.last!
        var tempValue = nums.last!
        
        for (index, _) in nums.enumerated() {
            tempValue = nums[index]
            nums[index] = newValue
            newValue = tempValue
        }
    }
    
    func rotateNums(_ nums: inout [Int], in range: Range<Int>) {
        var head = range.lowerBound
        var tail = range.upperBound
        
        while head < tail {
            let temp = nums[head]
            nums[head] = nums[tail]
            nums[tail] = temp
            
            head += 1
            tail -= 1
        }
    }
}


// test
var nums1 = [1,2,3,4,5,6,7]
Solution.init().rotate(&nums1, 3)

var nums2 = [-1,-100,3,99]
Solution.init().rotate(&nums2, 2)


//: [Next](@next)
