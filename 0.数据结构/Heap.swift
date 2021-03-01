//
//  Heap.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/2/28.
//

import Foundation


/// 堆
class Heap {
    
    private var items = [String]()
    /// 堆中元素个数
    var N = 0
    
    init(capacity: Int) {
        for _ in 0..<capacity {
            items.append("")
        }
    }
    
    func printHeap() {
        for i in 0..<N {
            print("\(items[i])")
        }
    }
    
    /// i处元素是否比j处元素小
    private func less(i: Int, j: Int) -> Bool {
        if items[i].compare(items[j]) == .orderedAscending {
            return true
        } else {
            return false
        }
    }
    
    private func exchange(i: Int, j: Int) {
        let temp = items[i]
        items[i] = items[j]
        items[j] = temp
    }
    
    /// 插入元素
    func insert(t: String) {
        N = N + 1
        items[N] = t
        swim(k: N)
    }
    
    /// 上浮算法，让k处元素处于正确的位置
    private func swim(k: Int) {
        var i = k
        while i > 1 {
            if less(i: i/2, j: i) {
                exchange(i: i/2, j: i)
            }
            i = i / 2
        }
    }
    
    /// 删除最大元素
    func deleteMax() -> String {
        let maxItem = items[1]
        exchange(i: 1, j: N)
        items[N] = ""
        sink(k: 1)
        N = N - 1
        return maxItem
    }
    
    /// 下沉算法，让k处元素处于正确的位置
    private func sink(k: Int) {
        var i = k
        while 2*i <= N {
            var max = 2*i
            if 2*i+1 <= N {   // 如果有右子树
                if less(i: 2*i, j: 2*k+1) {
                    max = 2*i+1
                }
            }
            if !less(i: i, j: max) {
                break
            }
            exchange(i: i, j: max)
            i = max
        }
    }
}
