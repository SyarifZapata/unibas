class Deque:

    def __init__(self):         # Constructor
        self.items = []

    def isEmpty(self):          # If Deque is empty, this will return true
        return self.items == []

    def addLast(self, item):
        self.items.append(item)

    def addFirst(self, item):
        self.items.insert(0,item)

    def size(self):
        return len(self.items)

    def removeLast(self):
        return self.items.pop()

    def removeFirst(self):
        return self.items.pop(0)


d=Deque()
print(d.isEmpty())
d.addFirst(8)
d.addFirst('Basel')
d.addLast('Uni')
d.addLast('CS202')
d.addFirst('2016')
print(d.size())
print(d.removeLast() + ' ' + d.removeFirst() + ': ' + d.removeLast() + '-' + d.removeFirst())
print(d.size())

"""
Erwartete Ausgabe:
True
5
CS202 2016, Uni-Basel
1
"""