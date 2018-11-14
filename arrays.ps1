
$myArray1 = @('a1', 'a2', 'a3')
$a1, $a2, $a3 = $myArray1
Write-Host "a1 = $a1"
Write-Host "a2 = $a2"
Write-Host "a3 = $a3"

Write-Host "Length = $($myArray1.Length)"
Write-Host "Number of elements: $($myArray1.Count)"
Write-Host "Type = $($myArray1.GetType())"
Write-Host "Index of the element which value is 'a2' = $($myArray1.IndexOf('a2'))"

# Values can be typed.
[string[]]$myArray2 = @('a1', 'a2', 'a3')
$a1, $a2, $a3 = $myArray2
Write-Host "a1 = $a1"
Write-Host "a2 = $a2"
Write-Host "a3 = $a3"

# Arrays can contain arrays.
$myArray3 = @(
    (1,2,3),
    ('a','b','c')
)

[System.Object[]]$myArray4 = @(
    (1,2,3),
    (10,20,30)
)

# Adding an element to an array.
[string[]]$myArray5 = @('a1', 'a2', 'a3')
$myArray5 += 'a4'

# Loop over each element of an array.
# The special variable "$_" (just like in Perl5) represents the current element.
$myArray1 = @('a1', 'a2', 'a3')
Write-Host "The content of the array is:"
$myArray1.ForEach({
    $symetrical = $myArray1.Get($myArray1.Count-1 - $myArray1.IndexOf($_))
    Write-Host "> $_ index:$($myArray1.IndexOf($_)) / $symetrical"
})

# Slicing an array.
$myArray1 = @('a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3')
Write-Host "The content of the array is:"
$myArray1[1..5].ForEach({
    Write-Host "> mtArray1[$($myArray1.IndexOf($_))] = $_"
})

# Catenate an array (just use +).
$myArray1 = @(10,2,30)
$myArray2 = @(4,5,6)
$myArray3 = $myArray1 + $myArray2
Write-Host "The content of the array is:"
$myArray3.ForEach({
    Write-Host "> myArray3[$($myArray3.IndexOf($_))] = $_"
})

# Sorting.
# To get the properties of an array:
#    pwsh -Command '$a=@(1,2,3); Get-Member -MemberType Property -InputObject $a'
# To get the help for the command Sort-Object:
#    pwsh -Command "Get-Help Sort-Object -Online"
#
# When sorting objects, Sort-Object uses the Compare method for each property. If a property does not implement
# IComparable, the cmdlet converts the property value to a string and uses the Compare method for System.String.
[int[]]$myArray1 = @(10,2,30)
[int[]]$myArray2 = @(4,5,6)
[int[]]$myArray3 = $myArray1 + $myArray2
Write-Host "The content of the array is:"
($myArray1 + $myArray2 | Sort-Object -Property Item).ForEach({
    Write-Host "> myArray3[$($myArray3.IndexOf($_))] = $_"
})




