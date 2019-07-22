//: [Previous](@previous)

/*
 
 346. 数据流中的移动平均值
 
 给定一个整数数据流和一个窗口大小，根据该滑动窗口的大小，计算其所有整数的移动平均值。
 
 示例:
 
 MovingAverage m = new MovingAverage(3);
 m.next(1) = 1
 m.next(10) = (1 + 10) / 2
 m.next(3) = (1 + 10 + 3) / 3
 m.next(5) = (10 + 3 + 5) / 3
 
 */

import Foundation


class MovingAverage {
    
    var queue = [Int]()
    let size: Int
    var sum = 0
    
    /** Initialize your data structure here. */
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        if self.queue.count == self.size {
            self.sum -= self.queue.removeFirst()
        }
        
        self.queue.append(val)
        self.sum += val
        print(self.queue)
        return Double(self.sum) / Double(self.queue.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */

//: [Next](@next)
