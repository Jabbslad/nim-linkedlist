import unittest

import linkedlist/doublylinkedlist

test "creates correct type":
  let ll = newDoublyLinkedList[string]()
  check (ll is DoublyLinkedListObj[string])