type
  SinglyLinkedList*[T] = object
    head*: SinglyLinkedlistNode[T]
    tail*: SinglyLinkedlistNode[T]

  SinglyLinkedlistNode[T] = ref Node[T]

  Node*[T] = object
    data*: T
    next*: SinglyLinkedlistNode[T]

proc newNode[T](data: T): SinglyLinkedlistNode[T] = 
  new(result)
  result.data = data

proc newSinglyLinkedList*[T](): SinglyLinkedList[T] =
  discard

proc prepend*[T](L: var SinglyLinkedList[T], node: SinglyLinkedlistNode[T]) = 
  if L.head == nil:
    L.head = node
    L.tail = node
  else:
    node.next = L.head
    L.head = node

proc prepend*[T](L: var SinglyLinkedList[T], data: T) = 
  prepend(L, newNode(data))

proc append*[T](L: var SinglyLinkedList[T], node: SinglyLinkedlistNode[T]) =
  if L.tail == nil:
    L.tail = node
    L.head = node
  else:
    L.tail.next = node
    L.tail = node

proc append*[T](L: var SinglyLinkedList[T], data: T) = 
  append(L, newNode(data))

iterator items*[T](L: SinglyLinkedList[T]): T =
  if L.head != nil:
    var it = L.head
    while it != nil:
      yield it.data
      it = it.next

iterator pairs*[T](L: SinglyLinkedList[T]): tuple[a: int, b: T] =
  var i: int
  for item in L:
    yield (i, item)
    inc(i)

proc `$`*[T](L: SinglyLinkedList[T]): string =
  result = "["
  for item in L:
    if result.len > 1: result.add(", ")
    result.addQuoted(item)
  result.add("]")