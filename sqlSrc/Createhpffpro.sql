use hpffpro
go
if exists (select 1 from sysobjects where name = 'systeminfo' and type = 'U')
    drop table hpffpro.dbo.systeminfo
create table hpffpro.dbo.systeminfo
(
    vc_company_name     varchar(32)     not null,       --公司简称
    vc_company_caption  varchar(32)     not null,       --公司全称
    l_lastinit_date     datetime        not null,       --前初始化时间
    l_init_date         datetime        not null        --初始化时间
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'dictionary' and type = 'U')
    drop table hpffpro.dbo.dictionary
create table hpffpro.dbo.dictionary
(
    l_key       int             not null,       --字典类别
    vc_value    varchar(8)      not null,       --词条类别
    vc_caption  varchar(32)     not null        --中文描述
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'operator' and type = 'U')
    drop table hpffpro.dbo.operator
create table hpffpro.dbo.operator
(
    l_op_code	    int             not null,       --操作员代码
    vc_op_name	    varchar(32)     not null,       --操作员姓名
    vc_op_passwd	varchar(32)     not null,       --操作员密码
    l_first_login	int             not null,       --是否首次登陆  1为首次登陆，非1为非首次登陆
    vc_op_full_name	varchar(36)     not null,       --操作员全称
    l_fail_logins	int             not null,       --失败登录次数
    vc_last_mac	    varchar(32)     not null,       --上次登录mac
    vc_last_ip	    varchar(32)     not null,       --上次登录ip
    l_last_date	    datetime        not null        --上次登录时间

)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'product' and type = 'U')
    drop table hpffpro.dbo.product		
create table hpffpro.dbo.product		
(
    vc_product_code	varchar(8)      not null,       --产品代码
    vc_product_name	varchar(32)     not null,       --产品名称
    l_op_code	    int             not null,       --操作员代码
    l_begin_time	datetime        not null,       --创建时间
    l_end_time	    datetime        not null,       --结束时间
    l_achieve	    int             not null        --是否实现  0为未实现，1为实现
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'project' and type = 'U')
    drop table hpffpro.dbo.project
create table hpffpro.dbo.project				
(
    vc_project_code	varchar(8)  not null,       --项目代码
    vc_project_name	varchar(32) not null,       --项目名称
    vc_product_code	varchar(8)  not null,       --产品代码
    l_op_code	    int         not null,       --操作员代码
    l_begin_time	datetime    not null,       --创建时间
    l_end_time      datetime    not null,       --结束时间
    l_achieve	    int         not null        --是否实现  0为未实现，1为实现

)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'expenses' and type = 'U')
    drop table hpffpro.dbo.expenses
create table hpffpro.dbo.expenses				
(
    l_serial_no	    int         not null,       --流水号
    vc_pay_name	    varchar(32) not null,       --开销名称
    l_pay_date	    datetime    not null,       --开销日期
    f_pay_amount	float       not null,       --开销金额
    vc_pay_kind	    varchar(8)  not null,       --开销类别
    l_op_code	    int         not null        --操作员代码
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'income' and type = 'U')
    drop table hpffpro.dbo.income
create table hpffpro.dbo.income				
(
    l_serial_no	    int         not null,       --流水号
    vc_income_name	varchar(32) not null,       --收入名称
    l_income_date	datetime    not null,       --收入日期
    f_income_amount	float       not null,       --收入金额
    vc_income_kind	varchar(8)  not null,       --收入类别
    l_op_code	    int         not null        --操作员代码
)
go 

use hpffpro
go
if exists (select 1 from sysobjects where name = 'finance_serial' and type = 'U')
    drop table hpffpro.dbo.finance_serial
create table hpffpro.dbo.finance_serial				
(
	l_serial_no	    int         not null,       --流水号
	vc_serial_kind	varchar(8)  not null,       --流水类型
	l_date	        int         not null,       --发生日期
	f_amount	    float       not null,       --发生金额
	vc_kind	        varchar(1)  not null,       --金额入/出  0为开销，1为收入
	l_op_code	    int         not null        --操作员代码
)
go 






