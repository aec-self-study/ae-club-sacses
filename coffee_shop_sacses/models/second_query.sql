{{ config(materialized='table') }}

with second_query as (

  select *
  from {{ ref('customers') }}

),
final as (

  select * from second_query
)
select
*
from final
