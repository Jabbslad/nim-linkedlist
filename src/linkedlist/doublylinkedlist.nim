type
  DoublyLinkedListObj*[T] = object

proc newDoublyLinkedList*[T](): DoublyLinkedListObj[T] =
  discard