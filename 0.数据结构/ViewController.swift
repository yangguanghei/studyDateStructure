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
    }
}

extension ViewController {
    
    /// 测试链表
    private func testLink() {
        let linkList = LinkList()
        linkList.addNode(item: "1")
        linkList.addNode(item: "2")
        linkList.insertNode(index: 1, item: "3")
        linkList.delete(index: 0)
        linkList.clear()
        
        for i in 0..<linkList.length {
            let text = linkList.getItem(index: i)
            print(text!)
        }
    }
    
}

