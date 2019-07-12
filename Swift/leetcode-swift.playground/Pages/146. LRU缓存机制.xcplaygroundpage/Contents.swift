//: [Previous](@previous)

/*
 
 146. LRU缓存机制
 
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
 
 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。
 
 进阶:
 
 你是否可以在 O(1) 时间复杂度内完成这两种操作？
 
 示例:
 
 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
 
 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得密钥 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得密钥 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4
 
 */

import Foundation

class LRUCache {
    
    private class DLinkedNode {
        let key: Int
        var value: Int
        var prev: DLinkedNode?
        var next: DLinkedNode?
        
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
            self.prev = nil
            self.next = nil
        }
    }
    
    private func addNode(_ node: DLinkedNode) {
        node.next = self.head.next
        node.prev = self.head
        
        self.head.next?.prev = node
        self.head.next = node
    }
    
    private func removeNode(_ node: DLinkedNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    private func moveToHead(_ node: DLinkedNode) {
        removeNode(node)
        addNode(node)
    }
    
    private func popTail() -> DLinkedNode {
        let node = self.tail.prev!
        
        node.prev?.next = tail
        tail.prev = node.prev
        
        return node
    }
    
    private var cache: Dictionary<Int, DLinkedNode>
    private let capacity: Int
    private var head, tail: DLinkedNode
    
    /// MARK: - Interface
    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = Dictionary<Int, DLinkedNode>.init(minimumCapacity: capacity)
        
        head = DLinkedNode.init(key: 0, value: 0)
        tail = DLinkedNode.init(key: 0, value: 0)
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = self.cache[key] {
            moveToHead(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = self.cache[key] {
            node.value = value
            moveToHead(node)
        } else {
            let node = DLinkedNode.init(key: key, value: value)
            if self.cache.keys.count >= self.capacity {
                self.cache.removeValue(forKey: popTail().key)
            }
            self.cache[key] = node
            addNode(node)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

//: [Next](@next)
