//: [Previous](@previous)

/*
 
 145. 二叉树的后序遍历
 
 给定一个二叉树，返回它的 后序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [3,2,1]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 */

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    var result = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {

        //postoderRecursiveTraversal(root)
        
        return result
    }
    
    // 递归法
    func postoderRecursiveTraversal(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        postoderRecursiveTraversal(root!.left)
        postoderRecursiveTraversal(root!.right)
        result.append(root!.val)
    }
    
    // 迭代法
    func postoderTraversal(_ root: TreeNode?) {
        
    }
}

//: [Next](@next)
