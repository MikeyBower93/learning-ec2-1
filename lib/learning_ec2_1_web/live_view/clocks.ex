defmodule LearningEc21Web.LiveView.Clocks do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div style="display: flex; flex-direction: row; justify-content: space-evenly; flex-wrap: wrap;">
      <%= for country_date_time <- @country_date_times do %>
        <div class="card" style="margin: 5rem 5rem 5rem 5rem;">
          <div class="card-body">
            <img src="https://www.countryflags.io/<%= country_date_time.flag_url_prefix %>/flat/64.png">
            <h5 class="card-title"><%= country_date_time.location %></h5>
            <p class="card-text">
              <%= country_date_time.date %>
            </p>
          </div>
        </div>
      <% end %>
    </div>
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

  # Country flags: https://www.countryflags.io/
  defp get_country_date_times() do
    [
      %{
        date: get_date_time_for_timezone("Europe/Warsaw"),
        flag_url_prefix: "pl",
        location: "Warsaw"
      },
      %{
        date: get_date_time_for_timezone("Europe/London"),
        flag_url_prefix: "gb",
        location: "London"
      },
      %{
        date: get_date_time_for_timezone("Europe/Brussels"),
        flag_url_prefix: "be",
        location: "Brussels"
      },
      %{
        date: get_date_time_for_timezone("Europe/Berlin"),
        flag_url_prefix: "de",
        location: "Berlin"
      },
      %{
        date: get_date_time_for_timezone("Europe/Paris"),
        flag_url_prefix: "fr",
        location: "Paris"
      },
      %{
        date: get_date_time_for_timezone("Europe/Dublin"),
        flag_url_prefix: "ie",
        location: "Dublin"
      }
    ]
  end

  defp get_date_time_for_timezone(timezone) do
    {:ok, now} = DateTime.now(timezone)

    {:ok, formatted_date} = Calendar.Strftime.strftime(now, "%y/%m/%d %H:%M:%S")

    formatted_date
  end
end
