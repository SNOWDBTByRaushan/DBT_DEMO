{% macro get_season(x)%}
CASE
    WHEN MONTH(TRY_TO_TIMESTAMP({{x}})) IN (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TRY_TO_TIMESTAMP({{x}})) IN (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TRY_TO_TIMESTAMP({{x}})) IN (6,7,8) 
    THEN 'SUMMER'
    ELSE 'AUTUMN'
END 
{% endmacro%}

{%macro day_type(x)%}
CASE
    WHEN DAYNAME(TRY_TO_TIMESTAMP({{x}})) IN ('Sat','Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END 
{%endmacro%}