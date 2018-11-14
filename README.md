
# Introduction

    $ pwsh -v
    PowerShell 6.1.1
    
# Getting help from the command line 

    $ pwsh -Command "Get-Help Get-ChildItem"
    $ pwsh -Command "Get-Help Get-ChildItem -Detailed"
    $ pwsh -Command "Get-Help Get-ChildItem -Full"
    $ pwsh -Command "Get-Help Get-ChildItem -Parameter *"
    $ pwsh -Command "Get-Help Get-ChildItem -Examples"
    $ pwsh -Command "Get-Help Get-ChildItem -Online"
    
    $ pwsh -Command "Get-Help Sort-Object"
    $ pwsh -Command "Get-Help Sort-Object -Online"
    
    $ pwsh -Command "Get-Help -Category Cmdlet"
    $ pwsh -Command "Get-Command"
    $ pwsh -Command "Get-Command -CommandType Alias"    
    $ pwsh -Command "Get-Command -CommandType Function"
    $ pwsh -Command "Get-Command -CommandType Script"

# Get the properties and the methods of an array

    $ pwsh -Command "Get-Help Get-Member"
    $ pwsh -Command '$a=@(1,2,3); Get-Member -MemberType Property -InputObject $a'
    $ pwsh -Command '$a=@(1,2,3); Get-Member -MemberType Method -InputObject $a'
    
    
