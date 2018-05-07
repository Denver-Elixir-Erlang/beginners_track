MATCH operator not ASSIGNMENT… we say it “binds” values

like a math problem

```elixir
x = 1
1 = x

1 = 2 # => ** (MatchError) no match of right hand side value: 2

# rebind
x = 2

^x = 3 # => ** (MatchError) no match of right hand side value: 2

x + b = 5 # gotta move the things we know to the right
b = 5 - x

list = [1, 2, 3]

[1, middle, 3] = list

[1 | tail] = list
tail # => [2,3]

{:ok, value} = {:ok, "Successful!"}

"bo" <> last_letter = "boo"
last_letter # => "o"

length([1,2,3]) = 3 # ** (CompileError) iex:9: cannot invoke remote function :erlang.length/1 inside match

_ = "whatever"
_bob = "whatever"
_bob # the underscored variable "_bob" is used after being set. A leading underscore indicates that the value of the variable should be ignored. If this is intended please rename the variable to remove the underscore

```
