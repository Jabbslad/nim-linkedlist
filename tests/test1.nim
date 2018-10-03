import unittest

import linkedlist
import sequtils

test "creates correct type":
  let ll = newLinkedList[string]()
  check (ll is LinkedList[string])

test "empty list":
  let ll = newLinkedList[int]()
  check ll.head == nil

test "can prepend item":
  var ll = newLinkedList[string]()
  prepend(ll, "hello")
  check ll.head.data == "hello"

test "items in correct order":
  var ll = newLinkedList[string]()
  prepend(ll, "hello")
  prepend(ll, "world")
  check @["world", "hello"] == toSeq(items(ll))

test "pairs in correct order":
  var ll = newLinkedList[string]()
  prepend(ll, "hello")
  prepend(ll, "world")
  check @[(a: 0, b: "world"), (a: 1, b: "hello")] == toSeq(pairs(ll))
