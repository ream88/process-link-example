defmodule Test.ModuleB do
  use GenServer

  def start_link(opts \\ []) do
    name = Keyword.get(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, nil, name: name)
  end

  def init(_) do
    IO.puts("#{__MODULE__} starting")

    Process.send_after(self(), :crash, 5000)

    {:ok, nil}
  end

  def handle_info(:crash, _state) do
    raise "boom"
  end
end
