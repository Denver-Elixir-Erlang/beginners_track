defmodule Processes.Loopy do
  def loop do
    loop()
  end
  # receive do
  #   {:hi, sender} ->
  #     send(sender, "Hi back!")
  #   anything_else ->
  #     IO.puts("I got: #{anything_else}")
  # end
end
