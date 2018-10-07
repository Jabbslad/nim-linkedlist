type
  DoublyLinkedListNodeRef[T] = ref DoublyLinkedListNodeObj[T]

  DoublyLinkedListNodeObj[T] = object
    prev*, next*: DoublyLinkedListNodeRef[T]

  DoublyLinkedListRef*[T] = ref DoublyLinkedListObj[T]

  DoublyLinkedListObj*[T] = object
    head*, tail*: DoublyLinkedListNodeRef[T]

proc newDoublyLinkedList*[T](): DoublyLinkedListRef[T] =
  discard