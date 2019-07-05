//: [Previous](@previous)

/*
 
 144. 二叉树的前序遍历
 
 给定一个二叉树，返回它的 前序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [1,2,3]
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        
        //preoderRecurciveTraversal(root)
        preoderTraversal(root)
        
        return result
    }
    
    // 递归法
    func preoderRecurciveTraversal(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        preoderRecurciveTraversal(root!.left)
        result.append(root!.val)
        preoderRecurciveTraversal(root!.right)
    }
    
    // 迭代法
    func preoderTraversal(_ root: TreeNode?) {
        var currentNode = root
        var nodeStack = [TreeNode]()
        
        while currentNode != nil || !nodeStack.isEmpty {
            if currentNode != nil {
                result.append(currentNode!.val)
                nodeStack.append(currentNode!)
                currentNode = currentNode?.left
            } else {
                currentNode = nodeStack.popLast()?.right
            }
        }
        
    }
}

//: [Next](@next)
