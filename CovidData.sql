
Select * 

From Project..CovidDeaths

Order by 3,4


Select * 

From Project..Covidvacciane

Order by 3,4

-- Select Data that I am going to be using 

select Location, date, total_cases, new_cases, total_deaths, population

From Project..CovidDeaths

order by 1,2


-- looking at Total cases vs Total Deaths


select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage

From Project..CovidDeaths

where location like '%states%'

order by 1,2


--looking at Total Cases vs Population
-- what percentage of population got Covid 6/21/2022 25.97% in united states 

select Location, date, population, total_cases, (total_cases/population)*100 as PopulationCovid

From Project..CovidDeaths

where location like '%states%'

order by 1,2

--looking at Total Cases vs Population in china


select Location, date, population, total_cases, (total_cases/population)*100 as PopulationCovid

From Project..CovidDeaths

where location like '%china%'

order by 1,2


--looking at countries with highest infection rate vs population

select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentpopulationInfected

From Project..CovidDeaths

--where location like '%china%'
Group by  Location, population

order by PercentpopulationInfected desc


--showing countries with higherst death count per population

select Location, MAX(Total_deaths) as TotalDeathCount

From Project..CovidDeaths

where continent is not null
--where location like '%china%'
Group by  Location

order by TotalDeathCount desc


-- looking at total population vs vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from project..CovidDeaths dea
join project..Covidvacciane vac
	on dea.location=vac.location
	and dea.date= vac.date

where dea.continent is not null

order by 2,3

 