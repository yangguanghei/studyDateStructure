//
//  TwoWayLinkList.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/1/27.
//

import Foundation

/// 节点类
fileprivate class TwoNode {
    var item: String?
    var pre: TwoNode?
    var next: TwoNode?
    init(item: String?, pre: TwoNode?, next: TwoNode?) {
        self.item = item
        self.pre = pre
        self.next = next
    }
}

/// 双向链表
class TwoWayLinkList {
    
    /// 头节点
    private var head = TwoNode(item: nil, pre: nil, next: nil)
    /// 尾节点
    private var footer = TwoNode(item: nil, pre: nil, next: nil)
    /// 链表长度
    var length = 0
    
    /// 初始化链表
    init() {
        self.head = TwoNode(item: nil, pre: nil, next: nil)
        self.footer = TwoNode(item: nil, pre: nil, next: nil)
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
            let newTwoNode = TwoNode(item: item, pre: head, next: nil)
            head.next = newTwoNode
            footer = newTwoNode
        } else {
            let oldFooter = footer
            let newTwoNode = TwoNode(item: item, pre: oldFooter, next: nil)
            oldFooter.next = newTwoNode
            footer = newTwoNode
        }
        length += 1
    }
    
    func insertItem(item: String, index: Int) {
        var pre = head
        for _ in 0..<index {
            pre = pre.next!
        }
        let curTwoNode = pre.next
        let newTwoNode = TwoNode(item: item, pre: pre, next: curTwoNode)
        pre.next = newTwoNode
        curTwoNode?.pre = newTwoNode
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
        let curTwoNode = pre.next
        let nextTwoNode = curTwoNode?.next
        pre.next = nextTwoNode
        nextTwoNode?.pre = pre
        length -= 1
        return curTwoNode?.item
    }
    
    /// 清空
    func clear() {
        head.next = nil
        length = 0
    }
    
}
