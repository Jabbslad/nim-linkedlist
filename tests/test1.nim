import unittest

import linkedlist
import sequtils

test "creates correct type":
  let x = newLinkedList[string]()
  check (x is LinkedList[string])

test "can prepend item":
  var ll = newLinkedList[string]()
  prepend(ll, "hello")
  check ll.head.data == "hello"

test "items in correct order":
  var ll = newLinkedList[string]()
  prepend(ll, "hello")
  prepend(ll, "world")
  check @["world", "hello"] == toSeq items(ll)
