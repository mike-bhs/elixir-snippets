defmodule MessageReceiver do
  def receive_message do
    receive do
      {:name, name} -> IO.puts("Your name is: #{name}")
      {:gender, gender} -> IO.puts("Your gender is: #{gender}")
    end

    receive_message()
  end
end

pid = spawn(MessageReceiver, :receive_message, [])

send(pid, {:name, "john"})
send(pid, {:gender, "male"})

