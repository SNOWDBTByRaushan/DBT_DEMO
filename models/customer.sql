{{ config(materialized='table') }}

with customer as (
  select * from {{ source('demo', 'customers') }}
)
select * from customer

