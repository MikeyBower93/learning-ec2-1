defmodule LearningEc21Web.LiveView.Clocks do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias LearningEc21.TimeZones

  @update_period_in_milliseconds 200

  def render(assigns) do
    ~L"""
    <form phx-change="search" class="location-search">
      <%= text_input :location_search,
        :query,
        autofocus: true,
        placeholder: "Search a location...",
        "phx-debounce": "300",
        value: @location_search %>
    </form>
    <div class="timezone-container">
      <%= for location_time <- @location_times do %>
        <div class="timezone-card">
          <img src="<%= location_time.flag_url %>"
               class="country-flag">
          <h3 class="country-name"><b><%= location_time.country %></b></h3>
          <h3><%= location_time.location %></h3>
          <span>
            <%= location_time.date %>
          </p>
        </div>
      <% end %>
    </div>
    """
  end

  def mount(params, _session, socket) do
    if connected?(socket), do: Process.send_after(self(), :update, @update_period_in_milliseconds)

    location_search = get_search_from_params(params)

    location_times =
      LearningEc21.CapitalTimeZones.fetch_time_zones()
      |> filter_time_zones(location_search)

    socket =
      socket
      |> assign(:location_times, location_times)
      |> assign(:location_search, location_search)

    {:ok, socket}
  end

  def handle_info(:update, socket) do
    Process.send_after(self(), :update, @update_period_in_milliseconds)

    location_search = get_search_from_assigns(socket.assigns)

    location_times =
      LearningEc21.CapitalTimeZones.fetch_time_zones()
      |> filter_time_zones(location_search)

    {:noreply, assign(socket, :location_times, location_times)}
  end

  def handle_params(
    %{"location_search" => location_search},
    _uri,
    socket
  ) when is_binary(location_search)
  do
    {:noreply, assign(socket, :location_search, location_search)}
  end
  def handle_params(_param, _url, socket), do: {:noreply, socket}

  def handle_event("search", %{"location_search" => %{"query" => query}}, socket) when is_binary(query) do
    {:noreply, push_patch(socket, to: "/?location_search=#{query}")}
  end
  def handle_event(_, _, socket), do: {:noreply, socket}

  defp get_search_from_params(%{"location_search" => location_search}), do: location_search
  defp get_search_from_params(_), do: ""

  defp get_search_from_assigns(%{location_search: location_search}), do: location_search
  defp get_search_from_assigns(_), do: ""

  defp filter_time_zones(time_zones, location_search) do
    search_field =
      location_search
      |> String.downcase()
      |> String.trim()

    Enum.filter(time_zones,
      fn time_zone ->
        String.contains?(String.downcase(time_zone.location), search_field) or
        String.contains?(String.downcase(time_zone.country), search_field)
      end)
  end
end
