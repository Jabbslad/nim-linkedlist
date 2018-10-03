type
  LinkedList*[T] = object
    head*: ref Node[T]

  Node*[T] = object
    data*: T
    next*: ref Node[T]

proc newLinkedList*[T](): LinkedList[T] =
  discard

proc prepend*[T](L: var LinkedList[T], node: ref Node[T]) = 
  if L.head == nil:
    L.head = node
  else:
    node.next = L.head
    L.head = node

proc prepend*[T](L: var LinkedList[T], data: T) = 
  var node = new(Node[T])
  node.data = data
  prepend(L, node)

iterator items*[T](L: LinkedList[T]): T =
  if L.head != nil:
    var it = L.head
    while it != nil:
      yield it.data
      it = it.next

iterator pairs*[T](L: LinkedList[T]): tuple[a: int, b: T] =
  var i: int
  for item in L:
    yield (i, item)
    inc(i)