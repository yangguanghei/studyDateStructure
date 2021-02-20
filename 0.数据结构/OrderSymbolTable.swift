//
//  OrderSymbolTable.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/2/19.
//

import Foundation

private class SymbolNode: NSObject {
    var key: String!
    var value: String!
    var next: SymbolNode?
    init(key: String, value: String, next: SymbolNode?) {
        self.key = key
        self.value = value
        self.next = next
    }
}

/// 有序符号表
struct OrderSymbolTable<T> {
    
    private var head = SymbolNode(key: "", value: "", next: nil)
    private var length = 0
    
    mutating func put(key: String, value: String) {
        
        var pre = head
        var curr = head.next
        while curr != nil && (key.compare(curr!.key) == .orderedDescending) {
            pre = pre.next!
            curr = curr?.next
        }
        if curr != nil && key.compare(curr!.key) == .orderedSame { // 相同则替换
            curr?.value = value
            return
        }
        let newN = SymbolNode(key: key, value: value, next: curr)
        pre.next = newN
        length += 1
    }
    
    mutating func delete(key: String) -> String {
        var n = head
        while n.next != nil {
            n = n.next!
            if n.next?.key == key {   // 找到了这个key
                n.next = n.next?.next
                length -= 1
                return (n.next?.value!)!
            }
        }
        return ""
    }
    
    func get(key: String) -> String {
        var n = head
        while n.next != nil {
            n = n.next!
            if n.key == key {   // 找到了这个key
                return n.value
            }
        }
        return ""
    }
    
    func printSymbolTable() {
        var n = head
        while n.next != nil {
            n = n.next!
            print(n.value)
        }
    }
    
}
