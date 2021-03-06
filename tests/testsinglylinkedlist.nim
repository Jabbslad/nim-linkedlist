import unittest

import linkedlist/singlylinkedlist
import sequtils

test "creates correct type":
  let ll = newSinglyLinkedList[string]()
  check (ll is SinglyLinkedList[string])

test "empty list":
  let ll = newSinglyLinkedList[int]()
  check ll.head == nil
  check ll.tail == nil

test "can prepend items":
  var ll = newSinglyLinkedList[string]()
  prepend(ll, "hello")
  check ll.head.data == "hello"
  check ll.tail.data == "hello"
  prepend(ll, "world")
  check ll.head.data == "world"
  check ll.tail.data == "hello"
  check ll.head.next == ll.tail
  check ll.tail.next == nil

test "can append items":
  var ll = newSinglyLinkedList[string]()
  append(ll, "hello")
  check ll.head.data == "hello"
  check ll.tail.data == "hello"
  append(ll, "world")
  check ll.head.data == "hello"
  check ll.tail.data == "world"
  check ll.head.next == ll.tail
  check ll.tail.next == nil

test "items in correct order":
  var ll = newSinglyLinkedList[string]()
  prepend(ll, "hello")
  prepend(ll, "world")
  prepend(ll, "goodbye")
  check @["goodbye", "world", "hello"] == toSeq(items(ll))

test "pairs in correct order":
  var ll = newSinglyLinkedList[string]()
  prepend(ll, "hello")
  prepend(ll, "world")
  prepend(ll, "goodbye")
  check @[(a: 0, b: "goodbye"), (a: 1, b: "world"), (a: 2, b: "hello")] == toSeq(pairs(ll))

test "to string for items":
  var ll = newSinglyLinkedList[string]()
  append(ll, "hello")
  append(ll, "world")
  check $ll == "[\"hello\", \"world\"]"

test "to string for zero items":
  var ll = newSinglyLinkedList[string]()
  check $ll == "[]"

test "empty nodes":
  var ll = newSinglyLinkedList[string]()
  check newSeq[SinglyLinkedListNode[string]](0) == toSeq(nodes(ll))

test "non-empty nodes":
  var ll = newSinglyLinkedList[string]()
  append(ll, "hello")
  append(ll, "world")
  check @[ll.head, ll.tail] == toSeq(nodes(ll))

test "can remove item O(n)":
  var ll = newSinglyLinkedList[string]()
  append(ll, "hello")
  var n = new(SinglyLinkedlistNode[string])
  n.data = "world"
  append(ll, n)
  append(ll, "goodbye")
  remove(ll, n)
  check @["hello", "goodbye"] == toSeq(items(ll))

test "can remove item from empty list":
  var ll = newSinglyLinkedList[string]()
  var n = new(SinglyLinkedlistNode[string])
  n.data = "hello"
  remove(ll, n)
  check newSeq[SinglyLinkedListNode[string]](0) == toSeq(nodes(ll))

test "can remove item from list with 1 item":
  var ll = newSinglyLinkedList[string]()
  var n = new(SinglyLinkedlistNode[string])
  n.data = "hello"
  append(ll, n)
  remove(ll, n)
  check newSeq[SinglyLinkedListNode[string]](0) == toSeq(nodes(ll))
