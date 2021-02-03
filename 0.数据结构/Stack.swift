//
//  Stack.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/2/2.
//

import Foundation

/// 栈
struct Stack {
    
    private var head = TNode<Any>(item: nil, next: nil)
    private var count = 0
    
    func isEmpty() -> Bool {
        if count == 0 {
            return true
        } else {
            return false
        }
    }
    
    mutating func push(item: Any) {
        let first = head.next
        let newNode = TNode(item: item, next: first)
        head.next = newNode
        count += 1
    }
    
    mutating func pop() -> Any? {
        let first = head.next
        if first == nil {
            return nil
        }
        head.next = first?.next
        count -= 1
        return first?.item
    }
    
    func printStack() {
        var node = head.next
        while node != nil {
            print("\(node?.item)")
            node = node?.next
        }
    }
}
