
--Cleaning Data
SELECT location ,date ,total_cases ,new_cases,total_deaths ,population
  FROM [SaharLand].[dbo].[CovidDeaths];

-- total cases VS death cases
SELECT location ,date ,total_cases ,total_deaths , (total_deaths/total_cases)*100 as DeathsPrecentage 
  FROM [SaharLand].[dbo].[CovidDeaths]
  where total_deaths is not null and location = 'Israel'
  order by 5;

  --Total cases VS Population 
  SELECT location ,date ,total_cases ,population, (total_cases/population)*100 as InfectedePrecentage
  FROM [SaharLand].[dbo].[CovidDeaths]
  where population is not null;


  --Hightest Infection Rate
  SELECT location ,max(total_cases) ,population,max((total_cases)/population)*100 as InfectedePrecentage
  FROM [SaharLand].[dbo].[CovidDeaths]
  group by location,population;

  --showing Countries with the highest deathes count 
  SELECT location ,max(cast(total_deaths as int))as max_total_deaths,max((total_deaths)/population)*100 as InfectedePrecentage
  FROM [SaharLand].[dbo].[CovidDeaths]
  --where location = 'Israel'
  where continent  is not null
  group by location,population
  order by max_total_deaths desc;


  --RATE BY Continent
  SELECT location ,max(cast(total_deaths as int))as max_total_deaths
  FROM [SaharLand].[dbo].[CovidDeaths]
  where continent  is null
  group by location
  order by max_total_deaths desc;


  --Global Numbers Per date 
SELECT
    date,
    SUM(new_cases) AS total_new_cases,
    SUM(CAST(new_deaths AS INT)) AS total_new_deaths,
    CASE
        WHEN SUM(new_cases) = 0 THEN 0  -- Avoid division by zero
        ELSE SUM(CAST(new_deaths AS INT))/ SUM(new_cases) * 100.0 
    END AS DeathsPercentage
FROM[SaharLand].[dbo].[CovidDeaths]
WHERE continent IS NULL
GROUP BY date
ORDER BY date;



--Joins
select *
FROM[SaharLand].[dbo].[CovidDeaths] as DEA
 join [SaharLand].[dbo].[CovidVaccinations] as VAC
 on  DEA.location = vac.location
 and DEA.date = vac.date


 -- Total Pop VS Vac
 select dea.continent  ,dea.location , dea.date , dea.population , vac.new_vaccinations,
 sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location,dea.date) as RollingCount 
FROM[SaharLand].[dbo].[CovidDeaths] as DEA
 join [SaharLand].[dbo].[CovidVaccinations] as VAC
 on  DEA.location = vac.location
 and DEA.date = vac.date
 where DEA.continent is not null
 order by 2,3 


-- CTE 
with PopvsVac(continent  ,location , date , population , new_vaccinations,RollingCount )
as(
 select dea.continent  ,dea.location , dea.date , dea.population , vac.new_vaccinations,
 sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location,dea.date) as RollingCount 
FROM[SaharLand].[dbo].[CovidDeaths] as DEA
 join [SaharLand].[dbo].[CovidVaccinations] as VAC
 on  DEA.location = vac.location
 and DEA.date = vac.date
 where DEA.continent is not null
 )
 select * ,(RollingCount/population)*100
 from popvsvac