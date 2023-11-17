use milktea_deliver
go

/*bisiness表触发器演示*/

delete from business where bno='2002'
select *from milktea where bno='2002'/*business表中商家被删除后，奶茶表的相关奶茶将全部下架*/
print char(13)+char(10)
/*deliver表触发器演示*/

insert deliver 
values('20010109','2','1009','2020-12-24 17:00','2020-12-24 17:50','4','2')/*由于配送员编号不存在，插入失败*/
print char(13)+char(10)

/*milktea表触发器演示*/

insert milktea
values('2001020','雷梦不知春','4','19','大杯')/*由于店铺不存在，插入失败*/
print char(13)+char(10)

/*ordering表触发器演示*/

insert ordering
values('20010201','10','20129','2020-12-24 7:30','支付宝',2,5,'已接单','常温','半糖')/*由于奶茶编号不存在，订单插入失败*/
print char(13)+char(10)

/*pickup表触发器演示*/

insert pickup
values('7230422010','2003','1005','2020-12-24 17:41')/*由于两次接单时间小于5分钟，无法接单*/
insert pickup
values('7234220102','2003','1007','2020-12-24 17:50')/*由于订单号不存在，插入失败*/
print char(13)+char(10)

/*买家查询订单信息*/

exec customer_ordering 'Lisa'/*买家姓名错误输入演示*/
exec customer_ordering 'Emma'/*买家姓名正确输入演示*/
print char(13)+char(10)

/*配送员查询订单信息*/
exec deliver_ordering '小张'/*配送员姓名正确输入演示*/
exec deliver_ordering  '小蔡'/*配送员姓名错误输入演示*/
print char(13)+char(10)

/*商家查询未完成订单信息*/
exec business_unfinished_ordering '俩点点'/*商家名称错误输入演示*/
exec business_unfinished_ordering '亿点点'/*商家名称正确输入演示*/
print char(13)+char(10)

/*商家查询所有订单信息*/
exec business_all_ordering '俩点点'/*商家名称错误输入演示*/
exec business_all_ordering '亿点点'/*商家名称正确输入演示*/
print char(13)+char(10)

/*买家查询奶茶销量、评分*/

exec od_sale '四季奶青'/*奶茶名称输入正确演示*/
exec od_sale '多肉葡萄'/*奶茶名称输入错误演示*/
print char(13)+char(10)

exec od_score '四季奶青'/*奶茶名称输入正确演示*/
exec od_score '多肉葡萄'/*奶茶名称输入错误演示*/
print char(13)+char(10)

/*买家通过配送表为配送员评分、打赏，为奶茶评分*/

exec dein_tip '7230422010','2.5'/*买家通过配送表为配送员打赏*/
print char(13)+char(10)
exec dein_score '7230422010','3'/* 买家为配送员评分*/
print char(13)+char(10)
exec doin_oco '1210121001','2'/*买家为奶茶评分*/
print char(13)+char(10)

/*配送员查询打赏情况*/
exec dese_tip '1210121001'/*配送员获得打赏*/
print char(13)+char(10)
exec dese_tip '6230422002'/*配送员未获得打赏*/
print char(13)+char(10)