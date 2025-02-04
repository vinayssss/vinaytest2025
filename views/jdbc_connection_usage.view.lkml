view: jdbc_connection_usage {
  sql_table_name: demo_db.jdbc_connection_usage ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: build_name {
    type: string
    sql: ${TABLE}.build_name ;;
  }
  dimension: call_site {
    type: string
    sql: ${TABLE}.call_site ;;
  }
  dimension: method_name {
    type: string
    sql: ${TABLE}.method_name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, build_name, method_name]
  }
}
