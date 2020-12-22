defmodule LearningEc21Web.LiveView.Clocks do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <%= for country_date_time <- @country_date_times do %>
      <div>
        Name: <%= country_date_time.location %>
        Time:
        <%= country_date_time.date.day %>:<%= country_date_time.date.month %>:<%= country_date_time.date.year %>
        <%= country_date_time.date.hour %>:<%= country_date_time.date.minute %>:<%= country_date_time.date.second %>
      </div>
    <% end %>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: Process.send_after(self(), :update, 500)

    {:ok, assign(socket, :country_date_times, get_country_date_times())}
  end

  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 500)

    {:noreply, assign(socket, :country_date_times, get_country_date_times())}
  end

  defp get_country_date_times() do
    [
      %{
        date: get_date_time_for_timezone("Europe/Warsaw"),
        location: "Warsaw"
      },
      %{
        date: get_date_time_for_timezone("Europe/London"),
        location: "London"
      }
    ]
  end

  defp get_date_time_for_timezone(timezone) do
    {:ok, now} = DateTime.now(timezone)

    now
  end
end
