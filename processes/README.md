# Processes
This is stuff that OTP builds on

looper = spawn(Processes.Loopy, :loop, [])
pid(0,84,0)
Process.alive?(looper)
Process.registered

Process.info(looper)

# we need to add our process
Process.register(looper, :looper)
Process.registered
# we should see our process now

Process.exit(looper, :kill)
Process.whereis(:looper)

# let's dig into a process a little more
looper = spawn(Loopy, :loop, [])
Process.info(looper)
:observer.start


If we kill a process, it clears out the memory it had allocated. Since everything was a copy and not a pointer, it means that memory is freed up.


collector = spawn(Processes.Collector, :run, [[]])
Process.register(collector, :collector)
Processes.WeatherWorker.get_weather("denver")
send(collector, {:report, self})
flush()

send(collector, :clear)
["denver", "cleveland", "boston", "london", "dublin", "dallas"] |> Enum.each(&Processes.WeatherWorker.get_weather(&1))
send(collector, {:report, self})
flush()
