type
  Node[T] = ref object
    data: T
    next: Node[T]

proc newNode*[T](data: T): Node[T] =
  new(result)
  result.data = data

proc add*[T](root: var Node[T], node: Node[T]) = 
  if root == nil:
    root = node
    return
  var it = root
  while it.next != nil:
    it = it.next
  it.next = node

proc add*[T](root: var Node[T], data: T) = 
  add(root, newNode(data))

iterator itr*[T](root: Node[T]): T =
  if root != nil:
    var it = root
    while it != nil:
      yield it.data
      it = it.next