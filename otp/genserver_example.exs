defmodule UsersStorage do
  use GenServer

  def start_link(users_map \\ %{}) do
    GenServer.start_link(__MODULE__, users_map)
  end

  def init(users_map) do
    {:ok, users_map}
  end

##########################

  def add(pid, map) do
    GenServer.cast(pid, {:add, map})
  end

  def handle_cast({:add, new_map}, users_map) do
    updated_map = Map.merge(users_map, new_map)
    {:noreply, updated_map}
  end

##########################

  def remove(pid, key) do
    GenServer.cast(pid, {:remove, key})
  end

  def handle_cast({:remove, key}, users_map) do
    updated_map = Map.delete(users_map, key)
    {:noreply, updated_map}
  end

##########################

  def show(pid) do
    GenServer.call(pid, :show)
  end

  def handle_call(:show, _from, users_map) do
    {:reply, users_map, users_map}
  end
end

{:ok, pid} = UsersStorage.start_link()

UsersStorage.add(pid, %{"tom" => "tom@gmail.com"})
UsersStorage.add(pid, %{"john" => "john@gmail.com"})

UsersStorage.show(pid) |> IO.inspect

UsersStorage.remove(pid, "john")

UsersStorage.show(pid) |> IO.inspect
