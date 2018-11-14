
$h = @{
    key1 = 'a1';
    key2 = 'a2';
    "key 3" = 'a3';
}

# You can specify the type of the variable.
[hashtable]$h = @{}

# By default, just like Perl, PoweShell creates non-ordered dictionaries.
# However, it is possible to create ordered dictionaries (which is always the case with PHP).
$h = [ordered]@{
    key1 = 'a1';
    key2 = 'a2';
    "key 3" = 'a3';
}

# Getting the keys...
$h.Keys.ForEach({
    Write-Host "> $_"
})

# Getting the value...
$h.Values.ForEach({
    Write-Host "> $_"
})

# Get ont item.
Write-Host "The number of keys is: $($h.Count)"
Write-Host "key1 => $($h.key1)"
Write-Host "key 3 => $($h.'key 3')"

# Add keys.
$h.Add('key4', 'a4')
$h['key5'] = 'a5'
$h += @{key6 = 'a6'} # Because you can catenate hashes...
Write-Host "The content of the hash is:"
$h.Keys.ForEach({
    Write-Host "> $_ = $($h[$_])"
})

# Removing keys.
$h.Remove('key6')
Write-Host "The content of the hash is:"
$h.Keys.ForEach({
    Write-Host "> $_ = $($h[$_])"
})

# Using the enumerator.
Write-Host "The content of the hash is:"
$h.GetEnumerator().ForEach({
    # $_ is an object that contains 2 properties: Key and Value.
    Write-Host "> $($_.Key) = $($_.Value)"
})

# Sort the keys
Write-Host "The content of the hash is:"
$elements = $h.GetEnumerator() | Sort-Object -Property Key -Descending
$elements.ForEach({
    Write-Host "> $($_.Key) = $($_.Value)"
})


