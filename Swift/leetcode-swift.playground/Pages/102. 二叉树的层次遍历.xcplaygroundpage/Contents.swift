//: [Previous](@previous)

/*
 
 102. 二叉树的层次遍历
 
 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
 
 例如:
 给定二叉树: [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 返回其层次遍历结果：
 
 [
 [3],
 [9,20],
 [15,7]
 ]
 
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
    var result = [[Int]]()
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return result
        }
        
        var nodeQueue = [TreeNode]()
        nodeQueue.append(root)

        while !nodeQueue.isEmpty {
            var nodes = [Int]()
            let length = nodeQueue.count
            
            for _ in 0 ..< length {
                let currentNode = nodeQueue.removeFirst()
                nodes.append(currentNode.val)
                
                if let leftNode = currentNode.left {
                    nodeQueue.append(leftNode)
                }
                if let rightNode = currentNode.right {
                    nodeQueue.append(rightNode)
                }
            }
            
            result.append(nodes)
        }
        
        return result
    }
}

//: [Next](@next)
