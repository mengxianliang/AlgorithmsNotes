//
//  ViewController.swift
//  数据结构与算法
//
//  Created by mxl on 2021/4/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 反转链表
//        ReverseLinkedList.init()
        
        /// 环形链表
//        LinkedListCycle.init()
        
        /// 移除链表元素
//        RemoveLinkedListElemets.init()
        
        /// 删除排序链表中的重复元素
//        RemoveDuplicates.init()
        
        /// 链表的中间节点
//        MiddleOfTheLinkedList.init()
        
        /// 计数质数
//        CountPrimes.init()
        
        /// 有效的括号
//        ValidParentheses.init()
        
        /// 括号的得分
//        ScoreOfParentheses.init()
        
        /// 逆波兰表达式
//        EvalRPN.init()
        
        /// 基本计算器
//        BasicCalculator.init()
        
        /// x的平方根
//        Sqrtx.init()
        
        /// 交换数字
//        SwapNumbers.init()
        
        /// 阶乘后的零
//        FactorialTrailingZeroes.init()
        
        /// 用栈实现队列
//        let myQueue = MyQueue.init()
//        myQueue.push(1)
//        myQueue.push(2)
//        myQueue.push(3)
//        print(myQueue.empty())
//        print(myQueue.peek())
//        print(myQueue.pop())
//        print(myQueue.empty())
        
        
        /// 用队列实现栈
//        let myStack = MyStack.init()
//        myStack.push(1);
//        myStack.push(2);
//        myStack.push(3);
//        myStack.push(4);
//        print(myStack.top())
//        print(myStack.top())
        
//        print(myStack.pop())
//        print(myStack.pop())
//        print(myStack.pop())
//        print(myStack.pop())
//        print(myStack.empty())
        
        /// 反转二叉树
//        InvertBinaryTree.init()
        
        /// 删除二叉搜索树中的节点
//        DeleteNodeOfBTS.init()
        
        /// 二叉搜索树中的搜索
//        SearchInBST.init()
        
        /// 二叉搜索树中的插入操作
//        InsertIntoBST.init()
        
        /// 验证二叉搜索树
//        ValidateBST()
        
        /// 二叉树的中序遍历
//        InorderTraversalBT()
        
        /// 二叉搜索树的最小绝对差(递归中序遍历)
//        MinimumDifferenceInBTS()
        
        
        /// 二叉搜索树节点最小距离(迭代中序遍历)
//        MinimumDistanceBetweenBST()
        
        /// 将有序数组转换为二叉搜索树
//        ConvertSortedArrayToBST()
        
        /// 二叉搜索树的范围和
//        RangeSumOfBST()
        
        /// 二叉搜索树的最近公共祖先
//        LowestCommonAncestorOfBST()
        
        /// 二叉搜索树中第K小的元素
//        KthSmallestElementInBST()
        
        /// 恢复二叉搜索树
//        RecoverBST()
        
        /**
        测试二叉树结构
           10
          / \
         6   12
        / \   \
       4   8   14
      / \   \  /
     1   5   9 13
        */
        
        let node16 = TreeNode(16)
        
        let node1 = TreeNode(1)
        let node5 = TreeNode(5)
        let node9 = TreeNode(9)
        let node13 = TreeNode(13)
        let node15 = TreeNode(15, nil, node16)
        
        
        let node4 = TreeNode(4, node1, node5)
        let node8 = TreeNode(8, nil, node9)
        let node14 = TreeNode(14, node13, node15)
        
        let node6 = TreeNode(6, node4, node8)
        let node12 = TreeNode(12, nil, node14)
        
        let node10 = TreeNode.init(10, node6, node12)
        BinaryTreePrinter.printTree(node10)
    }


}

