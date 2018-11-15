

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


