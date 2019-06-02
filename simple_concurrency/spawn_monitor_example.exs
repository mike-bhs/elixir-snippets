defmodule TaskProcessor do
  def perform do
    # do some work here
    :timer.sleep(:timer.seconds(3))

    exit(:job_is_done)
  end
end

IO.puts("Spawning process to monitor")
spawn_monitor(TaskProcessor, :perform, [])

receive do
  {:DOWN, _ref, :process, _from_pid, reason} -> IO.puts("Received a reason: #{reason}")
end
