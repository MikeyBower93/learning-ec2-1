defmodule LearningEc21.CapitalTimeZones do
  use GenServer

  @init_time_zones [
    %{country: "Afghanistan", location: "Kabul", long_lat: {65,33}, flag_url: "https://restcountries.eu/data/afg.svg"},
    %{country: "Åland Islands", location: "Mariehamn", long_lat: {19.9,60.116667}, flag_url: "https://restcountries.eu/data/ala.svg"},
    %{country: "Albania", location: "Tirana", long_lat: {20,41}, flag_url: "https://restcountries.eu/data/alb.svg"},
    %{country: "Algeria", location: "Algiers", long_lat: {3,28}, flag_url: "https://restcountries.eu/data/dza.svg"},
    %{country: "American Samoa", location: "Pago Pago", long_lat: {-170,-14.33333333}, flag_url: "https://restcountries.eu/data/asm.svg"},
    %{country: "Andorra", location: "Andorra la Vella", long_lat: {1.5,42.5}, flag_url: "https://restcountries.eu/data/and.svg"},
    %{country: "Angola", location: "Luanda", long_lat: {18.5,-12.5}, flag_url: "https://restcountries.eu/data/ago.svg"},
    %{country: "Anguilla", location: "The Valley", long_lat: {-63.16666666,18.25}, flag_url: "https://restcountries.eu/data/aia.svg"},
    %{country: "Antigua and Barbuda", location: "Saint John's", long_lat: {-61.8,17.05}, flag_url: "https://restcountries.eu/data/atg.svg"},
    %{country: "Argentina", location: "Buenos Aires", long_lat: {-64,-34}, flag_url: "https://restcountries.eu/data/arg.svg"},
    %{country: "Armenia", location: "Yerevan", long_lat: {45,40}, flag_url: "https://restcountries.eu/data/arm.svg"},
    %{country: "Aruba", location: "Oranjestad", long_lat: {-69.96666666,12.5}, flag_url: "https://restcountries.eu/data/abw.svg"},
    %{country: "Australia", location: "Canberra", long_lat: {133,-27}, flag_url: "https://restcountries.eu/data/aus.svg"},
    %{country: "Austria", location: "Vienna", long_lat: {13.33333333,47.33333333}, flag_url: "https://restcountries.eu/data/aut.svg"},
    %{country: "Azerbaijan", location: "Baku", long_lat: {47.5,40.5}, flag_url: "https://restcountries.eu/data/aze.svg"},
    %{country: "Bahamas", location: "Nassau", long_lat: {-76,24.25}, flag_url: "https://restcountries.eu/data/bhs.svg"},
    %{country: "Bahrain", location: "Manama", long_lat: {50.55,26}, flag_url: "https://restcountries.eu/data/bhr.svg"},
    %{country: "Bangladesh", location: "Dhaka", long_lat: {90,24}, flag_url: "https://restcountries.eu/data/bgd.svg"},
    %{country: "Barbados", location: "Bridgetown", long_lat: {-59.53333333,13.16666666}, flag_url: "https://restcountries.eu/data/brb.svg"},
    %{country: "Belarus", location: "Minsk", long_lat: {28,53}, flag_url: "https://restcountries.eu/data/blr.svg"},
    %{country: "Belgium", location: "Brussels", long_lat: {4,50.83333333}, flag_url: "https://restcountries.eu/data/bel.svg"},
    %{country: "Belize", location: "Belmopan", long_lat: {-88.75,17.25}, flag_url: "https://restcountries.eu/data/blz.svg"},
    %{country: "Benin", location: "Porto-Novo", long_lat: {2.25,9.5}, flag_url: "https://restcountries.eu/data/ben.svg"},
    %{country: "Bermuda", location: "Hamilton", long_lat: {-64.75,32.33333333}, flag_url: "https://restcountries.eu/data/bmu.svg"},
    %{country: "Bhutan", location: "Thimphu", long_lat: {90.5,27.5}, flag_url: "https://restcountries.eu/data/btn.svg"},
    %{country: "Bolivia (Plurinational State of)", location: "Sucre", long_lat: {-65,-17}, flag_url: "https://restcountries.eu/data/bol.svg"},
    %{country: "Bonaire, Sint Eustatius and Saba", location: "Kralendijk", long_lat: {-68.266667,12.15}, flag_url: "https://restcountries.eu/data/bes.svg"},
    %{country: "Bosnia and Herzegovina", location: "Sarajevo", long_lat: {18,44}, flag_url: "https://restcountries.eu/data/bih.svg"},
    %{country: "Botswana", location: "Gaborone", long_lat: {24,-22}, flag_url: "https://restcountries.eu/data/bwa.svg"},
    %{country: "Brazil", location: "Brasília", long_lat: {-55,-10}, flag_url: "https://restcountries.eu/data/bra.svg"},
    %{country: "British Indian Ocean Territory", location: "Diego Garcia", long_lat: {71.5,-6}, flag_url: "https://restcountries.eu/data/iot.svg"},
    %{country: "Virgin Islands (British)", location: "Road Town", long_lat: {-64.62305,18.431383}, flag_url: "https://restcountries.eu/data/vgb.svg"},
    %{country: "Virgin Islands (U.S.)", location: "Charlotte Amalie", long_lat: {-64.93,18.34}, flag_url: "https://restcountries.eu/data/vir.svg"},
    %{country: "Brunei Darussalam", location: "Bandar Seri Begawan", long_lat: {114.66666666,4.5}, flag_url: "https://restcountries.eu/data/brn.svg"},
    %{country: "Bulgaria", location: "Sofia", long_lat: {25,43}, flag_url: "https://restcountries.eu/data/bgr.svg"},
    %{country: "Burkina Faso", location: "Ouagadougou", long_lat: {-2,13}, flag_url: "https://restcountries.eu/data/bfa.svg"},
    %{country: "Burundi", location: "Bujumbura", long_lat: {30,-3.5}, flag_url: "https://restcountries.eu/data/bdi.svg"},
    %{country: "Cambodia", location: "Phnom Penh", long_lat: {105,13}, flag_url: "https://restcountries.eu/data/khm.svg"},
    %{country: "Cameroon", location: "Yaoundé", long_lat: {12,6}, flag_url: "https://restcountries.eu/data/cmr.svg"},
    %{country: "Canada", location: "Ottawa", long_lat: {-95,60}, flag_url: "https://restcountries.eu/data/can.svg"},
    %{country: "Cabo Verde", location: "Praia", long_lat: {-24,16}, flag_url: "https://restcountries.eu/data/cpv.svg"},
    %{country: "Cayman Islands", location: "George Town", long_lat: {-80.5,19.5}, flag_url: "https://restcountries.eu/data/cym.svg"},
    %{country: "Central African Republic", location: "Bangui", long_lat: {21,7}, flag_url: "https://restcountries.eu/data/caf.svg"},
    %{country: "Chad", location: "N'Djamena", long_lat: {19,15}, flag_url: "https://restcountries.eu/data/tcd.svg"},
    %{country: "Chile", location: "Santiago", long_lat: {-71,-30}, flag_url: "https://restcountries.eu/data/chl.svg"},
    %{country: "China", location: "Beijing", long_lat: {105,35}, flag_url: "https://restcountries.eu/data/chn.svg"},
    %{country: "Christmas Island", location: "Flying Fish Cove", long_lat: {105.66666666,-10.5}, flag_url: "https://restcountries.eu/data/cxr.svg"},
    %{country: "Cocos (Keeling) Islands", location: "West Island", long_lat: {96.83333333,-12.5}, flag_url: "https://restcountries.eu/data/cck.svg"},
    %{country: "Colombia", location: "Bogotá", long_lat: {-72,4}, flag_url: "https://restcountries.eu/data/col.svg"},
    %{country: "Comoros", location: "Moroni", long_lat: {44.25,-12.16666666}, flag_url: "https://restcountries.eu/data/com.svg"},
    %{country: "Congo", location: "Brazzaville", long_lat: {15,-1}, flag_url: "https://restcountries.eu/data/cog.svg"},
    %{country: "Congo (Democratic Republic of the)", location: "Kinshasa", long_lat: {25,0}, flag_url: "https://restcountries.eu/data/cod.svg"},
    %{country: "Cook Islands", location: "Avarua", long_lat: {-159.76666666,-21.23333333}, flag_url: "https://restcountries.eu/data/cok.svg"},
    %{country: "Costa Rica", location: "San José", long_lat: {-84,10}, flag_url: "https://restcountries.eu/data/cri.svg"},
    %{country: "Croatia", location: "Zagreb", long_lat: {15.5,45.16666666}, flag_url: "https://restcountries.eu/data/hrv.svg"},
    %{country: "Cuba", location: "Havana", long_lat: {-80,21.5}, flag_url: "https://restcountries.eu/data/cub.svg"},
    %{country: "Curaçao", location: "Willemstad", long_lat: {-68.933333,12.116667}, flag_url: "https://restcountries.eu/data/cuw.svg"},
    %{country: "Cyprus", location: "Nicosia", long_lat: {33,35}, flag_url: "https://restcountries.eu/data/cyp.svg"},
    %{country: "Czech Republic", location: "Prague", long_lat: {15.5,49.75}, flag_url: "https://restcountries.eu/data/cze.svg"},
    %{country: "Denmark", location: "Copenhagen", long_lat: {10,56}, flag_url: "https://restcountries.eu/data/dnk.svg"},
    %{country: "Djibouti", location: "Djibouti", long_lat: {43,11.5}, flag_url: "https://restcountries.eu/data/dji.svg"},
    %{country: "Dominica", location: "Roseau", long_lat: {-61.33333333,15.41666666}, flag_url: "https://restcountries.eu/data/dma.svg"},
    %{country: "Dominican Republic", location: "Santo Domingo", long_lat: {-70.66666666,19}, flag_url: "https://restcountries.eu/data/dom.svg"},
    %{country: "Ecuador", location: "Quito", long_lat: {-77.5,-2}, flag_url: "https://restcountries.eu/data/ecu.svg"},
    %{country: "Egypt", location: "Cairo", long_lat: {30,27}, flag_url: "https://restcountries.eu/data/egy.svg"},
    %{country: "El Salvador", location: "San Salvador", long_lat: {-88.91666666,13.83333333}, flag_url: "https://restcountries.eu/data/slv.svg"},
    %{country: "Equatorial Guinea", location: "Malabo", long_lat: {10,2}, flag_url: "https://restcountries.eu/data/gnq.svg"},
    %{country: "Eritrea", location: "Asmara", long_lat: {39,15}, flag_url: "https://restcountries.eu/data/eri.svg"},
    %{country: "Estonia", location: "Tallinn", long_lat: {26,59}, flag_url: "https://restcountries.eu/data/est.svg"},
    %{country: "Ethiopia", location: "Addis Ababa", long_lat: {38,8}, flag_url: "https://restcountries.eu/data/eth.svg"},
    %{country: "Falkland Islands (Malvinas)", location: "Stanley", long_lat: {-59,-51.75}, flag_url: "https://restcountries.eu/data/flk.svg"},
    %{country: "Faroe Islands", location: "Tórshavn", long_lat: {-7,62}, flag_url: "https://restcountries.eu/data/fro.svg"},
    %{country: "Fiji", location: "Suva", long_lat: {175,-18}, flag_url: "https://restcountries.eu/data/fji.svg"},
    %{country: "Finland", location: "Helsinki", long_lat: {26,64}, flag_url: "https://restcountries.eu/data/fin.svg"},
    %{country: "France", location: "Paris", long_lat: {2,46}, flag_url: "https://restcountries.eu/data/fra.svg"},
    %{country: "French Guiana", location: "Cayenne", long_lat: {-53,4}, flag_url: "https://restcountries.eu/data/guf.svg"},
    %{country: "French Polynesia", location: "Papeetē", long_lat: {-140,-15}, flag_url: "https://restcountries.eu/data/pyf.svg"},
    %{country: "French Southern Territories", location: "Port-aux-Français", long_lat: {69.167,-49.25}, flag_url: "https://restcountries.eu/data/atf.svg"},
    %{country: "Gabon", location: "Libreville", long_lat: {11.75,-1}, flag_url: "https://restcountries.eu/data/gab.svg"},
    %{country: "Gambia", location: "Banjul", long_lat: {-16.56666666,13.46666666}, flag_url: "https://restcountries.eu/data/gmb.svg"},
    %{country: "Georgia", location: "Tbilisi", long_lat: {43.5,42}, flag_url: "https://restcountries.eu/data/geo.svg"},
    %{country: "Germany", location: "Berlin", long_lat: {9,51}, flag_url: "https://restcountries.eu/data/deu.svg"},
    %{country: "Ghana", location: "Accra", long_lat: {-2,8}, flag_url: "https://restcountries.eu/data/gha.svg"},
    %{country: "Gibraltar", location: "Gibraltar", long_lat: {-5.35,36.13333333}, flag_url: "https://restcountries.eu/data/gib.svg"},
    %{country: "Greece", location: "Athens", long_lat: {22,39}, flag_url: "https://restcountries.eu/data/grc.svg"},
    %{country: "Greenland", location: "Nuuk", long_lat: {-40,72}, flag_url: "https://restcountries.eu/data/grl.svg"},
    %{country: "Grenada", location: "St. George's", long_lat: {-61.66666666,12.11666666}, flag_url: "https://restcountries.eu/data/grd.svg"},
    %{country: "Guadeloupe", location: "Basse-Terre", long_lat: {-61.583333,16.25}, flag_url: "https://restcountries.eu/data/glp.svg"},
    %{country: "Guam", location: "Hagåtña", long_lat: {144.78333333,13.46666666}, flag_url: "https://restcountries.eu/data/gum.svg"},
    %{country: "Guatemala", location: "Guatemala City", long_lat: {-90.25,15.5}, flag_url: "https://restcountries.eu/data/gtm.svg"},
    %{country: "Guernsey", location: "St. Peter Port", long_lat: {-2.58333333,49.46666666}, flag_url: "https://restcountries.eu/data/ggy.svg"},
    %{country: "Guinea", location: "Conakry", long_lat: {-10,11}, flag_url: "https://restcountries.eu/data/gin.svg"},
    %{country: "Guinea-Bissau", location: "Bissau", long_lat: {-15,12}, flag_url: "https://restcountries.eu/data/gnb.svg"},
    %{country: "Guyana", location: "Georgetown", long_lat: {-59,5}, flag_url: "https://restcountries.eu/data/guy.svg"},
    %{country: "Haiti", location: "Port-au-Prince", long_lat: {-72.41666666,19}, flag_url: "https://restcountries.eu/data/hti.svg"},
    %{country: "Holy See", location: "Rome", long_lat: {12.45,41.9}, flag_url: "https://restcountries.eu/data/vat.svg"},
    %{country: "Honduras", location: "Tegucigalpa", long_lat: {-86.5,15}, flag_url: "https://restcountries.eu/data/hnd.svg"},
    %{country: "Hong Kong", location: "City of Victoria", long_lat: {114.16666666,22.25}, flag_url: "https://restcountries.eu/data/hkg.svg"},
    %{country: "Hungary", location: "Budapest", long_lat: {20,47}, flag_url: "https://restcountries.eu/data/hun.svg"},
    %{country: "Iceland", location: "Reykjavík", long_lat: {-18,65}, flag_url: "https://restcountries.eu/data/isl.svg"},
    %{country: "India", location: "New Delhi", long_lat: {77,20}, flag_url: "https://restcountries.eu/data/ind.svg"},
    %{country: "Indonesia", location: "Jakarta", long_lat: {120,-5}, flag_url: "https://restcountries.eu/data/idn.svg"},
    %{country: "Côte d'Ivoire", location: "Yamoussoukro", long_lat: {-5,8}, flag_url: "https://restcountries.eu/data/civ.svg"},
    %{country: "Iran (Islamic Republic of)", location: "Tehran", long_lat: {53,32}, flag_url: "https://restcountries.eu/data/irn.svg"},
    %{country: "Iraq", location: "Baghdad", long_lat: {44,33}, flag_url: "https://restcountries.eu/data/irq.svg"},
    %{country: "Ireland", location: "Dublin", long_lat: {-8,53}, flag_url: "https://restcountries.eu/data/irl.svg"},
    %{country: "Isle of Man", location: "Douglas", long_lat: {-4.5,54.25}, flag_url: "https://restcountries.eu/data/imn.svg"},
    %{country: "Israel", location: "Jerusalem", long_lat: {34.75,31.5}, flag_url: "https://restcountries.eu/data/isr.svg"},
    %{country: "Italy", location: "Rome", long_lat: {12.45,41.9}, flag_url: "https://restcountries.eu/data/ita.svg"},
    %{country: "Jamaica", location: "Kingston", long_lat: {-77.5,18.25}, flag_url: "https://restcountries.eu/data/jam.svg"},
    %{country: "Japan", location: "Tokyo", long_lat: {138,36}, flag_url: "https://restcountries.eu/data/jpn.svg"},
    %{country: "Jersey", location: "Saint Helier", long_lat: {-2.16666666,49.25}, flag_url: "https://restcountries.eu/data/jey.svg"},
    %{country: "Jordan", location: "Amman", long_lat: {36,31}, flag_url: "https://restcountries.eu/data/jor.svg"},
    %{country: "Kazakhstan", location: "Astana", long_lat: {68,48}, flag_url: "https://restcountries.eu/data/kaz.svg"},
    %{country: "Kenya", location: "Nairobi", long_lat: {38,1}, flag_url: "https://restcountries.eu/data/ken.svg"},
    %{country: "Kiribati", location: "South Tarawa", long_lat: {173,1.41666666}, flag_url: "https://restcountries.eu/data/kir.svg"},
    %{country: "Kuwait", location: "Kuwait City", long_lat: {45.75,29.5}, flag_url: "https://restcountries.eu/data/kwt.svg"},
    %{country: "Kyrgyzstan", location: "Bishkek", long_lat: {75,41}, flag_url: "https://restcountries.eu/data/kgz.svg"},
    %{country: "Lao People's Democratic Republic", location: "Vientiane", long_lat: {105,18}, flag_url: "https://restcountries.eu/data/lao.svg"},
    %{country: "Latvia", location: "Riga", long_lat: {25,57}, flag_url: "https://restcountries.eu/data/lva.svg"},
    %{country: "Lebanon", location: "Beirut", long_lat: {35.83333333,33.83333333}, flag_url: "https://restcountries.eu/data/lbn.svg"},
    %{country: "Lesotho", location: "Maseru", long_lat: {28.5,-29.5}, flag_url: "https://restcountries.eu/data/lso.svg"},
    %{country: "Liberia", location: "Monrovia", long_lat: {-9.5,6.5}, flag_url: "https://restcountries.eu/data/lbr.svg"},
    %{country: "Libya", location: "Tripoli", long_lat: {17,25}, flag_url: "https://restcountries.eu/data/lby.svg"},
    %{country: "Liechtenstein", location: "Vaduz", long_lat: {9.53333333,47.26666666}, flag_url: "https://restcountries.eu/data/lie.svg"},
    %{country: "Lithuania", location: "Vilnius", long_lat: {24,56}, flag_url: "https://restcountries.eu/data/ltu.svg"},
    %{country: "Luxembourg", location: "Luxembourg", long_lat: {6.16666666,49.75}, flag_url: "https://restcountries.eu/data/lux.svg"},
    %{country: "Macedonia (the former Yugoslav Republic of)", location: "Skopje", long_lat: {22,41.83333333}, flag_url: "https://restcountries.eu/data/mkd.svg"},
    %{country: "Madagascar", location: "Antananarivo", long_lat: {47,-20}, flag_url: "https://restcountries.eu/data/mdg.svg"},
    %{country: "Malawi", location: "Lilongwe", long_lat: {34,-13.5}, flag_url: "https://restcountries.eu/data/mwi.svg"},
    %{country: "Malaysia", location: "Kuala Lumpur", long_lat: {112.5,2.5}, flag_url: "https://restcountries.eu/data/mys.svg"},
    %{country: "Maldives", location: "Malé", long_lat: {73,3.25}, flag_url: "https://restcountries.eu/data/mdv.svg"},
    %{country: "Mali", location: "Bamako", long_lat: {-4,17}, flag_url: "https://restcountries.eu/data/mli.svg"},
    %{country: "Malta", location: "Valletta", long_lat: {14.58333333,35.83333333}, flag_url: "https://restcountries.eu/data/mlt.svg"},
    %{country: "Marshall Islands", location: "Majuro", long_lat: {168,9}, flag_url: "https://restcountries.eu/data/mhl.svg"},
    %{country: "Martinique", location: "Fort-de-France", long_lat: {-61,14.666667}, flag_url: "https://restcountries.eu/data/mtq.svg"},
    %{country: "Mauritania", location: "Nouakchott", long_lat: {-12,20}, flag_url: "https://restcountries.eu/data/mrt.svg"},
    %{country: "Mauritius", location: "Port Louis", long_lat: {57.55,-20.28333333}, flag_url: "https://restcountries.eu/data/mus.svg"},
    %{country: "Mayotte", location: "Mamoudzou", long_lat: {45.16666666,-12.83333333}, flag_url: "https://restcountries.eu/data/myt.svg"},
    %{country: "Mexico", location: "Mexico City", long_lat: {-102,23}, flag_url: "https://restcountries.eu/data/mex.svg"},
    %{country: "Micronesia (Federated States of)", location: "Palikir", long_lat: {158.25,6.91666666}, flag_url: "https://restcountries.eu/data/fsm.svg"},
    %{country: "Moldova (Republic of)", location: "Chișinău", long_lat: {29,47}, flag_url: "https://restcountries.eu/data/mda.svg"},
    %{country: "Monaco", location: "Monaco", long_lat: {7.4,43.73333333}, flag_url: "https://restcountries.eu/data/mco.svg"},
    %{country: "Mongolia", location: "Ulan Bator", long_lat: {105,46}, flag_url: "https://restcountries.eu/data/mng.svg"},
    %{country: "Montenegro", location: "Podgorica", long_lat: {19.3,42.5}, flag_url: "https://restcountries.eu/data/mne.svg"},
    %{country: "Montserrat", location: "Plymouth", long_lat: {-62.2,16.75}, flag_url: "https://restcountries.eu/data/msr.svg"},
    %{country: "Morocco", location: "Rabat", long_lat: {-5,32}, flag_url: "https://restcountries.eu/data/mar.svg"},
    %{country: "Mozambique", location: "Maputo", long_lat: {35,-18.25}, flag_url: "https://restcountries.eu/data/moz.svg"},
    %{country: "Myanmar", location: "Naypyidaw", long_lat: {98,22}, flag_url: "https://restcountries.eu/data/mmr.svg"},
    %{country: "Namibia", location: "Windhoek", long_lat: {17,-22}, flag_url: "https://restcountries.eu/data/nam.svg"},
    %{country: "Nauru", location: "Yaren", long_lat: {166.91666666,-0.53333333}, flag_url: "https://restcountries.eu/data/nru.svg"},
    %{country: "Nepal", location: "Kathmandu", long_lat: {84,28}, flag_url: "https://restcountries.eu/data/npl.svg"},
    %{country: "Netherlands", location: "Amsterdam", long_lat: {5.75,52.5}, flag_url: "https://restcountries.eu/data/nld.svg"},
    %{country: "New Caledonia", location: "Nouméa", long_lat: {165.5,-21.5}, flag_url: "https://restcountries.eu/data/ncl.svg"},
    %{country: "New Zealand", location: "Wellington", long_lat: {174,-41}, flag_url: "https://restcountries.eu/data/nzl.svg"},
    %{country: "Nicaragua", location: "Managua", long_lat: {-85,13}, flag_url: "https://restcountries.eu/data/nic.svg"},
    %{country: "Niger", location: "Niamey", long_lat: {8,16}, flag_url: "https://restcountries.eu/data/ner.svg"},
    %{country: "Nigeria", location: "Abuja", long_lat: {8,10}, flag_url: "https://restcountries.eu/data/nga.svg"},
    %{country: "Niue", location: "Alofi", long_lat: {-169.86666666,-19.03333333}, flag_url: "https://restcountries.eu/data/niu.svg"},
    %{country: "Norfolk Island", location: "Kingston", long_lat: {-77.5,18.25}, flag_url: "https://restcountries.eu/data/nfk.svg"},
    %{country: "Korea (Democratic People's Republic of)", location: "Pyongyang", long_lat: {127,40}, flag_url: "https://restcountries.eu/data/prk.svg"},
    %{country: "Northern Mariana Islands", location: "Saipan", long_lat: {145.75,15.2}, flag_url: "https://restcountries.eu/data/mnp.svg"},
    %{country: "Norway", location: "Oslo", long_lat: {10,62}, flag_url: "https://restcountries.eu/data/nor.svg"},
    %{country: "Oman", location: "Muscat", long_lat: {57,21}, flag_url: "https://restcountries.eu/data/omn.svg"},
    %{country: "Pakistan", location: "Islamabad", long_lat: {70,30}, flag_url: "https://restcountries.eu/data/pak.svg"},
    %{country: "Palau", location: "Ngerulmud", long_lat: {134.5,7.5}, flag_url: "https://restcountries.eu/data/plw.svg"},
    %{country: "Palestine, State of", location: "Ramallah", long_lat: {35.2,31.9}, flag_url: "https://restcountries.eu/data/pse.svg"},
    %{country: "Panama", location: "Panama City", long_lat: {-80,9}, flag_url: "https://restcountries.eu/data/pan.svg"},
    %{country: "Papua New Guinea", location: "Port Moresby", long_lat: {147,-6}, flag_url: "https://restcountries.eu/data/png.svg"},
    %{country: "Paraguay", location: "Asunción", long_lat: {-58,-23}, flag_url: "https://restcountries.eu/data/pry.svg"},
    %{country: "Peru", location: "Lima", long_lat: {-76,-10}, flag_url: "https://restcountries.eu/data/per.svg"},
    %{country: "Philippines", location: "Manila", long_lat: {122,13}, flag_url: "https://restcountries.eu/data/phl.svg"},
    %{country: "Pitcairn", location: "Adamstown", long_lat: {-130.1,-25.06666666}, flag_url: "https://restcountries.eu/data/pcn.svg"},
    %{country: "Poland", location: "Warsaw", long_lat: {20,52}, flag_url: "https://restcountries.eu/data/pol.svg"},
    %{country: "Portugal", location: "Lisbon", long_lat: {-8,39.5}, flag_url: "https://restcountries.eu/data/prt.svg"},
    %{country: "Puerto Rico", location: "San Juan", long_lat: {-66.5,18.25}, flag_url: "https://restcountries.eu/data/pri.svg"},
    %{country: "Qatar", location: "Doha", long_lat: {51.25,25.5}, flag_url: "https://restcountries.eu/data/qat.svg"},
    %{country: "Republic of Kosovo", location: "Pristina", long_lat: {21.166667,42.666667}, flag_url: "https://restcountries.eu/data/kos.svg"},
    %{country: "Réunion", location: "Saint-Denis", long_lat: {55.5,-21.15}, flag_url: "https://restcountries.eu/data/reu.svg"},
    %{country: "Romania", location: "Bucharest", long_lat: {25,46}, flag_url: "https://restcountries.eu/data/rou.svg"},
    %{country: "Russian Federation", location: "Moscow", long_lat: {100,60}, flag_url: "https://restcountries.eu/data/rus.svg"},
    %{country: "Rwanda", location: "Kigali", long_lat: {30,-2}, flag_url: "https://restcountries.eu/data/rwa.svg"},
    %{country: "Saint Barthélemy", location: "Gustavia", long_lat: {-63.41666666,18.5}, flag_url: "https://restcountries.eu/data/blm.svg"},
    %{country: "Saint Helena, Ascension and Tristan da Cunha", location: "Jamestown", long_lat: {-5.7,-15.95}, flag_url: "https://restcountries.eu/data/shn.svg"},
    %{country: "Saint Kitts and Nevis", location: "Basseterre", long_lat: {-62.75,17.33333333}, flag_url: "https://restcountries.eu/data/kna.svg"},
    %{country: "Saint Lucia", location: "Castries", long_lat: {-60.96666666,13.88333333}, flag_url: "https://restcountries.eu/data/lca.svg"},
    %{country: "Saint Martin (French part)", location: "Marigot", long_lat: {-63.95,18.08333333}, flag_url: "https://restcountries.eu/data/maf.svg"},
    %{country: "Saint Pierre and Miquelon", location: "Saint-Pierre", long_lat: {-56.33333333,46.83333333}, flag_url: "https://restcountries.eu/data/spm.svg"},
    %{country: "Saint Vincent and the Grenadines", location: "Kingstown", long_lat: {-61.2,13.25}, flag_url: "https://restcountries.eu/data/vct.svg"},
    %{country: "Samoa", location: "Apia", long_lat: {-172.33333333,-13.58333333}, flag_url: "https://restcountries.eu/data/wsm.svg"},
    %{country: "San Marino", location: "City of San Marino", long_lat: {12.41666666,43.76666666}, flag_url: "https://restcountries.eu/data/smr.svg"},
    %{country: "Sao Tome and Principe", location: "São Tomé", long_lat: {7,1}, flag_url: "https://restcountries.eu/data/stp.svg"},
    %{country: "Saudi Arabia", location: "Riyadh", long_lat: {45,25}, flag_url: "https://restcountries.eu/data/sau.svg"},
    %{country: "Senegal", location: "Dakar", long_lat: {-14,14}, flag_url: "https://restcountries.eu/data/sen.svg"},
    %{country: "Serbia", location: "Belgrade", long_lat: {21,44}, flag_url: "https://restcountries.eu/data/srb.svg"},
    %{country: "Seychelles", location: "Victoria", long_lat: {114.16666666,22.25}, flag_url: "https://restcountries.eu/data/syc.svg"},
    %{country: "Sierra Leone", location: "Freetown", long_lat: {-11.5,8.5}, flag_url: "https://restcountries.eu/data/sle.svg"},
    %{country: "Singapore", location: "Singapore", long_lat: {103.8,1.36666666}, flag_url: "https://restcountries.eu/data/sgp.svg"},
    %{country: "Sint Maarten (Dutch part)", location: "Philipsburg", long_lat: {-63.05,18.033333}, flag_url: "https://restcountries.eu/data/sxm.svg"},
    %{country: "Slovakia", location: "Bratislava", long_lat: {19.5,48.66666666}, flag_url: "https://restcountries.eu/data/svk.svg"},
    %{country: "Slovenia", location: "Ljubljana", long_lat: {14.81666666,46.11666666}, flag_url: "https://restcountries.eu/data/svn.svg"},
    %{country: "Solomon Islands", location: "Honiara", long_lat: {159,-8}, flag_url: "https://restcountries.eu/data/slb.svg"},
    %{country: "Somalia", location: "Mogadishu", long_lat: {49,10}, flag_url: "https://restcountries.eu/data/som.svg"},
    %{country: "South Africa", location: "Pretoria", long_lat: {24,-29}, flag_url: "https://restcountries.eu/data/zaf.svg"},
    %{country: "South Georgia and the South Sandwich Islands", location: "King Edward Point", long_lat: {-37,-54.5}, flag_url: "https://restcountries.eu/data/sgs.svg"},
    %{country: "Korea (Republic of)", location: "Seoul", long_lat: {127.5,37}, flag_url: "https://restcountries.eu/data/kor.svg"},
    %{country: "South Sudan", location: "Juba", long_lat: {30,7}, flag_url: "https://restcountries.eu/data/ssd.svg"},
    %{country: "Spain", location: "Madrid", long_lat: {-4,40}, flag_url: "https://restcountries.eu/data/esp.svg"},
    %{country: "Sri Lanka", location: "Colombo", long_lat: {81,7}, flag_url: "https://restcountries.eu/data/lka.svg"},
    %{country: "Sudan", location: "Khartoum", long_lat: {30,15}, flag_url: "https://restcountries.eu/data/sdn.svg"},
    %{country: "Suriname", location: "Paramaribo", long_lat: {-56,4}, flag_url: "https://restcountries.eu/data/sur.svg"},
    %{country: "Svalbard and Jan Mayen", location: "Longyearbyen", long_lat: {20,78}, flag_url: "https://restcountries.eu/data/sjm.svg"},
    %{country: "Swaziland", location: "Lobamba", long_lat: {31.5,-26.5}, flag_url: "https://restcountries.eu/data/swz.svg"},
    %{country: "Sweden", location: "Stockholm", long_lat: {15,62}, flag_url: "https://restcountries.eu/data/swe.svg"},
    %{country: "Switzerland", location: "Bern", long_lat: {8,47}, flag_url: "https://restcountries.eu/data/che.svg"},
    %{country: "Syrian Arab Republic", location: "Damascus", long_lat: {38,35}, flag_url: "https://restcountries.eu/data/syr.svg"},
    %{country: "Taiwan", location: "Taipei", long_lat: {121,23.5}, flag_url: "https://restcountries.eu/data/twn.svg"},
    %{country: "Tajikistan", location: "Dushanbe", long_lat: {71,39}, flag_url: "https://restcountries.eu/data/tjk.svg"},
    %{country: "Tanzania, United Republic of", location: "Dodoma", long_lat: {35,-6}, flag_url: "https://restcountries.eu/data/tza.svg"},
    %{country: "Thailand", location: "Bangkok", long_lat: {100,15}, flag_url: "https://restcountries.eu/data/tha.svg"},
    %{country: "Timor-Leste", location: "Dili", long_lat: {125.91666666,-8.83333333}, flag_url: "https://restcountries.eu/data/tls.svg"},
    %{country: "Togo", location: "Lomé", long_lat: {1.16666666,8}, flag_url: "https://restcountries.eu/data/tgo.svg"},
    %{country: "Tokelau", location: "Fakaofo", long_lat: {-172,-9}, flag_url: "https://restcountries.eu/data/tkl.svg"},
    %{country: "Tonga", location: "Nuku'alofa", long_lat: {-175,-20}, flag_url: "https://restcountries.eu/data/ton.svg"},
    %{country: "Trinidad and Tobago", location: "Port of Spain", long_lat: {-61,11}, flag_url: "https://restcountries.eu/data/tto.svg"},
    %{country: "Tunisia", location: "Tunis", long_lat: {9,34}, flag_url: "https://restcountries.eu/data/tun.svg"},
    %{country: "Turkey", location: "Ankara", long_lat: {35,39}, flag_url: "https://restcountries.eu/data/tur.svg"},
    %{country: "Turkmenistan", location: "Ashgabat", long_lat: {60,40}, flag_url: "https://restcountries.eu/data/tkm.svg"},
    %{country: "Turks and Caicos Islands", location: "Cockburn Town", long_lat: {-71.58333333,21.75}, flag_url: "https://restcountries.eu/data/tca.svg"},
    %{country: "Tuvalu", location: "Funafuti", long_lat: {178,-8}, flag_url: "https://restcountries.eu/data/tuv.svg"},
    %{country: "Uganda", location: "Kampala", long_lat: {32,1}, flag_url: "https://restcountries.eu/data/uga.svg"},
    %{country: "Ukraine", location: "Kiev", long_lat: {32,49}, flag_url: "https://restcountries.eu/data/ukr.svg"},
    %{country: "United Arab Emirates", location: "Abu Dhabi", long_lat: {54,24}, flag_url: "https://restcountries.eu/data/are.svg"},
    %{country: "United Kingdom of Great Britain and Northern Ireland", location: "London", long_lat: {-2,54}, flag_url: "https://restcountries.eu/data/gbr.svg"},
    %{country: "United States of America", location: "Washington, D.C.", long_lat: {-97,38}, flag_url: "https://restcountries.eu/data/usa.svg"},
    %{country: "Uruguay", location: "Montevideo", long_lat: {-56,-33}, flag_url: "https://restcountries.eu/data/ury.svg"},
    %{country: "Uzbekistan", location: "Tashkent", long_lat: {64,41}, flag_url: "https://restcountries.eu/data/uzb.svg"},
    %{country: "Vanuatu", location: "Port Vila", long_lat: {167,-16}, flag_url: "https://restcountries.eu/data/vut.svg"},
    %{country: "Venezuela (Bolivarian Republic of)", location: "Caracas", long_lat: {-66,8}, flag_url: "https://restcountries.eu/data/ven.svg"},
    %{country: "Viet Nam", location: "Hanoi", long_lat: {107.83333333,16.16666666}, flag_url: "https://restcountries.eu/data/vnm.svg"},
    %{country: "Wallis and Futuna", location: "Mata-Utu", long_lat: {-176.2,-13.3}, flag_url: "https://restcountries.eu/data/wlf.svg"},
    %{country: "Western Sahara", location: "El Aaiún", long_lat: {-13,24.5}, flag_url: "https://restcountries.eu/data/esh.svg"},
    %{country: "Yemen", location: "Sana'a", long_lat: {48,15}, flag_url: "https://restcountries.eu/data/yem.svg"},
    %{country: "Zambia", location: "Lusaka", long_lat: {30,-15}, flag_url: "https://restcountries.eu/data/zmb.svg"},
    %{country: "Zimbabwe", location: "Harare", long_lat: {30,-20}, flag_url: "https://restcountries.eu/data/zwe.svg"}
  ]

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(state) do
    time_zones =
      parse_init_data_lat_longs()
      |> append_current_time()

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

  defp parse_init_data_lat_longs() do
    @init_time_zones
    |> Enum.map(fn init_time_zone ->
        init_time_zone.long_lat
        |> TzWorld.timezone_at()
        |> case do
          {:ok, timezone} ->
            Map.put(init_time_zone, :time_zone, timezone)
          {:error, _} ->
            Map.put(init_time_zone, :time_zone, nil)
        end
      end)
    |> Enum.filter(&(not is_nil(&1.time_zone)))
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
