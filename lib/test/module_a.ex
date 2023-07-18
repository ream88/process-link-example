defmodule Test.ModuleA do
  use GenServer

  def start_link(opts \\ []) do
    name = Keyword.get(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, nil, name: name)
  end

  def init(_) do
    IO.puts("#{__MODULE__} starting")

    Test.ModuleB
    |> Process.whereis()
    |> Process.link()

    {:ok, nil}
  end
end
