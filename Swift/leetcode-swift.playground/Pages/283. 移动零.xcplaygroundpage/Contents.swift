//: [Previous](@previous)

/*
 
 283. 移动零
 
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 
 示例:
 
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:
 
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 
 */

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var currentIndex = nums.startIndex
        
        for index in nums.startIndex ..< nums.endIndex {
            if (nums[index] != 0) {
                nums[currentIndex] = nums[index]
                currentIndex += 1
            } else {
                
            }
        }
        
        for index in currentIndex ..< nums.endIndex {
            nums[index] = 0
        }
    }
}

// test
var nums = [0,1,0,3,12]
Solution.init().moveZeroes(&nums)

//: [Next](@next)
