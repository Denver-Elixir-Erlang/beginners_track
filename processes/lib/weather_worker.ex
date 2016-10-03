defmodule Processes.WeatherWorker do
  def get_weather(city) do
    :timer.sleep(:random.uniform(500))
    {:ok, response} = HTTPoison.get "http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=7dfa0de6dd435ac1a59653aa206a0f88"
    parsed_response = Poison.decode!(response.body)
    collector_pid = Process.whereis(:collector)
    weather = parsed_response["weather"] |> List.first
    send(collector_pid, {city, weather["description"]})
  end
end
