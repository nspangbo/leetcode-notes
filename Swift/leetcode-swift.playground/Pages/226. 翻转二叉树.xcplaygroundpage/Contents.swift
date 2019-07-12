//: [Previous](@previous)

/*
 
 226. 翻转二叉树
 
 翻转一棵二叉树。
 
 示例：
 
 输入：
 
 4
 /   \
 2     7
 / \   / \
 1   3 6   9
 输出：
 
 4
 /   \
 7     2
 / \   / \
 9   6 3   1
 备注:
 这个问题是受到 Max Howell 的 原问题 启发的 ：
 
 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。
 
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        //recursiveInvertTree(root)
        traversalInvertTree(root)
        return root
    }
    
    func recursiveInvertTree(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        
        let right = root?.right
        root?.right = root?.left
        root?.left = right
        
        recursiveInvertTree(root?.left)
        recursiveInvertTree(root?.right)
    }
    
    func traversalInvertTree(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        
        var queue = [TreeNode]()
        queue.append(root!)
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            let right = current.right
            current.right = current.left
            current.left = right
            
            if let node = current.left {
                queue.append(node)
            }
            if let node = current.right {
                queue.append(node)
            }
        }
    }
}

//: [Next](@next)
