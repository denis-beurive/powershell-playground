

# The call below executes the static method "GetProcesses()", from the .NET class "System.Diagnostics.Process".
# See: https://docs.microsoft.com/fr-fr/dotnet/api/system.diagnostics.process?view=netframework-4.7.2
#      https://docs.microsoft.com/fr-fr/dotnet/api/system.diagnostics.process.getprocesses?view=netframework-4.7.2
[System.Diagnostics.Process]::GetProcesses()

# The method above returns a list of objects. Theses objects have properties.
# There is a way to get the list of properties for each object returned by the method.
[System.Diagnostics.Process]::GetProcesses() | Get-Member -MemberType Property

# We see that one property has the name "ProcessName"... Great. Let's print the list of all process names.
# You do that by calling the command "Select-Object", which usage is given by the user manual:
# pwsh -Command "Get-Help Select-Object"
[System.Diagnostics.Process]::GetProcesses() | Select-Object -Property 'ProcessName'

# We can also keep only two values.
[System.Diagnostics.Process]::GetProcesses() | Select-Object -Property 'ProcessName','Responding'

# To get the type of the variable "$_":
#    $_.getType()  # => System.Object
# To get the members of the object "$_":
#    Get-Member -InputObject $_
# To get the properties of the object "$_":
#    Get-Member -MemberType NoteProperty -InputObject $_;
#
# NOte: NoteProperties are generic properties that are created by Powershell (as opposed to properties that are
#       inherited from a specific dotnet object type).
#       See: https://stackoverflow.com/questions/29141914/what-is-a-powershell-noteproperty
([System.Diagnostics.Process]::GetProcesses() | Select-Object -Property 'ProcessName','Responding').ForEach({
    # $_ is a "System.Object"
    # And it has two properties: ProcessName and Responding.
    Write-Host "$($_.ProcessName) => $($_.Responding)"
})

# Or... because "Get-Process" is the short name for "[System.Diagnostics.Process]::GetProcesses() | Select-Object -Property 'ProcessName','Responding'"
# Here, we build a hash that contains the data.
$data = @{}
(Get-Process | Select-Object -Property 'ProcessName','Responding').ForEach({
    if (! $data.ContainsKey($_.ProcessName)) {
        $data[$_.ProcessName] = @()
    }
    $data[$_.ProcessName] += $_.Responding
})

($data.GetEnumerator() | Sort-Object -Property Key -Descending).ForEach({
    Write-Host "$($_.Key):"
    $_.Value.Foreach({ # $_.Value is an array.
        Write-Host "`t$_"
    })
})

# Testing System.Diagnostics.Process::GetProcessesByName
[System.Diagnostics.Process]::GetProcessesByName('bash')

# First: consult the help for the command Get-Process, so you get its usage.
# pwsh -Command "Get-Help Get-Process"
(Get-Process -Name 'bash' | Select-Object -Property 'ProcessName','Responding').ForEach({
    # $_ is a "System.Object"
    # And it has two properties: ProcessName and Responding.
    Write-Host "$($_.ProcessName) => $($_.Responding)"
})

