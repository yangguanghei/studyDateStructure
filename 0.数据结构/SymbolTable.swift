//
//  SymbolTable.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/2/8.
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

/// 符号表
struct SymbolTable<T> {
    
    private var head = SymbolNode(key: "", value: "", next: nil)
    private var length = 0
    
    init() {
        
    }
    
    mutating func put(key: String, value: String) {
        var n = head
        while n.next != nil {
            n = n.next!
            if n.key == key {   // 已经有这个key了
                n.value = value
                return
            }
        }
        let newNode = SymbolNode(key: key, value: value, next: head.next)
        head.next = newNode // 新插入的节点放在第一位
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
