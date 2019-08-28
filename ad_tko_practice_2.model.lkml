connection: "flightstats"

include: "*.view.lkml"         # include all views in this project
# include: "*.dashboard.lookml"  # include all dashboards in this project

explore: ontime {
  sql_always_where: ${dep_year} >= '2000' ;;
  join: airports_origin {
    from: airports
    type: left_outer
    relationship: many_to_one
    sql_on: ${ontime.origin} = ${airports_origin.code};;
  }
  join: airports_destination {
    from: airports
    type: left_outer
    relationship: many_to_one
    sql_on: ${ontime.destination} = ${airports_destination.code};;
  }
}
