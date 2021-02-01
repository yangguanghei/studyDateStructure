//
//  LinkList.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/1/25.
//

import Foundation

/// 节点类
class Node: NSObject {
    var item: String?
    var next: Node?
    init(item: String?, next: Node?) {
        self.item = item
        self.next = next
    }
}

class TNode<T>: NSObject {
    var item: T?
    var next: TNode?
    init(item: T?, next: TNode?) {
        self.item = item
        self.next = next
    }
}


/// 链表
class LinkList {
       
    /// 头节点
    private var head = Node(item: nil, next: nil)
    /// 链表长度
    var length = 0
    
    /// 初始化链表
    init() {
        self.head = Node(item: nil, next: nil)
        length = 0
    }
    
    /// 添加元素
    func addNode(item: String) {
        var n = head
        while n.next != nil {
            n = n.next!
        }
        let newNode = Node(item: item, next: nil)
        n.next = newNode
        length += 1
    }
    
    /// 插入元素
    func insertNode(index: Int, item: String) {
        var n = head
        for _ in 0..<index {
            n = n.next!
        }
        let currentN = n.next
        let newNode = Node(item: item, next: nil)
        n.next = newNode
        newNode.next = currentN
        length += 1
    }
    
    /// 删除元素
    func delete(index: Int) {
        var n = head
        for _ in 0..<index {
            n = n.next!
        }
        let currentN = n.next
        let nextN = currentN?.next
        n.next = nextN
        length -= 1
    }
    
    /// 获取某个元素在链表的序号
    func indexOf(item: String) -> Int {
        let n = head
        for i in 0..<length {
            if n.item == item {
                return i
            }
        }
        return -1
    }
    
    /// 清空
    func clear() {
        head.next = nil
        length = 0
    }
    
    /// 判断是否为空
    func isEmpty() -> Bool {
        if length == 0 {
            return true
        } else {
            return false
        }
    }
    
    /// 获取链表长度
    func linkLength() -> Int {
        return length
    }
    
    /// 获取第i个元素的值
    func getItem(index: Int) -> String? {
        if index > length-1 || index < 0 {
            return "越界了"
        }
        var node = head.next
        for _ in 0..<index {
            node = node?.next
        }
        return node?.item
    }
    
    /// 反转整个链表
    func reverse() {
        if isEmpty() == true {
            return
        }
        let node = reverseNode(curNode: head.next)
        print("\(node!.item ?? "")")
    }
    
    /// 反转某个节点
    private func reverseNode(curNode: Node?) -> Node? {
        if curNode?.next == nil {
            head.next = curNode
            return curNode
        }
        let preNode = reverseNode(curNode: curNode?.next)
        preNode?.next = curNode
        curNode?.next = nil
        return curNode
    }
 
}

