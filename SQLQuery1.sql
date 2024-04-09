SELECT *
FROM portfolioproject..CovidDeaths
WHERE continent is not null
order by 3,4





SELECT location, date, total_cases, new_cases, total_deaths, population
FROM portfolioproject..CovidDeaths
order by 1,2

--Total cases vs Total Deaths

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM portfolioproject..CovidDeaths
WHERE location like '%india%'
order by 1,2

--total cases vs population
SELECT location, date, population,total_cases, (total_cases/population)*100 as CovidPercentage
FROM portfolioproject..CovidDeaths
WHERE location like '%india%'
order by 1,2


--Countries with highest infection compared to population
SELECT location, population,MAX(total_cases) AS highestinfectioncount, MAX((total_cases/population))*100 as InfectedpopulationPercentage
FROM portfolioproject..CovidDeaths
--WHERE location like '%india%'
group by location, population
order by InfectedpopulationPercentage desc


--Countries with highest death counts per population
SELECT location,MAX(cast(total_deaths as int)) AS TotalDeathacount
FROM portfolioproject..CovidDeaths
--WHERE location like '%india%'
WHERE continent is not null
group by location
order by TotalDeathacount desc

--WE'LL SEE EACH CONTINENTS



--Continents with highest death counts per population

SELECT continent, MAX(cast(total_deaths as int)) AS TotalDeathacount
FROM portfolioproject..CovidDeaths
--WHERE location like '%india%'
WHERE continent is not null
group by continent
order by TotalDeathacount desc

--GLOBAL Numbers
SELECT date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) astotal_deaths, SUM(cast(new_deaths as int))/SUM(cast(new_cases as int))*100 as Deathpercentage
FROM portfolioproject..CovidDeaths
WHERE continent is not null
group by date
order by 1,2


SELECT *
FROM portfolioproject..CovidDeaths dea
JOIN portfolioproject..CovidVaccinations vac
     On dea.location = vac.location
	 and dea.date = vac.date


--Total population vs Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM portfolioproject..CovidDeaths dea
JOIN portfolioproject..CovidVaccinations vac
     On dea.location = vac.location
	 and dea.date = vac.date