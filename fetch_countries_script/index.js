const fetch = require("node-fetch");

(async () => {
  const countriesRequest = await fetch("https://restcountries.eu/rest/v2/all");
  const countries = await countriesRequest.json();

  const mappedCountries = await Promise.all(
    countries
      .filter((country) => country.capital)
      .map(async (country) => {
        try {
          const capitalInfoRequest = await fetch(
            encodeURI(
              `https://restcountries.eu/rest/v2/capital/${country.capital}`
            )
          );

          const capitalInfo = await capitalInfoRequest.json();

          return {
            name: country.name,
            capital: country.capital,
            flag: country.flag,
            latlng: capitalInfo[0].latlng,
          };
        } catch (error) {
          console.log(error);
        }
      })
  );

  const outputString = mappedCountries.reduce((accumulator, country) => {
    return (accumulator += `%{country: "${country.name}", location: "${country.capital}", long_lat: {${country.latlng[1]},${country.latlng[0]}}, flag_url: "${country.flag}"},\r\n`);
  }, "");

  console.log(outputString);
})();
