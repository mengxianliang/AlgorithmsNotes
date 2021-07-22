//
//  BinaryTreePrinter.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/22.
//

import Foundation

private extension TreeNode {
    
    private struct AssociatedKeys {
        static var isEmptyKey = "TreeNode.isEmptyKey"
    }

    var isEmpty: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.isEmptyKey) as? Bool ?? false
        }
        set (isEmpty) {
            objc_setAssociatedObject(self, &AssociatedKeys.isEmptyKey, isEmpty, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
}

class BinaryTreePrinter {
    
    private var nodes = [Array<TreeNode>]()
    
    init() {
        
    }
    
    class func printTree(_ root: TreeNode) {
        
        let printer = BinaryTreePrinter()
        
        /// 先来个层序遍历
        printer.levelOrderTraversal(root)
        
        
        
        var fullString = ""
        for currentLevel in 0..<printer.nodes.count {
            
            var printStr = ""
            
            let currentLevelNodes = printer.nodes[currentLevel]
            
            // 左边是2的n次方
            let marginLeft = 1<<(printer.nodes.count - currentLevel)
            // 间隔是2的n+1次方-1
            let space = 1<<(printer.nodes.count - currentLevel + 1) - 1
            
            /// 左侧串
            var marginLeftStr = ""
            for i in 1...marginLeft {
                if currentLevel == printer.nodes.count - 1 || currentLevelNodes.first?.left == nil {
                    marginLeftStr.append(" ")
                    continue
                }
                if i < marginLeft/2 + 1 {
                    marginLeftStr.append(" ")
                }else if i == marginLeft/2 + 1 {
                    marginLeftStr.append("┌")
                }else {
                    marginLeftStr.append("-")
                }
            }
            
            /// 分割串
            var spaceStr = ""
            for i in 1...space {
                
                if currentLevel == printer.nodes.count - 1 {
                    spaceStr.append("*")
                    continue
                }
                
                if i == marginLeft/2 {
                    spaceStr.append("┐")
                }else if i == space - marginLeft/2 + 1 {
                    spaceStr.append("┌")
                }else if i > marginLeft/2 && i < space - marginLeft/2 + 1 {
                    spaceStr.append("*")
                }else {
                    spaceStr.append("-")
                }
            }
            
            /// 拼接左侧的串
            printStr.append(marginLeftStr)
            
            /// 拼接元素和中间的分割串
            for i in 0..<currentLevelNodes.count {
                let node = currentLevelNodes[i]
                if node.isEmpty {
                    printStr.append(" ")
                }else {
                    printStr.append("\(node.val)")
                }
                
                if i == currentLevelNodes.count - 1  {
                    if node.right != nil {
                        printStr.append(spaceStr.components(separatedBy: "┌").first ?? "")
                    }
                }else {
                    var currentSpaceStr = spaceStr
                    if node.right == nil {
                        let first: String = spaceStr.components(separatedBy: "┐").first ?? ""
                        var temp = ""
                        for _ in first {
                            temp.append(" ")
                        }
                        temp.append(" ")
                        currentSpaceStr = currentSpaceStr.replacingOccurrences(of: first.appending("┐"), with:temp )
                    }
                    
                    if i < currentLevelNodes.count - 1 {
                        let nextNode = currentLevelNodes[i + 1]
                        if nextNode.left == nil {
                            let last: String = spaceStr.components(separatedBy: "┌").last ?? ""
                            var temp = ""
                            for _ in last {
                                temp.append(" ")
                            }
                            temp.append(" ")
                            currentSpaceStr = currentSpaceStr.replacingOccurrences(of: "┌".appending(last), with:temp )
                        }
                    }
                    
                    printStr.append(currentSpaceStr)
                }
            }
            
            /// 中间竖线层
            var downStr = ""
            for char in printStr {
                if String(char) == "┌" || String(char) == "┐" {
                    downStr.append("|")
                }else {
                    downStr.append(" ")
                }
            }
            
            fullString.append(printStr + "\n")
            fullString.append(downStr + "\n")
        }
        
        print(fullString)
        
    }
    
    /// 层续遍历打印，得出每层元素集合eg:[[1],[2,3][4,5,null,7]]
    private func levelOrderTraversal(_ root: TreeNode?) {
        if root == nil {return}
        var queue = [TreeNode]()
        queue.append(root!)
        
        var level = 0
        
        while !queue.isEmpty {
            
            var leverArr = [TreeNode]()
            
            for _ in 1...queue.count {
                let node = queue.first
                queue.removeFirst()
                
//                print("currentNode = \(node!.val)")
                /// 保存当前层级遍历元素
                leverArr.append(node!)
                
                if node?.left != nil {
                    queue.append((node?.left)!)
                }
                
                if node?.right != nil {
                    queue.append((node?.right)!)
                }
            }
            
            
//            print("level = \(level),nodesCount = \(leverArr.count) ")
            
            if level > 0 && leverArr.count < level * 2 {
//                print("当前层级元素不知足")
                leverArr = fixLevelArrWith(nodes[level - 1], leverArr)
            }
            
            /// 保存每个层级节点
            nodes.append(leverArr)
            
            level += 1
            
        }
    }
    
    /// 如果有空节点，需要补齐
    func fixLevelArrWith(_ parrentLevelArr: [TreeNode],_ currentLevelArr: [TreeNode]) -> Array<TreeNode> {
        
        var newLevelArr = [TreeNode]()
        for node in parrentLevelArr {
            if node.left == nil {
                let emptyNode = TreeNode()
                emptyNode.isEmpty = true
                newLevelArr.append(emptyNode)
            }else {
                for left in currentLevelArr {
                    if node.left?.val == left.val {
                        newLevelArr.append(left)
                    }
                }
            }
            
            if node.right == nil {
                let emptyNode = TreeNode()
                emptyNode.isEmpty = true
                newLevelArr.append(emptyNode)
            }else {
                for right in currentLevelArr {
                    if node.right?.val == right.val {
                        newLevelArr.append(right)
                    }
                }
            }
        }
        return newLevelArr
    }
    
    func stringOfNum(_ num: Int) -> String {
        var string = "\(num)"
        
//        if string.count == 1 {
//            string = "0"+string+"0"
//        }
//        if string.count == 2 {
//            string = string + "0"
//        }
        return string
    }
}
