//
//  BinaryTree.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/2/20.
//

import Foundation

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var key: String!
    var value: String!
    init(key: String, value: String, left: TreeNode?, right: TreeNode?) {
        self.left = left
        self.right = right
        self.key = key
        self.value = value
    }
}

// 二叉树
class BinaryTree {
    var root: TreeNode?
    var N = 0
    
    func size() -> Int {
        return N
    }
    
    // 插入
    func put(key: String, value: String) {
        root = put(node: root, key: key, value: value)
    }
    func put(node: TreeNode?, key: String, value: String) -> TreeNode? {
        if node == nil {
            N += 1
            return TreeNode(key: key, value: value, left: nil, right: nil)
        }
        let result = key.compare(node!.key)
        if result == .orderedDescending {   // key大往右子树插
            node!.right = put(node: node!.right, key: key, value: value)
        } else if result == .orderedAscending { // key小往左子树插
            node!.left = put(node: node!.left, key: key, value: value)
        } else {    // key相等直接替换
            node!.value = value
        }
        return node
    }
    
    // 获取
    func get(key: String) -> String? {
        return get(node: root, key: key)
    }
    func get(node: TreeNode?, key: String) -> String? {
        if node == nil {
            return nil
        }
        let result = key.compare(node!.key)
        if result == .orderedDescending {   // key大就从右子树找
            return get(node: node?.right, key: key)
        } else if result == .orderedAscending { // key小就从左子树找
            return get(node: node?.left, key: key)
        } else {    // key相等直接替换
            return node?.value
        }
    }
    
    // 删除
    func delete(key: String) -> TreeNode? {
        return delete(node: &root, key: key)
    }
    func delete(node: inout TreeNode?, key: String) -> TreeNode? {
        if node == nil {
            return nil
        }
        let result = key.compare(node!.key)
        if result == .orderedDescending {   // key大就从右子树找
            return delete(node: &node!.right, key: key)
        } else if result == .orderedAscending { // key小就从左子树找
            return delete(node: &node!.left, key: key)
        } else {    // key相等直接删除
            N -= 1
            if node?.right == nil {
                return node?.left
            }
            if node?.left == nil {
                return node?.right
            }
            var miniNode = node?.right  // 获取右子树中最小的
            while miniNode?.left != nil {
                miniNode = miniNode?.left
            }
            // 删除右子树中最小的
            var n = node?.right
            while n?.left != nil {
                if n?.left?.left == nil {
                    n?.left = nil
                } else {
                    n = n?.left
                }
            }
            miniNode?.left = node?.left
            miniNode?.right = node?.right
            node = miniNode
        }
        return node
    }
}
