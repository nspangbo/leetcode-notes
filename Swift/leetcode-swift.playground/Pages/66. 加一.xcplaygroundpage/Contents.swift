//: [Previous](@previous)

/*
 
 66. 加一
 
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 
 最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
 
 你可以假设除了整数 0 之外，这个整数不会以零开头。
 
 示例 1:
 
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 示例 2:
 
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
 
 */

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        
        var tag = 1
        var currentIndex = digits.endIndex - 1
        while currentIndex >= digits.startIndex {
            let sum = digits[currentIndex] + tag
            result[currentIndex] = sum % 10
            
            if sum > 9 {
                tag = 1
            } else {
                tag = 0
            }
            
            currentIndex -= 1
        }
        
        if tag == 1 {
            result.insert(1, at: 0)
        }
        
        return result
    }
}

// test
Solution.init().plusOne([1,2,3])
Solution.init().plusOne([4,3,2,1])

//: [Next](@next)
