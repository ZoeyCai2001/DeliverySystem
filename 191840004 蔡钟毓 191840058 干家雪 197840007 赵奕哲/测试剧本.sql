use milktea_deliver
go

/*bisiness��������ʾ*/

delete from business where bno='2002'
select *from milktea where bno='2002'/*business�����̼ұ�ɾ�����̲�������̲轫ȫ���¼�*/
print char(13)+char(10)
/*deliver��������ʾ*/

insert deliver 
values('20010109','2','1009','2020-12-24 17:00','2020-12-24 17:50','4','2')/*��������Ա��Ų����ڣ�����ʧ��*/
print char(13)+char(10)

/*milktea��������ʾ*/

insert milktea
values('2001020','���β�֪��','4','19','��')/*���ڵ��̲����ڣ�����ʧ��*/
print char(13)+char(10)

/*ordering��������ʾ*/

insert ordering
values('20010201','10','20129','2020-12-24 7:30','֧����',2,5,'�ѽӵ�','����','����')/*�����̲��Ų����ڣ���������ʧ��*/
print char(13)+char(10)

/*pickup��������ʾ*/

insert pickup
values('7230422010','2003','1005','2020-12-24 17:41')/*�������νӵ�ʱ��С��5���ӣ��޷��ӵ�*/
insert pickup
values('7234220102','2003','1007','2020-12-24 17:50')/*���ڶ����Ų����ڣ�����ʧ��*/
print char(13)+char(10)

/*��Ҳ�ѯ������Ϣ*/

exec customer_ordering 'Lisa'/*�����������������ʾ*/
exec customer_ordering 'Emma'/*���������ȷ������ʾ*/
print char(13)+char(10)

/*����Ա��ѯ������Ϣ*/
exec deliver_ordering 'С��'/*����Ա������ȷ������ʾ*/
exec deliver_ordering  'С��'/*����Ա��������������ʾ*/
print char(13)+char(10)

/*�̼Ҳ�ѯδ��ɶ�����Ϣ*/
exec business_unfinished_ordering '�����'/*�̼����ƴ���������ʾ*/
exec business_unfinished_ordering '�ڵ��'/*�̼�������ȷ������ʾ*/
print char(13)+char(10)

/*�̼Ҳ�ѯ���ж�����Ϣ*/
exec business_all_ordering '�����'/*�̼����ƴ���������ʾ*/
exec business_all_ordering '�ڵ��'/*�̼�������ȷ������ʾ*/
print char(13)+char(10)

/*��Ҳ�ѯ�̲�����������*/

exec od_sale '�ļ�����'/*�̲�����������ȷ��ʾ*/
exec od_sale '��������'/*�̲��������������ʾ*/
print char(13)+char(10)

exec od_score '�ļ�����'/*�̲�����������ȷ��ʾ*/
exec od_score '��������'/*�̲��������������ʾ*/
print char(13)+char(10)

/*���ͨ�����ͱ�Ϊ����Ա���֡����ͣ�Ϊ�̲�����*/

exec dein_tip '7230422010','2.5'/*���ͨ�����ͱ�Ϊ����Ա����*/
print char(13)+char(10)
exec dein_score '7230422010','3'/* ���Ϊ����Ա����*/
print char(13)+char(10)
exec doin_oco '1210121001','2'/*���Ϊ�̲�����*/
print char(13)+char(10)

/*����Ա��ѯ�������*/
exec dese_tip '1210121001'/*����Ա��ô���*/
print char(13)+char(10)
exec dese_tip '6230422002'/*����Աδ��ô���*/
print char(13)+char(10)