# Lines that start with a "#" are comments.

$path = Get-Location

# To get all the properties of the variable path:
#    $path | Get-Member -MemberType Property
# To get all the methods:
#    $path | Get-Member -MemberType Method

# NOTES:
#    1. Unlike what you may expect if you use to use other scripting languages, the character used to escape a character
#       is not the back slash (\). Instead, it is the back quote (`).
#    2. In order to interpolate the result of a code evaluation, you can use "$(<your code>)".
#    3. String concatenation works. However, be aware that PowerShell adds spaces between the concatenate strings.

Write-Host "The drive is: `"$($path.Drive.ToString())`"."
if (!$path.Name) { Write-Host "The value of the property `"Path`" is null" }
Write-Host "The provider is: `"$($path.Provider.ToString())`""
Write-Host "The provider path is: `"$($path.ProviderPath.ToString())`""
$p = $path.Drive.ToString()
Write-Host "The drive is: ${p}"
Write-Host "The drive is: " $p # See: PoweShell adds a space!

# Here strings

$myHereSingleQuotedString = @'
This is a single quoted string $($path.Drive.ToString())
'@

$myHereDoubleQuotedString = @"
The drive is $($path.Drive.ToString())
"@

Write-Host $myHereSingleQuotedString
Write-Host $myHereDoubleQuotedString




