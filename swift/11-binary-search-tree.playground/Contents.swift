import Foundation

// BINARY SEARCH TREE

// a binary tree with at most two children per node
// fast search, insertion, and deletion: O(log n)

// left node value must be less than parent's value
// right node value must be greater than or equal to parent's value

// IMPLEMENTATION

class BTNode<T> {
    var value: T
    var leftChild: BTNode<T>?
    var rightChild: BTNode<T>?
    
    init(_ value: T, _ leftChild: BTNode? = nil, _ rightChild: BTNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

class BinarySearchTree<T: Comparable & CustomStringConvertible>
{
    private var rootNode: BTNode<T>?
    
    // INSERT
    func insert(insertedValue: T) {
        let inNode = BTNode(insertedValue)
        if let rootNode = self.rootNode {
            self.insertNode(rootNode: rootNode, inNode: inNode)
        } else {
            self.rootNode = inNode
        }
    }
    
    private func insertNode(rootNode: BTNode<T>, inNode: BTNode<T>) {
        if rootNode.value > inNode.value {
            if let leftChild = rootNode.leftChild {
                self.insertNode(rootNode: leftChild, inNode: inNode)
            } else {
                rootNode.leftChild = inNode
            }
        } else {
            if let rightChild = rootNode.rightChild {
                self.insertNode(rootNode: rightChild, inNode: inNode)
            } else {
                rootNode.rightChild = inNode
            }
        }
    }
    
    // SEARCH
    func searchValue(sValue: T) {
        self.searchNode(rootNode: self.rootNode, searchValue: sValue)
    }
    
    private func searchNode(rootNode: BTNode<T>?, searchValue: T) {
        guard let rootNode = rootNode else {
            print("The node of \(searchValue) does not exist")
            return
        }
        print("Root Node \(rootNode.value)")
        if searchValue > rootNode.value {
            self.searchNode(rootNode: rootNode.rightChild, searchValue: searchValue)
        } else if searchValue < rootNode.value {
            self.searchNode(rootNode: rootNode.leftChild, searchValue: searchValue)
        } else {
            print("Node found: \(rootNode.value)")
        }
    }
    
    // DELETE (part 2)
    func removeValue(sValue: T) {
        rootNode = removeNode(rNode: rootNode, value: sValue)
    }
    
    private func removeNode(rNode: BTNode<T>?, value: T) -> BTNode<T>? {
        guard let node = rNode else {
            return nil // The node does not exist
        }
        
        if value < node.value {
            // Search in the left subtree
            node.leftChild = removeNode(rNode: node.leftChild, value: value)
        } else if value > node.value {
            // Search in the right subtree
            node.rightChild = removeNode(rNode: node.rightChild, value: value)
        } else {
            // Node to be deleted found
            if node.leftChild == nil {
                // Case 1: No left child
                return node.rightChild
            } else if node.rightChild == nil {
                // Case 2: No right child
                return node.leftChild
            }
            
            // Case 3: Two children
            // Replace the value of the node with the smallest value in the right subtree
            let minNode = node.rightChild?.min
            node.value = minNode!.value
            // Remove the duplicate node from the right subtree
            node.rightChild = removeNode(rNode: node.rightChild, value: minNode!.value)
        }
        
        return node
    }
}

// DELETE (part 1)
// first we need to make an extension of the node class
extension BTNode {
    var min: BTNode {
        return leftChild?.min ?? self
    }
}

// EXAMPLE
// testing insert and search
var binaryST = BinarySearchTree<Int>()
for i in 0..<5 {
    binaryST.insert(insertedValue: i)
}
binaryST.searchValue(sValue: 4)
