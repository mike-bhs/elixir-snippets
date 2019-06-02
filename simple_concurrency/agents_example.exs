defmodule Transaction do
  defstruct currency: nil, amount: nil
end

defmodule TransactionAgent do
  def build_transaction do
    transaction = %Transaction{amount: 1000, currency: "GBP"}
    {:ok, agent} = Agent.start_link(fn -> transaction end)

    agent
  end

  def update_transaction(agent, amount, currency) do
    Agent.update(agent, fn (transaction) -> %{transaction | currency: currency, amount: amount} end)
  end

  def get_transaction(agent) do
    Agent.get(agent, &(&1))
  end
end

id = TransactionAgent.build_transaction

TransactionAgent.get_transaction(id) |> IO.inspect

TransactionAgent.update_transaction(id, 5000, "USD")

TransactionAgent.get_transaction(id) |> IO.inspect
