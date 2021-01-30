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
        testLink()
//        testTwoWayLinkList()
    }
}

extension ViewController {
    
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

