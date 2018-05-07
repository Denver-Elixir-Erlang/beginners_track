defmodule PatternMatching do
  def match_key(%{bob: bobs_value} = jeffrey) do
    IO.puts("Matched #{inspect(jeffrey)}")
    IO.puts("The value for :bob is #{bobs_value}")
  end

  def match_key(%{} = missing_bob) do
    IO.puts("That's a map, but there is not bob, just #{inspect(Map.keys(missing_bob))}")
  end

  def match_binary(<<head::binary-size(4)>> <> rest) do
    IO.puts(head)
    IO.puts(rest)
  end

  def match?(same, same), do: true
  def match?(_thing1, _thing2), do: false

  def rotate([_a, b, c, d], new_thing), do: [b, c, d, new_thing]

  def shift([head | tail]), do: {head, tail}

  def unshift(list, new_thing), do: [new_thing | list]

  # these are two different functions!
  def add(first, second) do
    first + second
  end

  def add([first, second]) do
    add(first, second)
  end

  # recursion for fun and profit
  def sum(start_list) when is_list(start_list) do
    IO.puts("I'm in the start clause.")
    sum(0, start_list)
  end

  def sum(_) do
    IO.puts("I only take lists.")
  end

  defp sum(total, []) do
    IO.puts("I'm in the final clause.")
    total
  end

  defp sum(total, [head | tail]) do
    IO.puts("I'm in the meaty clause.")
    total = total + head
    sum(total, tail)
  end

  def what_is_it?(thing) do
    case thing do
      [] -> "empty list"
      int when is_integer(int) -> "integer"
      atom when is_atom(atom) -> "atom"
      string when is_binary(string) -> "string"
      _ -> "beats me"
    end
  end

  defmodule Person do
    defstruct [name: "joe", age: 92]
  end

  def age(%Person{} = person), do: person.age
  def age(_), do: raise(ArgumentError, "must pass a Person")
end
