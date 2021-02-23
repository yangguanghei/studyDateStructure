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
        
        testErgodic()
//        testGetMinMaxKey()
//        testBinaryTree()
//        testOrderSymbolTable()
//        testSymbolTable()
//        testLink()
//        testTwoWayLinkList()
//        testMid()
//        testCircle()
//        testEntrance()
//        testJoseph()
//        testStack()
//        print("\(isMach(str: "(jdk()jkd()kaldjl())"))")
//        testReversePolishNotation()
//        testQueue()
    }
}

extension ViewController {
    
    /// 测试二叉树的前、中、后序遍历
    private func testErgodic() {
        let binaryTree = BinaryTree()
        binaryTree.put(key: "E", value: "5")
        binaryTree.put(key: "B", value: "2")
        binaryTree.put(key: "G", value: "7")
        binaryTree.put(key: "A", value: "1")
        binaryTree.put(key: "D", value: "4")
        binaryTree.put(key: "F", value: "6")
        binaryTree.put(key: "H", value: "8")
        binaryTree.put(key: "C", value: "3")
//        print(binaryTree.getMinKey() ?? "")
//        print(binaryTree.getMaxKey() ?? "")
        print("=========前序遍历=========")
        let queue = binaryTree.preErgodic()
        queue.printQueue()
        print("=========中序遍历=========")
        let queue1 = binaryTree.middleErgodic()
        queue1.printQueue()
        print("=========后序遍历=========")
        let queue2 = binaryTree.afterErgodic()
        queue2.printQueue()
        print("========层序遍历==========")
        let queue3 = binaryTree.layerErgodic()
        queue3.printQueue()
    }
    
    /// 测试获取二叉树最小/最大key
    private func testGetMinMaxKey() {
        let binaryTree = BinaryTree()
        binaryTree.put(key: "1", value: "张三")
        binaryTree.put(key: "2", value: "李四")
        binaryTree.put(key: "3", value: "王五")
        binaryTree.put(key: "4", value: "赵六")
        print(binaryTree.getMinKey() ?? "")
        print(binaryTree.getMaxKey() ?? "")
    }
    
    /// 测试二叉树
    private func testBinaryTree() {
        let binaryTree = BinaryTree()
        binaryTree.put(key: "1", value: "张三")
        binaryTree.put(key: "2", value: "李四")
        binaryTree.put(key: "3", value: "王五")
        print(binaryTree.N)
        let value = binaryTree.get(key: "2")
        print(value!)
        let value1 = binaryTree.delete(key: "2")!.value
        print(value1!)
        print(binaryTree.N)
    }
    
    /// 测试有序符号表
    private func testOrderSymbolTable() {
        var orderSymbolTable = OrderSymbolTable<String>()
        orderSymbolTable.put(key: "1", value: "张三")
        orderSymbolTable.put(key: "2", value: "李四")
        orderSymbolTable.put(key: "4", value: "赵六")
        orderSymbolTable.put(key: "5", value: "田七")
        orderSymbolTable.printSymbolTable()
        print("==============================")
        orderSymbolTable.put(key: "3", value: "王五")
        orderSymbolTable.printSymbolTable()
    }
    
    /// 测试符号表
    private func testSymbolTable() {
        var symbolTable = SymbolTable<String>()
        symbolTable.put(key: "one", value: "1")
        symbolTable.put(key: "two", value: "2")
        symbolTable.put(key: "three", value: "3")
        symbolTable.printSymbolTable()
        let value = symbolTable.get(key: "three")
        print(value)
        symbolTable.delete(key: "two")
        symbolTable.printSymbolTable()
    }
    
    /// 测试队列
    private func testQueue() {
        var queue = Queue<String>()
        queue.enQueue(item: "a")
        queue.enQueue(item: "b")
        queue.enQueue(item: "c")
        queue.printQueue()
        print("\(queue.size())")
        let item = queue.deQueue()
        print("\(item)")
        print("\(queue.size())")
    }
    
    /// 利用栈解决逆波兰表达式问题
    private func testReversePolishNotation(){
        var stack = Stack()
        // 1+(1*2)-(2/1)=1
        let strArray = ["1", "1", "2", "*", "+", "2", "1", "/", "-"]
        for i in 0..<strArray.count {
            let str = strArray[i]
            switch str {
            case "+":
                let o1 = stack.pop() as! Int
                let o2 = stack.pop() as! Int
                let result = o2 + o1
                stack.push(item: result)
            case "-":
                let o1 = stack.pop() as! Int
                let o2 = stack.pop() as! Int
                let result = o2 - o1
                stack.push(item: result)
            case "*":
                let o1 = stack.pop() as! Int
                let o2 = stack.pop() as! Int
                let result = o2 * o1
                stack.push(item: result)
            case "/":
                let o1 = stack.pop() as! Int
                let o2 = stack.pop() as! Int
                let result = o2 / o1
                stack.push(item: result)
            default:
                let result = Int(str)!
                stack.push(item: result)
            }
        }
        let result = stack.pop() as! Int
        print("\(result)")
    }
    
    /// 利用栈解决括号匹配问题
    private func isMach(str: String) -> Bool {
        var stack = Stack()
        for char in str.enumerated() {
            let s = char.element
            if s == "(" {
                stack.push(item: s)
            } else if s == ")" {
                let item = stack.pop()
                if item == nil {
                    return false
                }
            }
        }
        if stack.isEmpty() {
            return true
        } else {
            return false
        }
    }
    
    /// 测试栈
    private func testStack() {
        var stack = Stack()
        stack.push(item: "1")
        stack.push(item: "2")
        stack.push(item: "3")
        stack.push(item: "4")
        stack.push(item: "5")
        stack.printStack()
        print("^^^^^^^^^^^^")
        let item = stack.pop()
        print("\(item)")
        print("^^^^^^^^^^^^")
        stack.printStack()
    }
    
    /// 约瑟夫问题
    private func testJoseph() {
        
        var firstNode = TNode<Int>(item: nil, next: nil)
        var pre = TNode<Int>(item: nil, next: nil)
        
        // 创建循环链表
        for i in 1...41 {
            if i == 1 {
                firstNode = TNode(item: i, next: nil)
                pre = firstNode
                continue
            }
            
            let node = TNode(item: i, next: nil)
            pre.next = node
            pre = node
            
            if i == 41 {
                pre.next = firstNode
            }
        }
        
//        var testNode = firstNode
//        while testNode.next?.item != 1 {
//            testNode = testNode.next!
//            print("\(testNode.item ?? 0)")
//        }
        
        var n = firstNode
        var before = TNode<Int>(item: nil, next: nil)
        var count = 0
        /// 将计数为3的节点移除
        while n.next != n {
            count += 1
            if count == 3 {
                before.next = n.next
                print("\(n.item ?? 0)")
                count = 0
                n = n.next!
            } else {
                before = n
                n = n.next!
            }
        }
        
        print("最后剩下：\(n.item ?? 0)")
    }
    
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

