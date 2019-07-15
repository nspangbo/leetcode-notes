//: [Previous](@previous)

/*
 
 206. 反转链表
 
 反转一个单链表。
 
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        //return reverseListTraversal(head)
        return reverseListRecursive(head)
    }
    
    func reverseListRecursive(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        if head.next == nil {
            return head
        }
        
        let result = reverseListRecursive(head.next)
        head.next?.next = head
        head.next = nil
        
        return result
    }
    
    func reverseListTraversal(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var prev: ListNode? = nil
        var current: ListNode? = head
        
        while current != nil {
            let temp = current!.next
            current!.next = prev
            prev = current
            current = temp
        }
        
        return prev
    }
}

//: [Next](@next)
