defmodule LearningEc21.TimeZones do
  @time_zones [
    %{flag_url_prefix: "pl", location: "Warsaw", time_zone_name: "Europe/Warsaw"},
    %{flag_url_prefix: "gb", location: "London", time_zone_name: "Europe/London"},
    %{flag_url_prefix: "be", location: "Brussels", time_zone_name: "Europe/Brussels"},
    %{flag_url_prefix: "de", location: "Berlin", time_zone_name: "Europe/Berlin"},
    %{flag_url_prefix: "fr", location: "Paris", time_zone_name: "Europe/Paris"},
    %{flag_url_prefix: "ie", location: "Dublin", time_zone_name: "Europe/Dublin"},
    %{flag_url_prefix: "nl", location: "Amsterdam", time_zone_name: "Europe/Amsterdam"},
    %{flag_url_prefix: "nz", location: "Auckland", time_zone_name: "Pacific/Auckland"},
    %{flag_url_prefix: "jp", location: "Tokyo", time_zone_name: "Asia/Tokyo"},
    %{flag_url_prefix: "eg", location: "Cairo", time_zone_name: "Africa/Cairo"},
    %{flag_url_prefix: "mx", location: "Mexico City", time_zone_name: "America/Mexico_City"},
    %{flag_url_prefix: "ca", location: "Toronto", time_zone_name: "America/Toronto"},
    %{flag_url_prefix: "us", location: "New York", time_zone_name: "America/New_York"},
    %{flag_url_prefix: "il", location: "Jerusalem", time_zone_name: "Asia/Jerusalem"}
  ]

  def get_location_times(), do: get_location_times(nil)
  def get_location_times(search) do
    @time_zones
    |> filter_time_zones(search)
    |> Enum.map(fn time_zone ->
        Map.put(
          time_zone,
          :date,
          get_date_time_for_timezone(time_zone.time_zone_name)
        )
      end)
    |> Enum.sort_by(&(Map.get(&1, :location)))
  end

  defp filter_time_zones(time_zones, search) when is_nil(search), do: time_zones
  defp filter_time_zones(time_zones, search) when is_binary(search) do
    search =
      search
      |> String.trim()
      |> String.downcase()

    case search do
      "" -> time_zones
      search ->
        Enum.filter(time_zones, fn timezone ->
          String.contains?(String.downcase(timezone.location), search)
        end)
    end
  end
  defp filter_time_zones(time_zones, _search), do: time_zones

  defp get_date_time_for_timezone(timezone) do
    {:ok, now} = DateTime.now(timezone)

    {:ok, formatted_date} = Calendar.Strftime.strftime(now, "%d/%m/%y %H:%M:%S")

    formatted_date
  end
end
