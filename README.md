# Introduction

    $ pwsh -v
    PowerShell 6.1.1
    
# Commands

Commands are sorted according to their types:

* CmdLet
* Function
* Script

[CmdLets vs functions](https://powershell.org/forums/topic/cmdlets-vs-functions/)

> Basically a true PowerShell cmdlet is written in a .NET programming language, typically C#, and compiled – so in a way
it's a real application. An advanced function is written in PowerShell (although you could include some custom C# code)
and is not compiled.

## CmdLet or "command-let"

Basically a true PowerShell cmdlet is written in a .NET programming language, typically C#, and compiled – so in a way
it's a real application. Cmdlets perform an action and typically return a Microsoft .NET Framework object to the next
command in the pipeline.

To get the list of available CmdLets:

    pwsh -Command "Get-Command -CommandType CmdLet"

The list can also be found [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/?view=powershell-6).
This on-line documentation shows the user manual for all CmdLets.

## Functions

A function is written in PowerShell (although you could include some custom C# code) and is not compiled.

To get the list of available CmdLets:

    pwsh -Command "Get-Command -CommandType Function"

# Getting help from the command line 

See [https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/Get-Command?view=powershell-5.1](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/Get-Command?view=powershell-5.1).

## Get the list of available commands (functions and CmdLet)

    $ pwsh -Command "Get-Command"
    
To get the list of the functions only:

    $ pwsh -Command "Get-Command -CommandType Function"
    
To get the list of the CmdLets only:
    
    $ pwsh -Command "Get-Command -CommandType CmdLet"
    
To get the list of the aliases only:
    
    $ pwsh -Command "Get-Command -CommandType Alias"    
    
To get the list of the scripts only:
    
    $ pwsh -Command "Get-Command -CommandType Script"    
    
## Get help on a given command  

The general command is:

    $ pwsh -Command "Get-Help <command name> [options]"

This works for aliases, functions or CmdLets:
    
    $ pwsh -Command "Get-Help chdir" # Alias
    $ pwsh -Command "Get-Help Find-Module" # Function
    $ pwsh -Command "Get-Help Start-Sleep" # CmdLet
    
Different levels/formats of documentation are available:
   
    $ pwsh -Command "Get-Help Get-ChildItem"
    $ pwsh -Command "Get-Help Get-ChildItem -Detailed"
    $ pwsh -Command "Get-Help Get-ChildItem -Full"
    $ pwsh -Command "Get-Help Get-ChildItem -Parameter *"
    $ pwsh -Command "Get-Help Get-ChildItem -Examples"
    $ pwsh -Command "Get-Help Get-ChildItem -Online"
    
# Get the properties and the methods of a variable

    $ pwsh -Command "Get-Help Get-Member"
    $ pwsh -Command '$a=@(1,2,3); Get-Member -MemberType Property -InputObject $a'
    $ pwsh -Command '$a=@(1,2,3); Get-Member -MemberType Method -InputObject $a'
    $ pwsh -Command '@(1,2,3) | Get-Member -MemberType Property'
        
# Miscellaneous

Get the command that corresponds to a given alias:    

    export MYALIAS="select"
    pwsh -Command "Get-Command -CommandType Alias" | perl -ne 'if ($_ =~  m/^Alias\s+([^\s]+) \-> ([^\s]+)/) { if ($ENV{'MYALIAS'} eq "$1") { print "$2\n"; } }'
    
Get the type (CmdLet, Function...) of the command that corresponds to a given alias:
    
    export MYALIAS="select"
    cmd=$(pwsh -Command "Get-Command -CommandType Alias" | perl -ne 'if ($_ =~  m/^Alias\s+([^\s]+) \-> ([^\s]+)/) { if ($ENV{'MYALIAS'} eq "$1") { print "$2\n"; } }') 
    pwsh -Command "Get-Command" | grep "$cmd" | cut -d' ' -f 1
    

    
