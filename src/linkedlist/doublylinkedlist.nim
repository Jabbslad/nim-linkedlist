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
    L.tail.next = n
    L.tail = n

  if L.head == nil:
    L.head = L.tail

proc append*[T](L: var DoublyLinkedList[T], value: T) =
  append(L, newDoublyLinkedNode(value))

iterator items*[T](L: var DoublyLinkedList[T]): T =
  var n = L.head
  while n != nil:
    yield n.data
    n = n.next

iterator pairs*[T](L: var DoublyLinkedList[T]): tuple[a: int, b: T] =
  var i: int
  for item in L:
    yield(i, item)
    inc(i)