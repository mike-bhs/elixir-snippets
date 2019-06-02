defmodule Calculator do
  def perform do
    # do some work here
    :timer.sleep(:timer.seconds(3))

    41
  end
end


value = 1

IO.puts("Async calculation starts")
task = Task.async(Calculator, :perform, [])

IO.puts("Sync calculation starts")
# assume we do some other calculation here
:timer.sleep(:timer.seconds(1))

result = Task.await(task)

IO.puts(value + result)
