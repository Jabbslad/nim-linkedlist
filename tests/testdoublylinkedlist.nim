import unittest

import linkedlist/doublylinkedlist

test "creates correct type":
  let ll = newDoublyLinkedList[string]()
  check (ll is DoublyLinkedList[string])

test "empty list":
  let ll = newDoublyLinkedList[int]()
  check ll.head == nil
  check ll.tail == nil