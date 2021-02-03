//
//  TNode.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/2/2.
//

import Foundation

/// 节点
class TNode<T>: NSObject {
    var item: T?
    var next: TNode?
    init(item: T?, next: TNode?) {
        self.item = item
        self.next = next
    }
}
