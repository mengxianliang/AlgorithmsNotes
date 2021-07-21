//
//  _450_删除二叉搜索树中的节点.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/20.
//  https://leetcode-cn.com/problems/delete-node-in-a-bst/

/**
 测试二叉树结构
    5
   / \
  3   6
 / \   \
2   4   7
 
 
 迭代思路：
 如果找到的节点是度为2的节点，则找到它的前驱后（后继）节点，让前驱节点的val替换找到的节点，再删除前驱节点（前驱/后继节点的度只可能为0或者1）
 如果找到的节点是度为1度节点，直接用parent的left或者right指向节点的child
 如果找到接待您的度为0，直接用parent的left或者right指向nil
 
 递归思路：
 比较传入key和当前root的val，如果较小，就在左子树中继续查找，如果较大就在右子树中继续查找
 如果传入key和当前root的val相等
 如果root是叶子节点，则root = nil
 如果root有右子树，找到后继节点，替换root的val，再删除后继节点
 如果root有左子树，找到前驱节点，替换root的val，再删除前驱节点
 */
import Foundation

class DeleteNodeOfBTS: NSObject {
    
    override init() {
        super.init()
        
        /// 创建测试二叉树
        let node2 = TreeNode(2)
        let node4 = TreeNode(4)
        let node7 = TreeNode(7)
        
        let node3 = TreeNode(3, node2, node4)
        let node6 = TreeNode(6, nil, node7)
        
        let node5 = TreeNode.init(5, node3, node6)
        node5.printBinaryTree(.levelOrder)
        
        /// 调用删除方法
        let newRoot = deleteNode(node5, 3)
        newRoot?.printBinaryTree(.levelOrder)
        
    }
    
    /// 迭代
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {return root}
        
        var queue = [TreeNode]()
        queue.append(root!)
        
        /// 需要被删除的节点
        var deleteNode: TreeNode? = nil
        
        while !queue.isEmpty {
            
            let node = queue.first
            queue.removeFirst()
            
            print("层序遍历：node = \((node?.val)!)")
            
            /// 找到了待删除节点
            if node?.val == key {
                /// 如果是度为2的节点
                if node?.left != nil && node?.right != nil {
                    /// 第一步：找到前驱/后继节点，此处以【前驱】节点为例
                    var prevNode = node?.left
                    while prevNode?.right != nil {
                        prevNode = prevNode?.right
                    }
                    /// 第二步：用前驱/后继节点替换当前节点的val
                    let tempVal = node?.val
                    node?.val = prevNode!.val
                    prevNode?.val = tempVal!
                    
                    /// 第三步：删除前驱/后继节点（前驱/后继节点只可能是度为0或者度为1）
                    deleteNode = prevNode
                }else {
                    deleteNode = node
                }
                break
            }
            
            if node?.left != nil {
                queue.append((node?.left)!)
            }
            
            if node?.right != nil {
                queue.append((node?.right)!)
            }
        }
        
        /// 删除操作
        if deleteNode != nil {
            /// 节点度为0（叶子节点）
            if deleteNode?.left == nil && deleteNode?.right == nil {
                
                /// 如果是根节点
                if deleteNode?.val == root?.val {
                    var newRoot = root
                    newRoot = nil
                    return newRoot
                }
                
                /// 层序遍历-找到节点的parrent
                var queue = [TreeNode]()
                queue.append(root!)
                while !queue.isEmpty {
                    let node = queue.first
                    queue.removeFirst()
                    
                    /// 是parrent的左子树
                    if node?.left?.val == deleteNode?.val {
                        node?.left = nil
                        break
                    }
                    
                    /// 是parrent的右子树
                    if node?.right?.val == deleteNode?.val {
                        node?.right = nil
                        break
                    }
                    if node?.left != nil {
                        queue.append((node?.left)!)
                    }
                    if node?.right != nil {
                        queue.append((node?.right)!)
                    }
                }
            }else if (deleteNode?.left == nil || deleteNode?.right == nil) {/// 节点度为1
                
                
                /// 如果是根节点
                if deleteNode?.val == root?.val {
                    let newRoot = root?.left == nil ? root?.right : root?.left
                    return newRoot
                }
                
                /// 层序遍历-找到节点的parrent
                var queue = [TreeNode]()
                queue.append(root!)
                while !queue.isEmpty {
                    let node = queue.first
                    queue.removeFirst()
                    
                    /// 是parrent的左子树
                    if node?.left?.val == deleteNode?.val {
                        let child = deleteNode?.left == nil ? deleteNode?.right : deleteNode?.left
                        node?.left = child
                        break
                    }
                    
                    /// 是parrent的右子树
                    if node?.right?.val == deleteNode?.val {
                        let child = deleteNode?.left == nil ? deleteNode?.right : deleteNode?.left
                        node?.right = child
                        break
                    }
                    if node?.left != nil {
                        queue.append((node?.left)!)
                    }
                    if node?.right != nil {
                        queue.append((node?.right)!)
                    }
                }
            }
        }
        return root
    }
    
}
