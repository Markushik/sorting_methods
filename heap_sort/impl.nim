var a = @[4, 5, 6, 7, 1, 33, 5, 12]

proc leftChild(i: int): int = return 2*i + 1
proc rightChild(i: int): int = return 2*i + 2

proc heapify(a: var seq[int], length: int, i: int) = # просеивание вниз
    var largest = i

    let left = leftChild(i)
    let right = rightChild(i)

    if (length > left) and (a[left] > a[largest]):
        largest = left
    if (length > right) and (a[right] > a[largest]):
        largest = right
    if largest != i:
        swap(a[i], a[largest])
        heapify(a, length, largest) # просеивание родительского элемента дальше

proc heapSort(a: var seq[int]) =
    # n // 2 - 1 -- листья 
    let length = a.len

    for i in countdown(length div 2 - 1, 0):  # перестройка дерева на условие выполнения условий кучи -- максимальный элемент находится в начале
        heapify(a, length, i)
    for i in countdown(length - 1, 1):
        swap(a[0], a[i])
        heapify(a, i, 0)

echo a
heapSort(a)
echo a
