//
//  _173_二叉搜索树迭代器.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/21.
//  https://leetcode-cn.com/problems/binary-search-tree-iterator/



/**
 思路：先用中序遍历保存元素数组，再进行迭代
 */

import Foundation

class BSTIterator {

    var res = [Int]()
    
    var currentIndex = -1
    
    init(_ root: TreeNode?) {
        /// 中序遍历,得到排序后的元素res
        inorderTraversal(root)
        print("res = \(res)")
    }
    
    func inorderTraversal(_ root: TreeNode?) {
        
        var stack = [TreeNode]()

        var root = root
        while root != nil || !stack.isEmpty {
            /// 先遍历左子树
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            /// 遍历节点出栈
            root = stack.last
            stack.removeLast()

            res.append(root!.val)

            /// 再遍历右子树
            root = root?.right
        }
    }
    
    func next() -> Int {
        currentIndex = currentIndex + 1
        return res[currentIndex]
    }
    
    func hasNext() -> Bool {
        return currentIndex < res.count - 1
    }
}
