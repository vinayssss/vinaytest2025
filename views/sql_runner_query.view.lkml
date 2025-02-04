
view: sql_runner_query {
  derived_table: {
    sql: SELECT
          (DATE(CONVERT_TZ(`orders`.`created_at`,'UTC','America/New_York'))) AS `orders.created_date`,
          `orders`.`id` AS `orders.id`,
          `orders`.`status` AS `orders.status`,
          COUNT(DISTINCT orders.id ) AS `orders.count`
      FROM
          `demo_db`.`order_items` AS `order_items`
          LEFT JOIN `demo_db`.`orders` AS `orders` ON `order_items`.`order_id` = `orders`.`id`
      GROUP BY
          1,
          2,
          3
      ORDER BY
          1 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_created_date {
    type: date
    sql: ${TABLE}.`orders.created_date` ;;
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.`orders.id` ;;
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [
        orders_created_date,
	orders_id,
	orders_status,
	orders_count
    ]
  }
}
