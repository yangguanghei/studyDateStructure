//
//  Queue.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/2/8.
//

import Foundation

private class QueueNode<T>: NSObject {
    var item: T?
    var next: QueueNode?
    init(item: T?, next: QueueNode?) {
        self.item = item
        self.next = next
    }
}


/// 队列
struct Queue<T> {
    
    /// 队列长度
    private var length = 0
    /// 头节点
    private var head: QueueNode<T>?
    /// 尾节点
    private var footer: QueueNode<T>?
    
    
    init() {
        head = QueueNode(item: nil, next: nil)
        footer = nil
    }
    
    func isEmpty() -> Bool {
        if length > 0 {
            return false
        } else {
            return true
        }
    }
    
    func size() -> Int {
        return length
    }
    
    /// 入队列
    mutating func enQueue(item: T) {
        let newNode = QueueNode(item: item, next: nil)
        if isEmpty() {
            head?.next = newNode
        } else {
            footer?.next = newNode
        }
        footer = newNode
        length += 1
    }
    
    /// 出队列
    mutating func deQueue() -> T?{
        if isEmpty() {
            return nil
        }
        let node = head?.next
        head?.next = node?.next
        length -= 1
        if isEmpty() {
            footer = nil
        }
        return node?.item
    }
    
    func printQueue() {
        var node = head
        while node?.next != nil {
            node = node?.next
            print("\(node?.item)")
        }
    }
}
