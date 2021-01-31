//
//  ViewController.swift
//  0.数据结构
//
//  Created by 梁森 on 2021/1/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        testLink()
//        testTwoWayLinkList()
//        testMid()
//        testCircle()
        testEntrance()
    }
}

extension ViewController {
    
    /// 快慢指针获取环状链表的入口
    private func testEntrance() {
        let firstNode = Node(item: "1", next: nil)
        let secondNode = Node(item: "2", next: nil)
        let thirdNode = Node(item: "3", next: nil)
        let forthNode = Node(item: "4", next: nil)
        let fifthNode = Node(item: "5", next: nil)
        let sixthNode = Node(item: "6", next: nil)
        let seventhNode = Node(item: "7", next: nil)
        let eightNode = Node(item: "8", next: nil)
        
        firstNode.next = secondNode
        secondNode.next = thirdNode
        thirdNode.next = forthNode
        forthNode.next = fifthNode
        fifthNode.next = sixthNode
        sixthNode.next = seventhNode
        seventhNode.next = eightNode
        
        eightNode.next = fifthNode
        
        let node = getEntrance(firstNode: firstNode)
        print("node.item:\(node.item ?? "")")
    }
    
    private func getEntrance(firstNode: Node?) -> Node {
        var fast = firstNode
        var slow = firstNode
        var temp: Node?
        while fast != nil && fast!.next!.next != nil {
            fast = fast!.next!.next!
            slow = slow!.next!
            if fast! == slow! { // 应该是比较节点是否相同
                if temp == nil {    // 被赋值之后就不再管快慢指针了
                    temp = firstNode
                    continue    // 循环体立刻停止本次循环迭代，重新开始下次循环迭代
                }
            }
            if temp != nil {
                temp = temp!.next!
                if slow! == temp! {
                    break
                }
            }
        }
        return slow!
    }
    
    /// 快慢指针解决链表是否有闭环
    private func testCircle() {
        let firstNode = Node(item: "1", next: nil)
        let secondNode = Node(item: "2", next: nil)
        let thirdNode = Node(item: "3", next: nil)
        let forthNode = Node(item: "4", next: nil)
        let fifthNode = Node(item: "5", next: nil)
        let sixthNode = Node(item: "6", next: nil)
        let seventhNode = Node(item: "7", next: nil)
        let eightNode = Node(item: "8", next: nil)
        
        firstNode.next = secondNode
        secondNode.next = thirdNode
        thirdNode.next = forthNode
        forthNode.next = fifthNode
        fifthNode.next = sixthNode
        sixthNode.next = seventhNode
        seventhNode.next = eightNode
        
        eightNode.next = fifthNode
        
        let isCir = isCircle(firstNode: firstNode)
        print("isCircle:\(isCir)")
    }
    
    private func isCircle(firstNode: Node) -> Bool {
        var fast = firstNode
        var slow = firstNode
        while fast.next?.next != nil {
            fast = fast.next!.next!
            slow = slow.next!
            if fast.item == slow.item { // 应该是比较节点是否相同
                return true
            }
        }
        return false
    }
    
    /// 快慢指针解决中间值
    private func testMid() {
        let firstNode = Node(item: "1", next: nil)
        let secondNode = Node(item: "2", next: nil)
        let thirdNode = Node(item: "3", next: nil)
        let forthNode = Node(item: "4", next: nil)
        let fifthNode = Node(item: "5", next: nil)
        let sixthNode = Node(item: "6", next: nil)
        let seventhNode = Node(item: "7", next: nil)
        let eightNode = Node(item: "8", next: nil)
        
        firstNode.next = secondNode
        secondNode.next = thirdNode
        thirdNode.next = forthNode
        forthNode.next = fifthNode
        fifthNode.next = sixthNode
        sixthNode.next = seventhNode
        seventhNode.next = eightNode
        
        let mind = getMind(firstNode: firstNode)
        print("\(mind)")
    }
    
    private func getMind(firstNode: Node) -> String{
        var fast = firstNode
        var low = firstNode
        while fast.next?.next != nil {
            fast = fast.next!.next!
            low = low.next!
        }
        return low.item!
    }
    
    /// 测试双向链表
    private func testTwoWayLinkList() {
        let linkList = TwoWayLinkList()
        linkList.addItem(item: "1")
        linkList.addItem(item: "2")
        linkList.addItem(item: "3")
        linkList.insertItem(item: "11", index: 1)
        let item = linkList.deleteItemOfIndex(index: 0)
        print("删除的元素\(item ?? "")")
        linkList.clear()
        
        for i in 0..<linkList.length {
            let text = linkList.getItem(index: i)
            print(text!)
        }
    }
    
    /// 测试链表
    private func testLink() {
        let linkList = LinkList()
        linkList.addNode(item: "1")
        linkList.addNode(item: "2")
        linkList.insertNode(index: 1, item: "3")
//        linkList.delete(index: 0)
//        linkList.clear()
        
        for i in 0..<linkList.length {
            let text = linkList.getItem(index: i)
            print(text!)
        }
        
        linkList.reverse()
        print("-----------------")
        for i in 0..<linkList.length {
            let text = linkList.getItem(index: i)
            print(text!)
        }
    }

    
}

