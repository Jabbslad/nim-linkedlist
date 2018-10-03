type
  LinkedList*[T] = object
    head*: ref Node[T]
    tail*: ref Node[T]

  Node*[T] = object
    data*: T
    next*: ref Node[T]

proc newNode[T](data: T): ref Node[T] = 
  new(result)
  result.data = data

proc newLinkedList*[T](): LinkedList[T] =
  discard

proc prepend*[T](L: var LinkedList[T], node: ref Node[T]) = 
  if L.head == nil:
    L.head = node
    L.tail = node
  else:
    node.next = L.head
    L.head = node

proc prepend*[T](L: var LinkedList[T], data: T) = 
  prepend(L, newNode(data))

proc append*[T](L: var LinkedList[T], node: ref Node[T]) =
  if L.tail == nil:
    L.tail = node
    L.head = node
  else:
    node.next = L.tail
    L.tail = node

proc append*[T](L: var LinkedList[T], data: T) = 
  append(L, newNode(data))

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