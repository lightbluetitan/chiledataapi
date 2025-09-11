# License for `ChileDataAPI`

This package, `ChileDataAPI`, is licensed under the **GNU General Public License Version 3 (GPL-3)**.

You are free to:

- Use, modify, and distribute the package, as long as any modifications or derived works also comply with the GPL-3.
- Distribute copies of this package with attribution, keeping this license intact.

## License Text

The full text of the GNU General Public License Version 3 (GPL-3) can be found [here](https://www.gnu.org/licenses/gpl-3.0.txt).

## Note on FINDIC and REST Countries

The `ChileDataAPI` package depends on two public RESTful APIs for accessing Chilean and global data:

1. **FINDIC**
A public Chilean API that provides programmatic access to official financial and economic indicators of Chile.
It allows querying time series of various indicators such as the observed dollar exchange rate, inflation (CPI), interest rates, stock market values, and more.
The project's goal is to facilitate fast and reliable access to key economic data of the country, encouraging its use in financial analysis, academic research, and educational applications.
The API delivers up-to-date data directly from official sources such as the Central Bank of Chile and other relevant institutions.
Website: [https://findic.cl](https://findic.cl)
Terms of Use: The API is publicly accessible, does not require authentication, and is intended for educational, analytical, and experimental purposes.


2. **REST Countries API**  
   An open-source project that offers information about countries worldwide, including demographics, geography, and regional groupings.  
   This API is also publicly accessible and does not require authentication.  
   Website: [https://restcountries.com/](https://restcountries.com/)
   
   
3. **World Bank Open Data API**

The **World Bank Open Data API** is a RESTful web service that provides access to a vast collection of international development indicators. It allows for real-time retrieval of economic, social, and environmental data, including metrics such as GDP, population, education, and poverty levels.

This API is publicly accessible, requires **no authentication**, and returns results in either **JSON** or **XML** format. It supports filtering by country, indicator code, and year. It is widely used in data science, research, and educational contexts.

In the `MexicoDataAPI` package, the API is used to **dynamically retrieve and display real-time indicators for Mexico**. 
Data is accessed live via HTTP requests to the API and shown directly in the R console. **No data is stored or redistributed** by this package.

- **API documentation**: [https://datahelpdesk.worldbank.org/knowledgebase/articles/889392](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392)
- **License**: [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)   

As per the maintainers of both APIs, **no attribution is required** for using or distributing the data.  
However, we recommend reviewing the official documentation and usage terms on their respective websites to ensure proper understanding and responsible use.

4.- **API: Nager.Date**
- Website: [https://date.nager.at/Api](https://date.nager.at/Api)
- License: MIT License
- Notes: The API and its source code are licensed under the MIT License. No authentication is required for the public API.
Offline or commercial usage (e.g., via Docker or NuGet packages) may be subject to separate licensing, but this does not affect the MIT licensing of the open source API.


## Note

The `ChileDataAPI` package, including all its data files (.rda) and code files, is licensed under the GNU General Public License, version 3 or later (GPL-3).

## Copyright Notice

© 2025 Renzo Caceres Rossi. All rights reserved under the GPL-3.
