set nocount on
go
use hpffpro
go
print 'create procedure pd_search_expenses'
go
if exists (select 1 from mysql.proc where db = 'hpffpro' and 'type' = 'PROCEDURE' and name = 'pd_search_expenses')
    drop procedure pd_update_expenses
go

create procedure pd_search_expenses
    @l_op_code      int,
    @vc_op_name     varchar(32),
    @vc_kind        varchar(8),      --项目类型
    @vc_fields      varchar(255),      --项目名称流
    @n_min_value    numeric,      --金额
    @n_max_value    numeric,
    @l_begin_time   int,
    @l_end_time     int
    
set nocount on
set session transaction isolation level read uncommitted;

    select
    @l_op_code      = isnull(@l_op_code, 0),
    @vc_op_name     = isnull(@vc_op_name, ''),
    @vc_kind        = isnull(@vc_kind,  ''),
    @vc_fields      = isnull(@vc_fields, ''),
    @n_min_value    = isnull(@n_min_value, 0),
    @n_max_value    = isnull(@n_max_value, 0),
    @l_begin_time   = isnull(@l_begin_time, 0),
    @l_end_time     = isnull(@l_end_time, 0)
    
    if (@l_op_code = 0 or )
    