//
//  TwoWayLinkList.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/1/27.
//

import Foundation

/// 节点类
fileprivate class Node {
    var item: String?
    var pre: Node?
    var next: Node?
    init(item: String?, pre: Node?, next: Node?) {
        self.item = item
        self.pre = pre
        self.next = next
    }
}

/// 双向链表
class TwoWayLinkList {
    
    /// 头节点
    private var head = Node(item: nil, pre: nil, next: nil)
    /// 尾节点
    private var footer = Node(item: nil, pre: nil, next: nil)
    /// 链表长度
    var length = 0
    
    /// 初始化链表
    init() {
        self.head = Node(item: nil, pre: nil, next: nil)
        self.footer = Node(item: nil, pre: nil, next: nil)
        length = 0
    }
    
    func isEmpty() -> Bool {
        if length == 0 {
            return true
        } else {
            return false
        }
    }
    
    func getFirstItem() -> String? {
        if isEmpty() == true {
            return nil
        } else {
            return head.next?.item
        }
    }
    
    func getLastItem() -> String? {
        if isEmpty() == true {
            return nil
        } else {
            return footer.item
        }
    }
    
    func addItem(item: String) {
        if isEmpty() == true {
            let newNode = Node(item: item, pre: head, next: nil)
            head.next = newNode
            footer = newNode
        } else {
            let oldFooter = footer
            let newNode = Node(item: item, pre: oldFooter, next: nil)
            oldFooter.next = newNode
            footer = newNode
        }
        length += 1
    }
    
    func insertItem(item: String, index: Int) {
        var pre = head
        for _ in 0..<index {
            pre = pre.next!
        }
        let curNode = pre.next
        let newNode = Node(item: item, pre: pre, next: curNode)
        pre.next = newNode
        curNode?.pre = newNode
        length += 1
    }
    
    func getItem(index: Int) -> String? {
        var n = head.next
        for _ in 0..<index {
            n = n?.next!
        }
        return n?.item
    }
    
    func indexOfItem(item: String) -> Int {
        var n = head
        for i in 0..<length {
            n = n.next!
            if n.item == item {
                return i
            }
        }
        return -1
    }
    
    func deleteItemOfIndex(index: Int) -> String? {
        var pre = head
        for _ in 0..<index {
            pre = pre.next!
        }
        let curNode = pre.next
        let nextNode = curNode?.next
        pre.next = nextNode
        nextNode?.pre = pre
        length -= 1
        return curNode?.item
    }
    
    /// 清空
    func clear() {
        head.next = nil
        length = 0
    }
    
}
