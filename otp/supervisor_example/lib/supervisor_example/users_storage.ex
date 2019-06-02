defmodule SupervisorExample.UsersStorage do
  use GenServer

  def start_link(users_map \\ %{}) do
    IO.puts("received start link")
    GenServer.start_link(__MODULE__, users_map, name: __MODULE__)
  end

  def init(users_map) do
    {:ok, users_map}
  end

##########################

  def add(map) do
    GenServer.cast(__MODULE__, {:add, map})
  end

  def handle_cast({:add, new_map}, users_map) do
    updated_map = Map.merge(users_map, new_map)
    {:noreply, updated_map}
  end

##########################

  def remove(key) do
    GenServer.cast(__MODULE__, {:remove, key})
  end

  def handle_cast({:remove, key}, users_map) do
    updated_map = Map.delete(users_map, key)
    {:noreply, updated_map}
  end

##########################

  def fetch, do: GenServer.call(__MODULE__, :show)

  def handle_call(:show, _from, users_map) do
    {:reply, users_map, users_map}
  end
end
