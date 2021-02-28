//
//  BinaryTree.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/2/20.
//

import Foundation

// 节点
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
        } else {    // key相等
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
    
    // 获取这个树中最小的key
    func getMinKey() -> String? {
        return (getMinNode(node: root)?.key)
    }
    // 获取指定树中最小的key所在的节点
    func getMinNode(node: TreeNode?) -> TreeNode? {
        if node?.left != nil {
            return getMinNode(node: node?.left)
        } else {
            return node
        }
    }
    
    // 获取这个树中最大的key
    func getMaxKey() -> String? {
        return (getMaxNode(node: root)?.key)
    }
    // 获取指定树中最大的key所在的节点
    func getMaxNode(node: TreeNode?) -> TreeNode? {
        var n = node
        while n?.right != nil {
            n = n?.right
        }
        return n
        
//        if node?.right != nil {
//            return getMaxNode(node: node?.right)
//        } else {
//            return node
//        }
    }
    
    // 前序遍历
    func preErgodic() -> Queue<String> {
        var queue = Queue<String>()
        preErgodic(node: root, queue: &queue)
        return queue
    }
    func preErgodic(node: TreeNode?, queue: inout Queue<String>) {
        if node == nil {
            return
        }
        queue.enQueue(item: node?.key ?? "")
        if node?.left != nil {
            preErgodic(node: node?.left, queue: &queue)
        }
        if node?.right != nil {
            preErgodic(node: node?.right, queue: &queue)
        }
    }
    
    // 中序遍历
    func middleErgodic() -> Queue<String> {
        var queue = Queue<String>()
        middleErgodic(node: root, queue: &queue)
        return queue
    }
    func middleErgodic(node: TreeNode?, queue: inout Queue<String>) {
        if node == nil {
            return
        }
        if node?.left != nil {
            // 通过递归把左子树中的所有键放入队列中
            middleErgodic(node: node?.left, queue: &queue)
        }
        // 将节点的键放入队列中
        queue.enQueue(item: node?.key ?? "")
        if node?.right != nil {
            // 通过递归把右子树中的所有键放入队列中
            middleErgodic(node: node?.right, queue: &queue)
        }
    }
    
    // 后序遍历
    func afterErgodic() -> Queue<String> {
        var queue = Queue<String>()
        afterErgodic(node: root, queue: &queue)
        return queue
    }
    func afterErgodic(node: TreeNode?, queue: inout Queue<String>) {
        if node == nil {
            return
        }
        if node?.left != nil {
            afterErgodic(node: node?.left, queue: &queue)
        }
        if node?.right != nil {
            afterErgodic(node: node?.right, queue: &queue)
        }
        queue.enQueue(item: node?.key ?? "")
    }
    
    // 层序遍历
    func layerErgodic() -> Queue<String> {
        var keyQueue = Queue<String>()
        var nodeQueue = Queue<TreeNode>()
        nodeQueue.enQueue(item: root!)
        while !nodeQueue.isEmpty() {
            let node = nodeQueue.deQueue()
            keyQueue.enQueue(item: node!.key)
            if node?.left != nil {
                nodeQueue.enQueue(item: (node?.left)!)
            }
            if node?.right != nil {
                nodeQueue.enQueue(item: (node?.right)!)
            }
        }
        return keyQueue
    }
    
    // 树的最大深度
    func maxDepth() -> Int {
        return maxDepth(node: root)
    }
    func maxDepth(node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        var max = 0
        var maxL = 0
        var maxR = 0
        if node?.left != nil {
            maxL = maxDepth(node: node?.left)
        }
        if node?.right != nil {
            maxR = maxDepth(node: node?.right)
        }
        if maxL > maxR {
            max = maxL + 1
        } else {
            max = maxR + 1
        }
        return max
    }
}
