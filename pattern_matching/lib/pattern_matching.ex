defmodule PatternMatching do
  import IEx

  def add(first, second) do
    first + second
  end
  def add([first, second]) do
    add(first, second)
  end

  def sum(start_list) when is_list(start_list) do
    IO.puts("I'm in the start clause.")
    do_sum(0, start_list)
  end
  defp do_sum(total, []) do
    IO.puts("I'm in the fin clause.")
    total
  end
  defp do_sum(total, [head | tail]) do
    IO.puts("I'm in the meaty clause.")
    total = total + head
    do_sum(total, tail)
  end
  def sum(_) do
    IO.puts("I only take lists.")
  end

  def match_key(%{bob: 1} = jeffrey) do
    IO.puts("Matched #{inspect(jeffrey)}")
  end
end
