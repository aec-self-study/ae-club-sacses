with customer_first_order as (

  select
    customer_id,
    min(created_at) as first_order_at,
    count(id) as number_of_orders
  from `analytics-engineers-club.coffee_shop.orders`
  group by 1

),
final as (

  select
    customers.id,
    customers.name,
    customers.email,
    customer_first_order.first_order_at,
    customer_first_order.number_of_orders
  from `analytics-engineers-club.coffee_shop.customers` customers
  left join customer_first_order
    on customers.id = customer_first_order.customer_id
  order by first_order_at

)
select
*
from final
limit 5;
