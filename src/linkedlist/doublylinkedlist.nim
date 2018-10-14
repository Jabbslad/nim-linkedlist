type
  DoublyLinkedListNode*[T] = ref DoublyLinkedListNodeObj[T]

  DoublyLinkedListNodeObj*[T] = object
    prev*, next*: DoublyLinkedListNode[T]
    data*: T

  DoublyLinkedList*[T] = object
    head*, tail*: DoublyLinkedListNode[T]

proc newDoublyLinkedList*[T](): DoublyLinkedList[T] =
  discard

proc newDoublyLinkedNode*[T](value: T): DoublyLinkedListNode[T] =
  new(result)
  result.data = value

proc prepend*[T](L: var DoublyLinkedList[T], n: DoublyLinkedListNode[T]) = 
  if L.head != nil:
    L.head.prev = n
  n.next = L.head
  L.head = n
  if L.tail == nil:
    L.tail = L.head

proc prepend*[T](L: var DoublyLinkedList[T], value: T) =
  prepend(L, newDoublyLinkedNode(value))

proc append*[T](L: var DoublyLinkedList[T], n: DoublyLinkedListNode[T]) =
  if L.tail == nil:
    L.tail = n
  else:
    n.prev = L.tail
    L.tail.next = n
    L.tail = n

  if L.head == nil:
    L.head = L.tail

proc append*[T](L: var DoublyLinkedList[T], value: T) =
  append(L, newDoublyLinkedNode(value))

iterator items*[T](L: DoublyLinkedList[T]): T =
  var n = L.head
  while n != nil:
    yield n.data
    n = n.next

iterator pairs*[T](L: DoublyLinkedList[T]): tuple[a: int, b: T] =
  var i: int
  for item in L:
    yield(i, item)
    inc(i)

proc `$`*[T](L: DoublyLinkedList[T]): string = 
  result = "["
  for item in L:
    if result.len > 1: result.add(", ")
    result.addQuoted(item)
  result.add("]")

iterator nodes*[T](L: DoublyLinkedList[T]): DoublyLinkedListNode[T] =
  if L.head != nil:
    var it = L.head
    while it != nil:
      yield it
      it = it.next