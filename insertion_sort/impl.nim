var a = @[4, 5, 6, 7, 1, 33, 5, 12]

proc insertionSort(a: var seq[int]) =
    let length = a.len 
    
    if length <= 1:
        echo "Already sorted"
        return

    for i in countup(1, length - 1):
        let key = a[i]
        var j = i - 1
        
        while (j >= 0) and (a[j] > key): 
            a[j + 1] = a[j]
            dec(j)
        a[j + 1] = key
        
echo a
insertionSort(a)
echo a

