import unittest

import linkedlist
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

test "can append items":
  var ll = newSinglyLinkedList[string]()
  append(ll, "hello")
  check ll.head.data == "hello"
  check ll.tail.data == "hello"
  append(ll, "world")
  check ll.head.data == "hello"
  check ll.tail.data == "world"

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
