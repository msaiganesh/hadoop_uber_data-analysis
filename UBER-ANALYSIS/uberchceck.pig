
uber_data_set = load '/user/UBER/uber' using PigStorage(',') as ( dispatching_no : chararray,data_value :chararray ,no_of_active :int ,no_of_trips :int );

dump uber_data_set

inter_uber_data = group  uber_data_set by dispatching_no;
 
dump inter_uber_data

grouped_data_set = foreach inter_uber_data generate group,SUM(uber_data_set.no_of_trips);

dump grouped_data_set

ordered_data_set = order grouped_data_set by $1 desc;

dump ordered_data_set

limited_data_set = limit by 2

dump limited_data_set

store limited_data_set into '/user/UBER/port'using PigStorage(',');
