use hpffpro
go
if exists (select 1 from sysobjects where name = 'systeminfo' and type = 'U')
    drop table hpffpro.dbo.systeminfo
create table hpffpro.dbo.systeminfo
(
    vc_company_name     varchar(32)     not null,       --��˾���
    vc_company_caption  varchar(32)     not null,       --��˾ȫ��
    l_lastinit_date     datetime        not null,       --ǰ��ʼ��ʱ��
    l_init_date         datetime        not null        --��ʼ��ʱ��
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'dictionary' and type = 'U')
    drop table hpffpro.dbo.dictionary
create table hpffpro.dbo.dictionary
(
    l_key       int             not null,       --�ֵ����
    vc_value    varchar(8)      not null,       --�������
    vc_caption  varchar(32)     not null        --��������
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'operator' and type = 'U')
    drop table hpffpro.dbo.operator
create table hpffpro.dbo.operator
(
    l_op_code	    int             not null,       --����Ա����
    vc_op_name	    varchar(32)     not null,       --����Ա����
    vc_op_passwd	varchar(32)     not null,       --����Ա����
    l_first_login	int             not null,       --�Ƿ��״ε�½  1Ϊ�״ε�½����1Ϊ���״ε�½
    vc_op_full_name	varchar(36)     not null,       --����Աȫ��
    l_fail_logins	int             not null,       --ʧ�ܵ�¼����
    vc_last_mac	    varchar(32)     not null,       --�ϴε�¼mac
    vc_last_ip	    varchar(32)     not null,       --�ϴε�¼ip
    l_last_date	    datetime        not null        --�ϴε�¼ʱ��

)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'product' and type = 'U')
    drop table hpffpro.dbo.product		
create table hpffpro.dbo.product		
(
    vc_product_code	varchar(8)      not null,       --��Ʒ����
    vc_product_name	varchar(32)     not null,       --��Ʒ����
    l_op_code	    int             not null,       --����Ա����
    l_begin_time	datetime        not null,       --����ʱ��
    l_end_time	    datetime        not null,       --����ʱ��
    l_achieve	    int             not null        --�Ƿ�ʵ��  0Ϊδʵ�֣�1Ϊʵ��
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'project' and type = 'U')
    drop table hpffpro.dbo.project
create table hpffpro.dbo.project				
(
    vc_project_code	varchar(8)  not null,       --��Ŀ����
    vc_project_name	varchar(32) not null,       --��Ŀ����
    vc_product_code	varchar(8)  not null,       --��Ʒ����
    l_op_code	    int         not null,       --����Ա����
    l_begin_time	datetime    not null,       --����ʱ��
    l_end_time      datetime    not null,       --����ʱ��
    l_achieve	    int         not null        --�Ƿ�ʵ��  0Ϊδʵ�֣�1Ϊʵ��

)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'expenses' and type = 'U')
    drop table hpffpro.dbo.expenses
create table hpffpro.dbo.expenses				
(
    l_serial_no	    int         not null,       --��ˮ��
    vc_pay_name	    varchar(32) not null,       --��������
    l_pay_date	    datetime    not null,       --��������
    f_pay_amount	float       not null,       --�������
    vc_pay_kind	    varchar(8)  not null,       --�������
    l_op_code	    int         not null        --����Ա����
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'income' and type = 'U')
    drop table hpffpro.dbo.income
create table hpffpro.dbo.income				
(
    l_serial_no	    int         not null,       --��ˮ��
    vc_income_name	varchar(32) not null,       --��������
    l_income_date	datetime    not null,       --��������
    f_income_amount	float       not null,       --������
    vc_income_kind	varchar(8)  not null,       --�������
    l_op_code	    int         not null        --����Ա����
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'finance_serial' and type = 'U')
    drop table hpffpro.dbo.finance_serial
create table hpffpro.dbo.finance_serial				
(
	l_serial_no	    int         not null,       --��ˮ��
	vc_serial_kind	varchar(8)  not null,       --��ˮ����
	l_date	        int         not null,       --��������
	f_amount	    float       not null,       --�������
	vc_kind	        varchar(1)  not null,       --�����/��  0Ϊ������1Ϊ����
	l_op_code	    int         not null        --����Ա����
)
go 






