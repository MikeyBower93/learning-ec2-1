defmodule LearningEc21.CapitalTimeZones do
  use GenServer

  @init_time_zones [
    %{
      country: "Afghanistan",
      flag_url: "https://restcountries.eu/data/afg.svg",
      location: "Kabul",
      time_zone: "Asia/Kabul"
    },
    %{
      country: "Åland Islands",
      flag_url: "https://restcountries.eu/data/ala.svg",
      location: "Mariehamn",
      time_zone: "Europe/Mariehamn"
    },
    %{
      country: "Albania",
      flag_url: "https://restcountries.eu/data/alb.svg",
      location: "Tirana",
      time_zone: "Europe/Tirane"
    },
    %{
      country: "Algeria",
      flag_url: "https://restcountries.eu/data/dza.svg",
      location: "Algiers",
      time_zone: "Africa/Algiers"
    },
    %{
      country: "Andorra",
      flag_url: "https://restcountries.eu/data/and.svg",
      location: "Andorra la Vella",
      time_zone: "Europe/Andorra"
    },
    %{
      country: "Angola",
      flag_url: "https://restcountries.eu/data/ago.svg",
      location: "Luanda",
      time_zone: "Africa/Luanda"
    },
    %{
      country: "Anguilla",
      flag_url: "https://restcountries.eu/data/aia.svg",
      location: "The Valley",
      time_zone: "America/Anguilla"
    },
    %{
      country: "Antigua and Barbuda",
      flag_url: "https://restcountries.eu/data/atg.svg",
      location: "Saint John's",
      time_zone: "America/Antigua"
    },
    %{
      country: "Argentina",
      flag_url: "https://restcountries.eu/data/arg.svg",
      location: "Buenos Aires",
      time_zone: "America/Argentina/Cordoba"
    },
    %{
      country: "Armenia",
      flag_url: "https://restcountries.eu/data/arm.svg",
      location: "Yerevan",
      time_zone: "Asia/Yerevan"
    },
    %{
      country: "Aruba",
      flag_url: "https://restcountries.eu/data/abw.svg",
      location: "Oranjestad",
      time_zone: "America/Aruba"
    },
    %{
      country: "Australia",
      flag_url: "https://restcountries.eu/data/aus.svg",
      location: "Canberra",
      time_zone: "Australia/Adelaide"
    },
    %{
      country: "Austria",
      flag_url: "https://restcountries.eu/data/aut.svg",
      location: "Vienna",
      time_zone: "Europe/Vienna"
    },
    %{
      country: "Azerbaijan",
      flag_url: "https://restcountries.eu/data/aze.svg",
      location: "Baku",
      time_zone: "Asia/Baku"
    },
    %{
      country: "Bahamas",
      flag_url: "https://restcountries.eu/data/bhs.svg",
      location: "Nassau",
      time_zone: "America/Nassau"
    },
    %{
      country: "Bahrain",
      flag_url: "https://restcountries.eu/data/bhr.svg",
      location: "Manama",
      time_zone: "Asia/Bahrain"
    },
    %{
      country: "Bangladesh",
      flag_url: "https://restcountries.eu/data/bgd.svg",
      location: "Dhaka",
      time_zone: "Asia/Dhaka"
    },
    %{
      country: "Barbados",
      flag_url: "https://restcountries.eu/data/brb.svg",
      location: "Bridgetown",
      time_zone: "America/Barbados"
    },
    %{
      country: "Belarus",
      flag_url: "https://restcountries.eu/data/blr.svg",
      location: "Minsk",
      time_zone: "Europe/Minsk"
    },
    %{
      country: "Belgium",
      flag_url: "https://restcountries.eu/data/bel.svg",
      location: "Brussels",
      time_zone: "Europe/Brussels"
    },
    %{
      country: "Belize",
      flag_url: "https://restcountries.eu/data/blz.svg",
      location: "Belmopan",
      time_zone: "America/Belize"
    },
    %{
      country: "Benin",
      flag_url: "https://restcountries.eu/data/ben.svg",
      location: "Porto-Novo",
      time_zone: "Africa/Porto-Novo"
    },
    %{
      country: "Bermuda",
      flag_url: "https://restcountries.eu/data/bmu.svg",
      location: "Hamilton",
      time_zone: "Atlantic/Bermuda"
    },
    %{
      country: "Bhutan",
      flag_url: "https://restcountries.eu/data/btn.svg",
      location: "Thimphu",
      time_zone: "Asia/Thimphu"
    },
    %{
      country: "Bolivia (Plurinational State of)",
      flag_url: "https://restcountries.eu/data/bol.svg",
      location: "Sucre",
      time_zone: "America/La_Paz"
    },
    %{
      country: "Bonaire, Sint Eustatius and Saba",
      flag_url: "https://restcountries.eu/data/bes.svg",
      location: "Kralendijk",
      time_zone: "America/Kralendijk"
    },
    %{
      country: "Bosnia and Herzegovina",
      flag_url: "https://restcountries.eu/data/bih.svg",
      location: "Sarajevo",
      time_zone: "Europe/Sarajevo"
    },
    %{
      country: "Botswana",
      flag_url: "https://restcountries.eu/data/bwa.svg",
      location: "Gaborone",
      time_zone: "Africa/Gaborone"
    },
    %{
      country: "Brazil",
      flag_url: "https://restcountries.eu/data/bra.svg",
      location: "Brasília",
      time_zone: "America/Cuiaba"
    },
    %{
      country: "British Indian Ocean Territory",
      flag_url: "https://restcountries.eu/data/iot.svg",
      location: "Diego Garcia",
      time_zone: "Indian/Chagos"
    },
    %{
      country: "Virgin Islands (British)",
      flag_url: "https://restcountries.eu/data/vgb.svg",
      location: "Road Town",
      time_zone: "America/Tortola"
    },
    %{
      country: "Virgin Islands (U.S.)",
      flag_url: "https://restcountries.eu/data/vir.svg",
      location: "Charlotte Amalie",
      time_zone: "America/St_Thomas"
    },
    %{
      country: "Brunei Darussalam",
      flag_url: "https://restcountries.eu/data/brn.svg",
      location: "Bandar Seri Begawan",
      time_zone: "Asia/Brunei"
    },
    %{
      country: "Bulgaria",
      flag_url: "https://restcountries.eu/data/bgr.svg",
      location: "Sofia",
      time_zone: "Europe/Sofia"
    },
    %{
      country: "Burkina Faso",
      flag_url: "https://restcountries.eu/data/bfa.svg",
      location: "Ouagadougou",
      time_zone: "Africa/Ouagadougou"
    },
    %{
      country: "Burundi",
      flag_url: "https://restcountries.eu/data/bdi.svg",
      location: "Bujumbura",
      time_zone: "Africa/Bujumbura"
    },
    %{
      country: "Cambodia",
      flag_url: "https://restcountries.eu/data/khm.svg",
      location: "Phnom Penh",
      time_zone: "Asia/Phnom_Penh"
    },
    %{
      country: "Cameroon",
      flag_url: "https://restcountries.eu/data/cmr.svg",
      location: "Yaoundé",
      time_zone: "Africa/Douala"
    },
    %{
      country: "Canada",
      flag_url: "https://restcountries.eu/data/can.svg",
      location: "Ottawa",
      time_zone: "America/Rankin_Inlet"
    },
    %{
      country: "Cabo Verde",
      flag_url: "https://restcountries.eu/data/cpv.svg",
      location: "Praia",
      time_zone: "Atlantic/Cape_Verde"
    },
    %{
      country: "Central African Republic",
      flag_url: "https://restcountries.eu/data/caf.svg",
      location: "Bangui",
      time_zone: "Africa/Bangui"
    },
    %{
      country: "Chad",
      flag_url: "https://restcountries.eu/data/tcd.svg",
      location: "N'Djamena",
      time_zone: "Africa/Ndjamena"
    },
    %{
      country: "Chile",
      flag_url: "https://restcountries.eu/data/chl.svg",
      location: "Santiago",
      time_zone: "America/Santiago"
    },
    %{
      country: "China",
      flag_url: "https://restcountries.eu/data/chn.svg",
      location: "Beijing",
      time_zone: "Asia/Shanghai"
    },
    %{
      country: "Christmas Island",
      flag_url: "https://restcountries.eu/data/cxr.svg",
      location: "Flying Fish Cove",
      time_zone: "Indian/Christmas"
    },
    %{
      country: "Colombia",
      flag_url: "https://restcountries.eu/data/col.svg",
      location: "Bogotá",
      time_zone: "America/Bogota"
    },
    %{
      country: "Comoros",
      flag_url: "https://restcountries.eu/data/com.svg",
      location: "Moroni",
      time_zone: "Indian/Comoro"
    },
    %{
      country: "Congo",
      flag_url: "https://restcountries.eu/data/cog.svg",
      location: "Brazzaville",
      time_zone: "Africa/Brazzaville"
    },
    %{
      country: "Congo (Democratic Republic of the)",
      flag_url: "https://restcountries.eu/data/cod.svg",
      location: "Kinshasa",
      time_zone: "Africa/Lubumbashi"
    },
    %{
      country: "Cook Islands",
      flag_url: "https://restcountries.eu/data/cok.svg",
      location: "Avarua",
      time_zone: "Pacific/Rarotonga"
    },
    %{
      country: "Costa Rica",
      flag_url: "https://restcountries.eu/data/cri.svg",
      location: "San José",
      time_zone: "America/Costa_Rica"
    },
    %{
      country: "Croatia",
      flag_url: "https://restcountries.eu/data/hrv.svg",
      location: "Zagreb",
      time_zone: "Europe/Zagreb"
    },
    %{
      country: "Cuba",
      flag_url: "https://restcountries.eu/data/cub.svg",
      location: "Havana",
      time_zone: "America/Havana"
    },
    %{
      country: "Curaçao",
      flag_url: "https://restcountries.eu/data/cuw.svg",
      location: "Willemstad",
      time_zone: "America/Curacao"
    },
    %{
      country: "Cyprus",
      flag_url: "https://restcountries.eu/data/cyp.svg",
      location: "Nicosia",
      time_zone: "Asia/Nicosia"
    },
    %{
      country: "Czech Republic",
      flag_url: "https://restcountries.eu/data/cze.svg",
      location: "Prague",
      time_zone: "Europe/Prague"
    },
    %{
      country: "Denmark",
      flag_url: "https://restcountries.eu/data/dnk.svg",
      location: "Copenhagen",
      time_zone: "Europe/Copenhagen"
    },
    %{
      country: "Djibouti",
      flag_url: "https://restcountries.eu/data/dji.svg",
      location: "Djibouti",
      time_zone: "Africa/Djibouti"
    },
    %{
      country: "Dominica",
      flag_url: "https://restcountries.eu/data/dma.svg",
      location: "Roseau",
      time_zone: "America/Dominica"
    },
    %{
      country: "Dominican Republic",
      flag_url: "https://restcountries.eu/data/dom.svg",
      location: "Santo Domingo",
      time_zone: "America/Santo_Domingo"
    },
    %{
      country: "Ecuador",
      flag_url: "https://restcountries.eu/data/ecu.svg",
      location: "Quito",
      time_zone: "America/Guayaquil"
    },
    %{
      country: "Egypt",
      flag_url: "https://restcountries.eu/data/egy.svg",
      location: "Cairo",
      time_zone: "Africa/Cairo"
    },
    %{
      country: "El Salvador",
      flag_url: "https://restcountries.eu/data/slv.svg",
      location: "San Salvador",
      time_zone: "America/El_Salvador"
    },
    %{
      country: "Equatorial Guinea",
      flag_url: "https://restcountries.eu/data/gnq.svg",
      location: "Malabo",
      time_zone: "Africa/Malabo"
    },
    %{
      country: "Eritrea",
      flag_url: "https://restcountries.eu/data/eri.svg",
      location: "Asmara",
      time_zone: "Africa/Asmara"
    },
    %{
      country: "Estonia",
      flag_url: "https://restcountries.eu/data/est.svg",
      location: "Tallinn",
      time_zone: "Europe/Tallinn"
    },
    %{
      country: "Ethiopia",
      flag_url: "https://restcountries.eu/data/eth.svg",
      location: "Addis Ababa",
      time_zone: "Africa/Addis_Ababa"
    },
    %{
      country: "Falkland Islands (Malvinas)",
      flag_url: "https://restcountries.eu/data/flk.svg",
      location: "Stanley",
      time_zone: "Atlantic/Stanley"
    },
    %{
      country: "Faroe Islands",
      flag_url: "https://restcountries.eu/data/fro.svg",
      location: "Tórshavn",
      time_zone: "Atlantic/Faroe"
    },
    %{
      country: "Finland",
      flag_url: "https://restcountries.eu/data/fin.svg",
      location: "Helsinki",
      time_zone: "Europe/Helsinki"
    },
    %{
      country: "France",
      flag_url: "https://restcountries.eu/data/fra.svg",
      location: "Paris",
      time_zone: "Europe/Paris"
    },
    %{
      country: "French Guiana",
      flag_url: "https://restcountries.eu/data/guf.svg",
      location: "Cayenne",
      time_zone: "America/Cayenne"
    },
    %{
      country: "French Southern Territories",
      flag_url: "https://restcountries.eu/data/atf.svg",
      location: "Port-aux-Français",
      time_zone: "Indian/Kerguelen"
    },
    %{
      country: "Gabon",
      flag_url: "https://restcountries.eu/data/gab.svg",
      location: "Libreville",
      time_zone: "Africa/Libreville"
    },
    %{
      country: "Gambia",
      flag_url: "https://restcountries.eu/data/gmb.svg",
      location: "Banjul",
      time_zone: "Africa/Banjul"
    },
    %{
      country: "Georgia",
      flag_url: "https://restcountries.eu/data/geo.svg",
      location: "Tbilisi",
      time_zone: "Asia/Tbilisi"
    },
    %{
      country: "Germany",
      flag_url: "https://restcountries.eu/data/deu.svg",
      location: "Berlin",
      time_zone: "Europe/Berlin"
    },
    %{
      country: "Ghana",
      flag_url: "https://restcountries.eu/data/gha.svg",
      location: "Accra",
      time_zone: "Africa/Accra"
    },
    %{
      country: "Gibraltar",
      flag_url: "https://restcountries.eu/data/gib.svg",
      location: "Gibraltar",
      time_zone: "Europe/Gibraltar"
    },
    %{
      country: "Greece",
      flag_url: "https://restcountries.eu/data/grc.svg",
      location: "Athens",
      time_zone: "Europe/Athens"
    },
    %{
      country: "Greenland",
      flag_url: "https://restcountries.eu/data/grl.svg",
      location: "Nuuk",
      time_zone: "America/Nuuk"
    },
    %{
      country: "Grenada",
      flag_url: "https://restcountries.eu/data/grd.svg",
      location: "St. George's",
      time_zone: "America/Grenada"
    },
    %{
      country: "Guadeloupe",
      flag_url: "https://restcountries.eu/data/glp.svg",
      location: "Basse-Terre",
      time_zone: "America/Guadeloupe"
    },
    %{
      country: "Guam",
      flag_url: "https://restcountries.eu/data/gum.svg",
      location: "Hagåtña",
      time_zone: "Pacific/Guam"
    },
    %{
      country: "Guatemala",
      flag_url: "https://restcountries.eu/data/gtm.svg",
      location: "Guatemala City",
      time_zone: "America/Guatemala"
    },
    %{
      country: "Guernsey",
      flag_url: "https://restcountries.eu/data/ggy.svg",
      location: "St. Peter Port",
      time_zone: "Europe/Guernsey"
    },
    %{
      country: "Guinea",
      flag_url: "https://restcountries.eu/data/gin.svg",
      location: "Conakry",
      time_zone: "Africa/Conakry"
    },
    %{
      country: "Guinea-Bissau",
      flag_url: "https://restcountries.eu/data/gnb.svg",
      location: "Bissau",
      time_zone: "Africa/Bissau"
    },
    %{
      country: "Guyana",
      flag_url: "https://restcountries.eu/data/guy.svg",
      location: "Georgetown",
      time_zone: "America/Guyana"
    },
    %{
      country: "Haiti",
      flag_url: "https://restcountries.eu/data/hti.svg",
      location: "Port-au-Prince",
      time_zone: "America/Port-au-Prince"
    },
    %{
      country: "Holy See",
      flag_url: "https://restcountries.eu/data/vat.svg",
      location: "Rome",
      time_zone: "Europe/Rome"
    },
    %{
      country: "Honduras",
      flag_url: "https://restcountries.eu/data/hnd.svg",
      location: "Tegucigalpa",
      time_zone: "America/Tegucigalpa"
    },
    %{
      country: "Hong Kong",
      flag_url: "https://restcountries.eu/data/hkg.svg",
      location: "City of Victoria",
      time_zone: "Asia/Hong_Kong"
    },
    %{
      country: "Hungary",
      flag_url: "https://restcountries.eu/data/hun.svg",
      location: "Budapest",
      time_zone: "Europe/Budapest"
    },
    %{
      country: "Iceland",
      flag_url: "https://restcountries.eu/data/isl.svg",
      location: "Reykjavík",
      time_zone: "Atlantic/Reykjavik"
    },
    %{
      country: "India",
      flag_url: "https://restcountries.eu/data/ind.svg",
      location: "New Delhi",
      time_zone: "Asia/Kolkata"
    },
    %{
      country: "Indonesia",
      flag_url: "https://restcountries.eu/data/idn.svg",
      location: "Jakarta",
      time_zone: "Asia/Makassar"
    },
    %{
      country: "Côte d'Ivoire",
      flag_url: "https://restcountries.eu/data/civ.svg",
      location: "Yamoussoukro",
      time_zone: "Africa/Abidjan"
    },
    %{
      country: "Iran (Islamic Republic of)",
      flag_url: "https://restcountries.eu/data/irn.svg",
      location: "Tehran",
      time_zone: "Asia/Tehran"
    },
    %{
      country: "Iraq",
      flag_url: "https://restcountries.eu/data/irq.svg",
      location: "Baghdad",
      time_zone: "Asia/Baghdad"
    },
    %{
      country: "Ireland",
      flag_url: "https://restcountries.eu/data/irl.svg",
      location: "Dublin",
      time_zone: "Europe/Dublin"
    },
    %{
      country: "Isle of Man",
      flag_url: "https://restcountries.eu/data/imn.svg",
      location: "Douglas",
      time_zone: "Europe/Isle_of_Man"
    },
    %{
      country: "Israel",
      flag_url: "https://restcountries.eu/data/isr.svg",
      location: "Jerusalem",
      time_zone: "Asia/Jerusalem"
    },
    %{
      country: "Italy",
      flag_url: "https://restcountries.eu/data/ita.svg",
      location: "Rome",
      time_zone: "Europe/Rome"
    },
    %{
      country: "Jamaica",
      flag_url: "https://restcountries.eu/data/jam.svg",
      location: "Kingston",
      time_zone: "America/Jamaica"
    },
    %{
      country: "Japan",
      flag_url: "https://restcountries.eu/data/jpn.svg",
      location: "Tokyo",
      time_zone: "Asia/Tokyo"
    },
    %{
      country: "Jersey",
      flag_url: "https://restcountries.eu/data/jey.svg",
      location: "Saint Helier",
      time_zone: "Europe/Jersey"
    },
    %{
      country: "Jordan",
      flag_url: "https://restcountries.eu/data/jor.svg",
      location: "Amman",
      time_zone: "Asia/Amman"
    },
    %{
      country: "Kazakhstan",
      flag_url: "https://restcountries.eu/data/kaz.svg",
      location: "Astana",
      time_zone: "Asia/Almaty"
    },
    %{
      country: "Kenya",
      flag_url: "https://restcountries.eu/data/ken.svg",
      location: "Nairobi",
      time_zone: "Africa/Nairobi"
    },
    %{
      country: "Kiribati",
      flag_url: "https://restcountries.eu/data/kir.svg",
      location: "South Tarawa",
      time_zone: "Pacific/Tarawa"
    },
    %{
      country: "Kuwait",
      flag_url: "https://restcountries.eu/data/kwt.svg",
      location: "Kuwait City",
      time_zone: "Asia/Baghdad"
    },
    %{
      country: "Kyrgyzstan",
      flag_url: "https://restcountries.eu/data/kgz.svg",
      location: "Bishkek",
      time_zone: "Asia/Bishkek"
    },
    %{
      country: "Lao People's Democratic Republic",
      flag_url: "https://restcountries.eu/data/lao.svg",
      location: "Vientiane",
      time_zone: "Asia/Vientiane"
    },
    %{
      country: "Latvia",
      flag_url: "https://restcountries.eu/data/lva.svg",
      location: "Riga",
      time_zone: "Europe/Riga"
    },
    %{
      country: "Lebanon",
      flag_url: "https://restcountries.eu/data/lbn.svg",
      location: "Beirut",
      time_zone: "Asia/Beirut"
    },
    %{
      country: "Lesotho",
      flag_url: "https://restcountries.eu/data/lso.svg",
      location: "Maseru",
      time_zone: "Africa/Maseru"
    },
    %{
      country: "Liberia",
      flag_url: "https://restcountries.eu/data/lbr.svg",
      location: "Monrovia",
      time_zone: "Africa/Monrovia"
    },
    %{
      country: "Libya",
      flag_url: "https://restcountries.eu/data/lby.svg",
      location: "Tripoli",
      time_zone: "Africa/Tripoli"
    },
    %{
      country: "Liechtenstein",
      flag_url: "https://restcountries.eu/data/lie.svg",
      location: "Vaduz",
      time_zone: "Europe/Vaduz"
    },
    %{
      country: "Lithuania",
      flag_url: "https://restcountries.eu/data/ltu.svg",
      location: "Vilnius",
      time_zone: "Europe/Vilnius"
    },
    %{
      country: "Luxembourg",
      flag_url: "https://restcountries.eu/data/lux.svg",
      location: "Luxembourg",
      time_zone: "Europe/Luxembourg"
    },
    %{
      country: "Macedonia (the former Yugoslav Republic of)",
      flag_url: "https://restcountries.eu/data/mkd.svg",
      location: "Skopje",
      time_zone: "Europe/Skopje"
    },
    %{
      country: "Madagascar",
      flag_url: "https://restcountries.eu/data/mdg.svg",
      location: "Antananarivo",
      time_zone: "Indian/Antananarivo"
    },
    %{
      country: "Malawi",
      flag_url: "https://restcountries.eu/data/mwi.svg",
      location: "Lilongwe",
      time_zone: "Africa/Blantyre"
    },
    %{
      country: "Malaysia",
      flag_url: "https://restcountries.eu/data/mys.svg",
      location: "Kuala Lumpur",
      time_zone: "Asia/Kuching"
    },
    %{
      country: "Maldives",
      flag_url: "https://restcountries.eu/data/mdv.svg",
      location: "Malé",
      time_zone: "Indian/Maldives"
    },
    %{
      country: "Mali",
      flag_url: "https://restcountries.eu/data/mli.svg",
      location: "Bamako",
      time_zone: "Africa/Bamako"
    },
    %{
      country: "Malta",
      flag_url: "https://restcountries.eu/data/mlt.svg",
      location: "Valletta",
      time_zone: "Europe/Malta"
    },
    %{
      country: "Martinique",
      flag_url: "https://restcountries.eu/data/mtq.svg",
      location: "Fort-de-France",
      time_zone: "America/Martinique"
    },
    %{
      country: "Mauritania",
      flag_url: "https://restcountries.eu/data/mrt.svg",
      location: "Nouakchott",
      time_zone: "Africa/Nouakchott"
    },
    %{
      country: "Mauritius",
      flag_url: "https://restcountries.eu/data/mus.svg",
      location: "Port Louis",
      time_zone: "Indian/Mauritius"
    },
    %{
      country: "Mayotte",
      flag_url: "https://restcountries.eu/data/myt.svg",
      location: "Mamoudzou",
      time_zone: "Indian/Mayotte"
    },
    %{
      country: "Mexico",
      flag_url: "https://restcountries.eu/data/mex.svg",
      location: "Mexico City",
      time_zone: "America/Mexico_City"
    },
    %{
      country: "Micronesia (Federated States of)",
      flag_url: "https://restcountries.eu/data/fsm.svg",
      location: "Palikir",
      time_zone: "Pacific/Pohnpei"
    },
    %{
      country: "Moldova (Republic of)",
      flag_url: "https://restcountries.eu/data/mda.svg",
      location: "Chișinău",
      time_zone: "Europe/Chisinau"
    },
    %{
      country: "Monaco",
      flag_url: "https://restcountries.eu/data/mco.svg",
      location: "Monaco",
      time_zone: "Europe/Paris"
    },
    %{
      country: "Mongolia",
      flag_url: "https://restcountries.eu/data/mng.svg",
      location: "Ulan Bator",
      time_zone: "Asia/Ulaanbaatar"
    },
    %{
      country: "Montenegro",
      flag_url: "https://restcountries.eu/data/mne.svg",
      location: "Podgorica",
      time_zone: "Europe/Podgorica"
    },
    %{
      country: "Montserrat",
      flag_url: "https://restcountries.eu/data/msr.svg",
      location: "Plymouth",
      time_zone: "America/Montserrat"
    },
    %{
      country: "Morocco",
      flag_url: "https://restcountries.eu/data/mar.svg",
      location: "Rabat",
      time_zone: "Africa/Casablanca"
    },
    %{
      country: "Mozambique",
      flag_url: "https://restcountries.eu/data/moz.svg",
      location: "Maputo",
      time_zone: "Africa/Maputo"
    },
    %{
      country: "Myanmar",
      flag_url: "https://restcountries.eu/data/mmr.svg",
      location: "Naypyidaw",
      time_zone: "Asia/Yangon"
    },
    %{
      country: "Namibia",
      flag_url: "https://restcountries.eu/data/nam.svg",
      location: "Windhoek",
      time_zone: "Africa/Windhoek"
    },
    %{
      country: "Nauru",
      flag_url: "https://restcountries.eu/data/nru.svg",
      location: "Yaren",
      time_zone: "Pacific/Nauru"
    },
    %{
      country: "Nepal",
      flag_url: "https://restcountries.eu/data/npl.svg",
      location: "Kathmandu",
      time_zone: "Asia/Kathmandu"
    },
    %{
      country: "Netherlands",
      flag_url: "https://restcountries.eu/data/nld.svg",
      location: "Amsterdam",
      time_zone: "Europe/Amsterdam"
    },
    %{
      country: "New Caledonia",
      flag_url: "https://restcountries.eu/data/ncl.svg",
      location: "Nouméa",
      time_zone: "Pacific/Noumea"
    },
    %{
      country: "New Zealand",
      flag_url: "https://restcountries.eu/data/nzl.svg",
      location: "Wellington",
      time_zone: "Pacific/Auckland"
    },
    %{
      country: "Nicaragua",
      flag_url: "https://restcountries.eu/data/nic.svg",
      location: "Managua",
      time_zone: "America/Managua"
    },
    %{
      country: "Niger",
      flag_url: "https://restcountries.eu/data/ner.svg",
      location: "Niamey",
      time_zone: "Africa/Niamey"
    },
    %{
      country: "Nigeria",
      flag_url: "https://restcountries.eu/data/nga.svg",
      location: "Abuja",
      time_zone: "Africa/Lagos"
    },
    %{
      country: "Niue",
      flag_url: "https://restcountries.eu/data/niu.svg",
      location: "Alofi",
      time_zone: "Pacific/Niue"
    },
    %{
      country: "Norfolk Island",
      flag_url: "https://restcountries.eu/data/nfk.svg",
      location: "Kingston",
      time_zone: "America/Jamaica"
    },
    %{
      country: "Korea (Democratic People's Republic of)",
      flag_url: "https://restcountries.eu/data/prk.svg",
      location: "Pyongyang",
      time_zone: "Asia/Pyongyang"
    },
    %{
      country: "Northern Mariana Islands",
      flag_url: "https://restcountries.eu/data/mnp.svg",
      location: "Saipan",
      time_zone: "Pacific/Saipan"
    },
    %{
      country: "Norway",
      flag_url: "https://restcountries.eu/data/nor.svg",
      location: "Oslo",
      time_zone: "Europe/Oslo"
    },
    %{
      country: "Oman",
      flag_url: "https://restcountries.eu/data/omn.svg",
      location: "Muscat",
      time_zone: "Asia/Muscat"
    },
    %{
      country: "Pakistan",
      flag_url: "https://restcountries.eu/data/pak.svg",
      location: "Islamabad",
      time_zone: "Asia/Karachi"
    },
    %{
      country: "Palau",
      flag_url: "https://restcountries.eu/data/plw.svg",
      location: "Ngerulmud",
      time_zone: "Pacific/Palau"
    },
    %{
      country: "Palestine, State of",
      flag_url: "https://restcountries.eu/data/pse.svg",
      location: "Ramallah",
      time_zone: "Asia/Hebron"
    },
    %{
      country: "Panama",
      flag_url: "https://restcountries.eu/data/pan.svg",
      location: "Panama City",
      time_zone: "America/Panama"
    },
    %{
      country: "Papua New Guinea",
      flag_url: "https://restcountries.eu/data/png.svg",
      location: "Port Moresby",
      time_zone: "Pacific/Port_Moresby"
    },
    %{
      country: "Paraguay",
      flag_url: "https://restcountries.eu/data/pry.svg",
      location: "Asunción",
      time_zone: "America/Asuncion"
    },
    %{
      country: "Peru",
      flag_url: "https://restcountries.eu/data/per.svg",
      location: "Lima",
      time_zone: "America/Lima"
    },
    %{
      country: "Philippines",
      flag_url: "https://restcountries.eu/data/phl.svg",
      location: "Manila",
      time_zone: "Asia/Manila"
    },
    %{
      country: "Pitcairn",
      flag_url: "https://restcountries.eu/data/pcn.svg",
      location: "Adamstown",
      time_zone: "Pacific/Pitcairn"
    },
    %{
      country: "Poland",
      flag_url: "https://restcountries.eu/data/pol.svg",
      location: "Warsaw",
      time_zone: "Europe/Warsaw"
    },
    %{
      country: "Portugal",
      flag_url: "https://restcountries.eu/data/prt.svg",
      location: "Lisbon",
      time_zone: "Europe/Lisbon"
    },
    %{
      country: "Puerto Rico",
      flag_url: "https://restcountries.eu/data/pri.svg",
      location: "San Juan",
      time_zone: "America/Puerto_Rico"
    },
    %{
      country: "Qatar",
      flag_url: "https://restcountries.eu/data/qat.svg",
      location: "Doha",
      time_zone: "Asia/Qatar"
    },
    %{
      country: "Republic of Kosovo",
      flag_url: "https://restcountries.eu/data/kos.svg",
      location: "Pristina",
      time_zone: "Europe/Belgrade"
    },
    %{
      country: "Réunion",
      flag_url: "https://restcountries.eu/data/reu.svg",
      location: "Saint-Denis",
      time_zone: "Indian/Reunion"
    },
    %{
      country: "Romania",
      flag_url: "https://restcountries.eu/data/rou.svg",
      location: "Bucharest",
      time_zone: "Europe/Bucharest"
    },
    %{
      country: "Russian Federation",
      flag_url: "https://restcountries.eu/data/rus.svg",
      location: "Moscow",
      time_zone: "Asia/Krasnoyarsk"
    },
    %{
      country: "Rwanda",
      flag_url: "https://restcountries.eu/data/rwa.svg",
      location: "Kigali",
      time_zone: "Africa/Kigali"
    },
    %{
      country: "Saint Barthélemy",
      flag_url: "https://restcountries.eu/data/blm.svg",
      location: "Gustavia",
      time_zone: "America/Anguilla"
    },
    %{
      country: "Saint Helena, Ascension and Tristan da Cunha",
      flag_url: "https://restcountries.eu/data/shn.svg",
      location: "Jamestown",
      time_zone: "Atlantic/St_Helena"
    },
    %{
      country: "Saint Kitts and Nevis",
      flag_url: "https://restcountries.eu/data/kna.svg",
      location: "Basseterre",
      time_zone: "America/St_Kitts"
    },
    %{
      country: "Saint Lucia",
      flag_url: "https://restcountries.eu/data/lca.svg",
      location: "Castries",
      time_zone: "America/St_Lucia"
    },
    %{
      country: "Saint Pierre and Miquelon",
      flag_url: "https://restcountries.eu/data/spm.svg",
      location: "Saint-Pierre",
      time_zone: "America/Miquelon"
    },
    %{
      country: "Saint Vincent and the Grenadines",
      flag_url: "https://restcountries.eu/data/vct.svg",
      location: "Kingstown",
      time_zone: "America/St_Vincent"
    },
    %{
      country: "Samoa",
      flag_url: "https://restcountries.eu/data/wsm.svg",
      location: "Apia",
      time_zone: "Pacific/Apia"
    },
    %{
      country: "San Marino",
      flag_url: "https://restcountries.eu/data/smr.svg",
      location: "City of San Marino",
      time_zone: "Europe/Rome"
    },
    %{
      country: "Sao Tome and Principe",
      flag_url: "https://restcountries.eu/data/stp.svg",
      location: "São Tomé",
      time_zone: "Africa/Sao_Tome"
    },
    %{
      country: "Saudi Arabia",
      flag_url: "https://restcountries.eu/data/sau.svg",
      location: "Riyadh",
      time_zone: "Asia/Riyadh"
    },
    %{
      country: "Senegal",
      flag_url: "https://restcountries.eu/data/sen.svg",
      location: "Dakar",
      time_zone: "Africa/Dakar"
    },
    %{
      country: "Serbia",
      flag_url: "https://restcountries.eu/data/srb.svg",
      location: "Belgrade",
      time_zone: "Europe/Belgrade"
    },
    %{
      country: "Seychelles",
      flag_url: "https://restcountries.eu/data/syc.svg",
      location: "Victoria",
      time_zone: "Asia/Hong_Kong"
    },
    %{
      country: "Sierra Leone",
      flag_url: "https://restcountries.eu/data/sle.svg",
      location: "Freetown",
      time_zone: "Africa/Freetown"
    },
    %{
      country: "Singapore",
      flag_url: "https://restcountries.eu/data/sgp.svg",
      location: "Singapore",
      time_zone: "Asia/Singapore"
    },
    %{
      country: "Sint Maarten (Dutch part)",
      flag_url: "https://restcountries.eu/data/sxm.svg",
      location: "Philipsburg",
      time_zone: "America/Lower_Princes"
    },
    %{
      country: "Slovakia",
      flag_url: "https://restcountries.eu/data/svk.svg",
      location: "Bratislava",
      time_zone: "Europe/Bratislava"
    },
    %{
      country: "Slovenia",
      flag_url: "https://restcountries.eu/data/svn.svg",
      location: "Ljubljana",
      time_zone: "Europe/Ljubljana"
    },
    %{
      country: "Solomon Islands",
      flag_url: "https://restcountries.eu/data/slb.svg",
      location: "Honiara",
      time_zone: "Pacific/Guadalcanal"
    },
    %{
      country: "Somalia",
      flag_url: "https://restcountries.eu/data/som.svg",
      location: "Mogadishu",
      time_zone: "Africa/Mogadishu"
    },
    %{
      country: "South Africa",
      flag_url: "https://restcountries.eu/data/zaf.svg",
      location: "Pretoria",
      time_zone: "Africa/Johannesburg"
    },
    %{
      country: "South Georgia and the South Sandwich Islands",
      flag_url: "https://restcountries.eu/data/sgs.svg",
      location: "King Edward Point",
      time_zone: "Atlantic/South_Georgia"
    },
    %{
      country: "Korea (Republic of)",
      flag_url: "https://restcountries.eu/data/kor.svg",
      location: "Seoul",
      time_zone: "Asia/Seoul"
    },
    %{
      country: "South Sudan",
      flag_url: "https://restcountries.eu/data/ssd.svg",
      location: "Juba",
      time_zone: "Africa/Juba"
    },
    %{
      country: "Spain",
      flag_url: "https://restcountries.eu/data/esp.svg",
      location: "Madrid",
      time_zone: "Europe/Madrid"
    },
    %{
      country: "Sri Lanka",
      flag_url: "https://restcountries.eu/data/lka.svg",
      location: "Colombo",
      time_zone: "Asia/Colombo"
    },
    %{
      country: "Sudan",
      flag_url: "https://restcountries.eu/data/sdn.svg",
      location: "Khartoum",
      time_zone: "Africa/Khartoum"
    },
    %{
      country: "Suriname",
      flag_url: "https://restcountries.eu/data/sur.svg",
      location: "Paramaribo",
      time_zone: "America/Paramaribo"
    },
    %{
      country: "Svalbard and Jan Mayen",
      flag_url: "https://restcountries.eu/data/sjm.svg",
      location: "Longyearbyen",
      time_zone: "Arctic/Longyearbyen"
    },
    %{
      country: "Swaziland",
      flag_url: "https://restcountries.eu/data/swz.svg",
      location: "Lobamba",
      time_zone: "Africa/Mbabane"
    },
    %{
      country: "Sweden",
      flag_url: "https://restcountries.eu/data/swe.svg",
      location: "Stockholm",
      time_zone: "Europe/Stockholm"
    },
    %{
      country: "Switzerland",
      flag_url: "https://restcountries.eu/data/che.svg",
      location: "Bern",
      time_zone: "Europe/Zurich"
    },
    %{
      country: "Syrian Arab Republic",
      flag_url: "https://restcountries.eu/data/syr.svg",
      location: "Damascus",
      time_zone: "Asia/Damascus"
    },
    %{
      country: "Taiwan",
      flag_url: "https://restcountries.eu/data/twn.svg",
      location: "Taipei",
      time_zone: "Asia/Taipei"
    },
    %{
      country: "Tajikistan",
      flag_url: "https://restcountries.eu/data/tjk.svg",
      location: "Dushanbe",
      time_zone: "Asia/Dushanbe"
    },
    %{
      country: "Tanzania, United Republic of",
      flag_url: "https://restcountries.eu/data/tza.svg",
      location: "Dodoma",
      time_zone: "Africa/Dar_es_Salaam"
    },
    %{
      country: "Thailand",
      flag_url: "https://restcountries.eu/data/tha.svg",
      location: "Bangkok",
      time_zone: "Asia/Bangkok"
    },
    %{
      country: "Timor-Leste",
      flag_url: "https://restcountries.eu/data/tls.svg",
      location: "Dili",
      time_zone: "Asia/Dili"
    },
    %{
      country: "Togo",
      flag_url: "https://restcountries.eu/data/tgo.svg",
      location: "Lomé",
      time_zone: "Africa/Lome"
    },
    %{
      country: "Tokelau",
      flag_url: "https://restcountries.eu/data/tkl.svg",
      location: "Fakaofo",
      time_zone: "Pacific/Fakaofo"
    },
    %{
      country: "Tonga",
      flag_url: "https://restcountries.eu/data/ton.svg",
      location: "Nuku'alofa",
      time_zone: "Pacific/Tongatapu"
    },
    %{
      country: "Trinidad and Tobago",
      flag_url: "https://restcountries.eu/data/tto.svg",
      location: "Port of Spain",
      time_zone: "America/Port_of_Spain"
    },
    %{
      country: "Tunisia",
      flag_url: "https://restcountries.eu/data/tun.svg",
      location: "Tunis",
      time_zone: "Africa/Tunis"
    },
    %{
      country: "Turkey",
      flag_url: "https://restcountries.eu/data/tur.svg",
      location: "Ankara",
      time_zone: "Europe/Istanbul"
    },
    %{
      country: "Turkmenistan",
      flag_url: "https://restcountries.eu/data/tkm.svg",
      location: "Ashgabat",
      time_zone: "Asia/Ashgabat"
    },
    %{
      country: "Turks and Caicos Islands",
      flag_url: "https://restcountries.eu/data/tca.svg",
      location: "Cockburn Town",
      time_zone: "America/Grand_Turk"
    },
    %{
      country: "Uganda",
      flag_url: "https://restcountries.eu/data/uga.svg",
      location: "Kampala",
      time_zone: "Africa/Kampala"
    },
    %{
      country: "Ukraine",
      flag_url: "https://restcountries.eu/data/ukr.svg",
      location: "Kiev",
      time_zone: "Europe/Kiev"
    },
    %{
      country: "United Arab Emirates",
      flag_url: "https://restcountries.eu/data/are.svg",
      location: "Abu Dhabi",
      time_zone: "Asia/Dubai"
    },
    %{
      country: "United Kingdom of Great Britain and Northern Ireland",
      flag_url: "https://restcountries.eu/data/gbr.svg",
      location: "London",
      time_zone: "Europe/London"
    },
    %{
      country: "United States of America",
      flag_url: "https://restcountries.eu/data/usa.svg",
      location: "Washington, D.C.",
      time_zone: "America/Chicago"
    },
    %{
      country: "Uruguay",
      flag_url: "https://restcountries.eu/data/ury.svg",
      location: "Montevideo",
      time_zone: "America/Montevideo"
    },
    %{
      country: "Uzbekistan",
      flag_url: "https://restcountries.eu/data/uzb.svg",
      location: "Tashkent",
      time_zone: "Asia/Samarkand"
    },
    %{
      country: "Vanuatu",
      flag_url: "https://restcountries.eu/data/vut.svg",
      location: "Port Vila",
      time_zone: "Pacific/Efate"
    },
    %{
      country: "Venezuela (Bolivarian Republic of)",
      flag_url: "https://restcountries.eu/data/ven.svg",
      location: "Caracas",
      time_zone: "America/Caracas"
    },
    %{
      country: "Viet Nam",
      flag_url: "https://restcountries.eu/data/vnm.svg",
      location: "Hanoi",
      time_zone: "Asia/Ho_Chi_Minh"
    },
    %{
      country: "Wallis and Futuna",
      flag_url: "https://restcountries.eu/data/wlf.svg",
      location: "Mata-Utu",
      time_zone: "Pacific/Wallis"
    },
    %{
      country: "Western Sahara",
      flag_url: "https://restcountries.eu/data/esh.svg",
      location: "El Aaiún",
      time_zone: "Africa/El_Aaiun"
    },
    %{
      country: "Yemen",
      flag_url: "https://restcountries.eu/data/yem.svg",
      location: "Sana'a",
      time_zone: "Asia/Aden"
    },
    %{
      country: "Zambia",
      flag_url: "https://restcountries.eu/data/zmb.svg",
      location: "Lusaka",
      time_zone: "Africa/Lusaka"
    },
    %{
      country: "Zimbabwe",
      flag_url: "https://restcountries.eu/data/zwe.svg",
      location: "Harare",
      time_zone: "Africa/Harare"
    }
  ]

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(state) do
    time_zones = append_current_time(@init_time_zones)

    schedule_work()

    {:ok, Map.put(state, :time_zones, time_zones)}
  end

  @impl true
  def handle_info(:work, state) do
    time_zones = append_current_time(state.time_zones)

    schedule_work()

    {:noreply, Map.put(state, :time_zones, time_zones)}
  end

  def fetch_time_zones() do
    GenServer.call(__MODULE__, :fetch_times)
  end

  @impl
  def handle_call(:fetch_times, _from, state) do
    {:reply, state.time_zones, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 500)
  end

  defp append_current_time(time_zones) do
    time_zones
    |> Enum.map(fn time_zone ->
        Map.put(time_zone, :date, get_date_time_for_timezone(time_zone.time_zone))
      end)
  end

  defp get_date_time_for_timezone(timezone) do
    {:ok, now} = DateTime.now(timezone)

    {:ok, formatted_date} = Calendar.Strftime.strftime(now, "%d/%m/%y %H:%M:%S")

    formatted_date
  end
end
