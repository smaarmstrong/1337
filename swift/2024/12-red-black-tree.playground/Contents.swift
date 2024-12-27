import Foundation

// RED-BLACK TREE

// a binary search tree where two colors are defined
// as parameters to solve problems with insertion & deletion
// turning binary search trees into linked lists

// useful for worst case scenarios for search, insertion,
// and deletion operations

// traits
// red / black nodes
// root nodes are black
// nil leaves are black
// red nodes have black children

// for each node, all simple paths from nodes
// to descendent leaves must have the same number of blacks

// IMPLEMENTATION

private enum RBNodeColor {
    case red
    case black
}

public class RBNode<T: Comparable>: Equatable {
    var color: RBNodeColor = .black
    var key: T?
    var leftChild: RBNode<T>?
    var rightChild: RBNode<T>?
    weak var parent: RBNode<T>?
    
    public init(key: T?, leftChild: RBNode<T>?, rightChild: RBNode<T>?, parent: RBNode<T>?) {
        self.key = key
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
        self.leftChild?.parent = self
        self.rightChild?.parent = self
    }
    
    public convenience init(key: T?) {
        self.init(key: key, leftChild: RBNode(), rightChild: RBNode(), parent: RBNode())
    }
        // For initializing the nullLeaf
    public convenience init() {
        self.init(key: nil, leftChild: nil, rightChild: nil, parent: nil)
        self.color = .black
    }
}

public class RedBlackTree<T: Comparable> { 
    public typealias RBTreeNode = RBNode<T>
    private var root: RBTreeNode
    private var size = 0
    let nullLeaf = RBTreeNode()
    public init() {
        root = nullLeaf
    }
}

// Equatable protocol
extension RBNode {
    static public func == <T>(lhs: RBNode<T>, rhs: RBNode<T>) ->
    Bool {
        return lhs.key == rhs.key
    }
}
