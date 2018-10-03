type
  LinkedList[T] = object
    head*: ref Node[T]

  Node[T] = object
    data: T
    next: ref Node[T]

proc newLinkedList*[T](): LinkedList[T] =
  new(result)

proc add*[T](L: var LinkedList[T], node: Node[T]) = 
  if L == nil:
    return
  var it = L.head
  while it.next != nil:
    it = it.next
  it.next = node

proc add*[T](L: LinkedList[T], data: T) = 
  var node = new(Node[T])
  node.data = data
  add(L, node)

iterator items*[T](L: LinkedList[T]): T =
  if L.head != nil:
    var it = L.head
    while it != nil:
      yield it.data
      it = it.next