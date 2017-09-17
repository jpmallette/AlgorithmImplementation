#http://interactivepython.org/runestone/static/pythonds/Trees/NodesandReferences.html

class BinaryTree:
    def __init__(self,rootObj):
        self.key = rootObj
        self.leftChild = None
        self.rightChild = None

    def insertLeft(self,newNode):
        if self.leftChild is None:
            self.leftChild = BinaryTree(newNode)
        else:
            # we insert a node and push 
            # the existing child down one level in the tree.
            t = BinaryTree(newNode)
            t.leftChild = self.leftChild 
            self.leftChild = t

    def insertRight(self,newNode):
        if self.rightChild is None:
            self.rightChild = BinaryTree(newNode)
        else:
            t = BinaryTree(newNode)
            t.rightChild = self.rightChild
            self.rightChild = t

    def getRightChild(self):
        return self.rightChild

    def getLeftChild(self):
        return self.leftChild

    def setRootVal(self,obj):
        self.key = obj

    def getRootVal(self):
        return self.key

def test_tree_insertion():
    r.insertLeft('b')
    assert r.leftChild.key == 'b'

    r.insertLeft('b')
    assert r.leftChild.leftChild.key == 'b'

def test_travel_left_from_root_to_leaf_node():
    # do not put while loop with recursion.... a recursion is already a loop, but careful
    r = BinaryTree('a')
    r.insertLeft('d')
    r.insertLeft('c')
    r.insertLeft('b')

    # resulting tree a - b - c - d
    def travel_left_from_root_to_leaf_node(r):
        if r is None:
            return 
        else:
            print(r.key)
            travel_left_from_root_to_leaf_node(r.leftChild)

    travel_left_from_root_to_leaf_node(r)    

    



