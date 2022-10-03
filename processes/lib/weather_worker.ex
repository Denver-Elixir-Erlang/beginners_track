defmodule Processes.WeatherWorker do
  def get_weather(city) do
    :timer.sleep(:rand.uniform(500))
    #{:ok, response} = HTTPoison.get "http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=7dfa0de6dd435ac1a59653aa206a0f88"
    #parsed_response = Jason.decode!(response.body)
    collector_pid = Process.whereis(:collector)
    weathers = ["sunny", "cloudy", "hot", "cold", "meh"]
    #weather = parsed_response["weather"] |> List.first
    send(collector_pid, {city, Enum.random(weathers)})
  end
end
