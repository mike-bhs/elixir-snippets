defmodule Greeter do
  @callback hello(String.name) :: nil
end

defmodule User do
  @behaviour Greeter

  @impl Greeter
  def hello(name) do
    IO.puts("Hello #{name}")
  end

  def hi(name) do
    IO.puts("Hi #{name}")
  end
end

User.hello("john")
User.hello("david")
