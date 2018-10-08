type
  DoublyLinkedListNodeRef[T] = ref DoublyLinkedListNodeObj[T]

  DoublyLinkedListNodeObj[T] = object
    prev*, next*: DoublyLinkedListNodeRef[T]

  DoublyLinkedList*[T] = object
    head*, tail*: DoublyLinkedListNodeRef[T]

proc newDoublyLinkedList*[T](): DoublyLinkedList[T] =
  discard