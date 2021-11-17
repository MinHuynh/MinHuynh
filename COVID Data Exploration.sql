-- Explore real-life COVID database: https://ourworldindata.org/covid-deaths. 
-- Data visualization through Tableau: https://public.tableau.com/app/profile/minh.huynh7801/viz/COVIDDataVisualization_16371118603130/Dashboard1 
-- TRY - FAIL - SUCCESS :)

-- Covid Deaths
SELECT TOP 10 * 
FROM PortfolioProject..CovidDeaths

-- Total Cases vs Total Deaths - Likelihood of death when contracting Covid 
SELECT location, date, total_cases, total_deaths, population , ROUND((total_deaths/total_cases) * 100,2) as DeathPercentage
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%Vietnam%'
WHERE continent IS NOT NULL
ORDER BY date;

---- Total Cases vs Population - Shows what pecentage population got Covid
SELECT location, date, total_cases, total_deaths, population , ROUND((total_cases/population) * 100,3) as CasePercentage
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%Vietnam%'
WHERE continent IS NOT NULL
ORDER BY CasePercentage DESC

-- Country's Highest Case per Population Percentage
SELECT location, population, MAX(total_cases) AS HighestCaseCount, ROUND(MAX(total_cases/population)*100,2) AS HighestCasePercentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY Location, Population
ORDER BY HighestCasePercentage DESC

-- Country's Highest Death per Population Percentage
SELECT location, MAX(CAST(total_deaths AS INT)) AS HighestDeathCount, ROUND(MAX(CAST(total_deaths AS INT)/population)*100,3) AS HighestDeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY HighestDeathPercentage DESC

-- Continent's Highest Case and Death Count
SELECT continent, MAX(total_cases) AS HighestCaseCount, MAX(CAST(total_deaths AS INT)) AS HighestDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL OR location LIKE '%America%' OR location LIKE '%Asia%' OR location LIKE '%Africa%' OR location LIKE '%Oceania%'
OR location LIKE '%Europe%'
GROUP BY continent
ORDER BY HighestCaseCount DESC, HighestDeathCount DESC

-- GLOBAL NUMBERS per Date and the Death Percentage Per Cases count accross the World
SELECT date, SUM(new_cases) AS TotalCases, SUM(CAST(new_deaths AS INT)) AS TotalDeaths, 
ROUND((SUM(CAST(new_deaths AS INT))/SUM(new_cases)) *100,2) AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date

-- Covid Vaccinations
SELECT * FROM PortfolioProject..CovidVaccinations 

-- Total Population vs Total New Vaccinations per Date
SELECT dea.continent, dea.location, dea.population, dea.date, vac.new_vaccinations,
SUM(CONVERT(BIGINT, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date, dea.location) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea JOIN
PortfolioProject..CovidVaccinations vac 
	ON dea.location = vac.location 
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL AND vac.new_vaccinations IS NOT NULL
ORDER BY 1,2

-- CTE: Total Vaccinated vs Population
WITH PopvsVac (continent, location, population, date, new_vaccinations, RollingPeopleVaccinated) AS
(
	SELECT dea.continent, dea.location, dea.population, dea.date, vac.new_vaccinations,
SUM(CONVERT(BIGINT, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date, dea.location) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea JOIN
PortfolioProject..CovidVaccinations vac 
	ON dea.location = vac.location 
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL AND vac.new_vaccinations IS NOT NULL
)
	
SELECT *, ROUND((RollingPeopleVaccinated/Population) * 100,4) AS PercentPopulationVaccinated 
FROM PopvsVac

-- TEMP TABLE
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
	continent VARCHAR(255),
	location VARCHAR(255),
	date DATETIME,
	population NUMERIC,
	new_vaccinations NUMERIC,
	RollingPeopleVaccinated INT
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.population, dea.date, vac.new_vaccinations,
SUM(CONVERT(BIGINT, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date, dea.location) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea JOIN
PortfolioProject..CovidVaccinations vac 
	ON dea.location = vac.location 
	AND dea.date = vac.date
--WHERE dea.continent IS NOT NULL 

SELECT *, ROUND((RollingPeopleVaccinated/Population) * 100,4) AS PercentPopulationVaccinated 
FROM #PercentPopulationVaccinated

--VIEWS
--GLOBAL NUMBERS

CREATE VIEW GlobalNumbers AS 
SELECT date, SUM(new_cases) AS TotalCases, SUM(CAST(new_deaths AS INT)) AS TotalDeaths, 
ROUND((SUM(CAST(new_deaths AS INT))/SUM(new_cases)) *100,2) AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date

--CONTINENT NUMBERS 
CREATE VIEW ContinentNumbers AS
SELECT continent, MAX(total_cases) AS HighestCaseCount, MAX(CAST(total_deaths AS INT)) AS HighestDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL 
GROUP BY continent

--ROLLING PEOPLE VACCINATED 
CREATE VIEW RollingPeopleVaccinated AS
SELECT dea.continent, dea.location, dea.population, dea.date, vac.new_vaccinations,
SUM(CONVERT(BIGINT, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.date, dea.location) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea JOIN
PortfolioProject..CovidVaccinations vac 
	ON dea.location = vac.location 
	AND dea.date = vac.date

SELECT * FROM ContinentNumbers
SELECT * FROM GlobalNumbers
SELECT * FROM RollingPeopleVaccinated WHERE location Like '%Africa%'
