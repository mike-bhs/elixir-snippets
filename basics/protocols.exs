defprotocol Printable do
  def print(data)
end

defmodule User do
  defstruct [:name, :age]
end

defimpl Printable, for: User do
  def print(data), do: IO.inspect(data)
end
