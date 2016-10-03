defmodule Processes.Collector do
  def run(state \\ []) do
    state = receive do
      :clear ->
        []
      {:report, sender} ->
        send(sender, state)
        state
      {city, condition} ->
        [{city, condition} | state]
    end
    run(state)
  end
end
