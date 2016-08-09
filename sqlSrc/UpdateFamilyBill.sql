set nocount on
go
use hpffpro
go
print 'create procedure pd_update_expenses'
go
if exists (select 1 from mysql.proc where db = 'hpffpro' and 'type' = 'PROCEDURE' and name = 'pd_update_expenses')
    drop procedure pd_update_expenses
go

create procedure pd_update_expenses
    @l_op_code      int,                --����Ա����
    @vc_ip          varchar(32),        --��¼�豸ip
    @vc_mac         varchar(32),        --��¼�豸mac
    @vc_kind        varchar(8000),      --��Ŀ����
    @vc_fields      varchar(8000),      --��Ŀ������
    @vc_value       varchar(8000)       --��Ŀ�����
    
set nocount on
set session transaction isolation level read uncommitted;

    select
    @l_op_code      = isnull(@l_op_code, 0),
    @vc_ip          = isnull(@vc_ip, ''),
    @vc_mac         = isnull(@vc_mac, ''),
    @vc_kind        = isnull(@vc_kind, ''),
    @vc_fields      = isnull(@vc_fields, ''),
    @vc_value       = isnull(@vc_value, '')
    
    /*
    declare 
    @vc_fields_temp    varchar(32),
    @vc_value_temp     varchar(32)
    
    select
    @vc_fields_temp = '',
    @vc_value_temp  = ''
    */
    if(len(vc_fields) > 0)
    begin 
        --������ʱ��
        drop table if exists temp_update_bill
        create temporary table temp_update_bill
            (
                bill_kind       varchar(8),
                bill_field      varchar(32),
                bill_amount     varchar(32)
            )

        while(len(vc_value) > 0)
        begin 
            insert into temp_update_bill
            values(
                left(@vc_kind, charindex('|', @vc_kind) - 1),
                left(@vc_fields, charindex('|', @vc_fields) - 1),
                left(@vc_value, charindex('|', @vc_value) - 1)
                )
            select
                @vc_kind   = substring(@vc_kind, charindex('|', @vc_kind) + 1, 8000),
                @vc_fields = substring(@vc_fields, charindex('|', @vc_fields) + 1, 8000),
                @vc_value  = substring(@vc_value, charindex('|', @vc_value) + 1, 8000)
        end
        
        /*      ����|ƻ��|�㽶|        1|10|2|
            ����  1
            ƻ��  10
            �㽶  2
        */
        
    end

    insert into hpffpro..expenses(
        vc_pay_kind,    vc_pay_name,    f_pay_amount,   l_op_code)
    select
        a.bill_kind,    a.bill_field,   a.bill_amount,  @l_op_code  
    from temp_update_bill a
    
    drop table temp_update_bill
    
return 0
go



    
