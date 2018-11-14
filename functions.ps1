
# A basic function.
function print_hello_world {
    Write-Host "Hello World!"
}
print_hello_world

# Function can be overwritten!
function print_hello_world {
    Write-Host "Hello new World!"
}
print_hello_world

# Or... the list of parameters is optional.
function print_hello_world() {
    Write-Host "Hello new World!"
}
print_hello_world

# Named parameters.
function name_to_uppercase {
    param ([string]$name) # Warning: do NOT put spaces between the type specifier and the name of the parameter.
    return $name.ToUpper()
}
$name = name_to_uppercase 'toto'
Write-Host "The name in uppercase is $name"

# Or... this is another way to define the paramters.
function name_to_uppercase([string]$name) { # Warning: do NOT put spaces between the type specifier and the name of the parameter.
    return $name.ToUpper()
}
Write-Host "The name in uppercase is $(name_to_uppercase 'toto')"

# Parameters can be specified relatively to their positions into the list of parameters.
# Or you can specify the parameters by their names.
function name_to_uppercase([string]$name, [int]$age) { # Warning: do NOT put spaces between the type specifier and the name of the parameter.
    return $name.ToUpper() + " and he is $age years old"
}
Write-Host "His name in uppercase is $(name_to_uppercase -age 12 -name 'toto')"
Write-Host "His name in uppercase is $(name_to_uppercase 'toto' 12)"

# You can set default values for parameters.
function name_to_uppercase([string]$name, [int]$age=18) { # Warning: do NOT put spaces between the type specifier and the name of the parameter.
    return $name.ToUpper() + " and he is $age years old"
}
Write-Host "His name in uppercase is $(name_to_uppercase 'toto')"

# Parameters with default values don't have to be declared at the end of the list! (which is the case for PHP, Dart, Go...)
# However, in this case, you must call the function by specifying the names of the parameters.
function name_to_uppercase([string]$name="Unknown", [int]$age) { # Warning: do NOT put spaces between the type specifier and the name of the parameter.
    return $name.ToUpper() + " and he is $age years old"
}
Write-Host "Hist name in uppercase is $(name_to_uppercase -age 20)"

# Positional parameters.
function name_to_uppercase {
    Write-Host "You passed $($args.Count) parameters"
    $name = $args[0]
    $age = $args[1]
    return $name.ToUpper() + " and he is $age years old"
}
Write-Host "His name in uppercase is $(name_to_uppercase 'Albert' 20)"

# Switches.
function name_to_uppercase {
    param ([Switch]$up, [String]$name)
    if ($up) { return $name.ToUpper() }
    return $name
}
Write-Host "The name in uppercase is $(name_to_uppercase -up toto)"
Write-Host "The name in uppercase is $(name_to_uppercase -up:$true toto)"
Write-Host "The name in uppercase is $(name_to_uppercase toto)"
Write-Host "The name in uppercase is $(name_to_uppercase -up:$false toto)"

# Splating... that works.
# Warning: Perl also uses the character @ for arrays.
#          However, here, the character @ is used to "splat" the array $args.
$args = @('Albert', 23)
function name_to_uppercase {
    Write-Host "You passed $($args.Count) parameters"
    $name = $args[0]
    $age = $args[1]
    return $name.ToUpper() + " and he is $age years old"
}
Write-Host "The name in uppercase is $(name_to_uppercase @args)"

# Pipelines.
function stack_it {
    begin {
        Write-Host "Start"
        $n = 1
    }
    process {
        Write-Host "$n > $_"
        $n++
    }
    end {
        Write-Output "End"
    }
}
10, 20, 30 | stack_it
$a = @(100, 200, 300)
$a | stack_it

