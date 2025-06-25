rails g scaffold Command \
Device:belongs_to \
trigger_time:datetime \
command:string \
type:string \
result:string