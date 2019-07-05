//: [Previous](@previous)

/*
 
 94. 二叉树的中序遍历
 
 给定一个二叉树，返回它的中序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [1,3,2]
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        //inoderRecursiveTraversal(root)
        onoderTraversal(root)
        
        return result
    }
    
    // 递归法
    func inoderRecursiveTraversal(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        inoderRecursiveTraversal(root!.left)
        result.append(root!.val)
        inoderRecursiveTraversal(root!.right)
    }
    
    // 迭代法
    func onoderTraversal(_ root: TreeNode?) {
        var currentNode = root
        var nodeStack = [TreeNode]()
        
        while currentNode != nil || !nodeStack.isEmpty {
            if currentNode != nil {
                nodeStack.append(currentNode!)
                currentNode = currentNode?.left
            } else {
                let temp = nodeStack.popLast()
                result.append(temp!.val)
                currentNode = temp!.right
            }
        }
    }
    
}

//: [Next](@next)
