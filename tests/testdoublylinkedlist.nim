import unittest

import linkedlist/doublylinkedlist

test "creates correct type":
  let ll = newDoublyLinkedList[string]()
  check (ll is DoublyLinkedList[string])

test "empty list":
  let ll = newDoublyLinkedList[int]()
  check ll.head == nil
  check ll.tail == nil

test "can prepend items":
  var ll = newDoublyLinkedList[string]()
  prepend(ll, "hello")
  check ll.head.data == "hello"
  check ll.tail.data == "hello"
  prepend(ll, "world")
  check ll.head.data == "world"
  check ll.tail.data == "hello"
