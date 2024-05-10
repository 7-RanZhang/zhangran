clear,close all;
BorderLength=100;
NodeAmount=200;
BeaconAmount=30;
UNAmount=NodeAmount-BeaconAmount;
R=15;
Dall=zeros(NodeAmount,NodeAmount);%δ֪�ڵ㵽�ű�ڵ�����ʼ����BeaconAmount��NodeAmount��
h=zeros(NodeAmount,NodeAmount);%��ʼ����Ϊ0��BeaconAmount��NodeAmount��
X=zeros(3,UNAmount);%�ڵ���������ʼ����

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~�������������ڲ������ȷֲ����������~~~~~~~~~~~~~~~~~~~~
C=BorderLength.*rand(3,NodeAmount);
%���߼��ŵĽڵ�����
Sxy=[[1:NodeAmount];C];
Beacon=[Sxy(2,1:BeaconAmount);Sxy(3,1:BeaconAmount)];%�ű�ڵ�����
UN=[Sxy(2,(BeaconAmount+1):NodeAmount);Sxy(3,(BeaconAmount+1):NodeAmount)];%δ֪�ڵ�����
%�����ڵ�ֲ�ͼ
plot(Sxy(2,1:BeaconAmount),Sxy(3,1:BeaconAmount),'ro','MarkerFaceColor','r','MarkerSize',5,'LineWidth',1.5)
hold on
plot(Sxy(2,(BeaconAmount+1):NodeAmount),Sxy(3,(BeaconAmount+1):NodeAmount),'ksquare','MarkerFaceColor','k','MarkerSize',5,'LineWidth',1.5)
xlim([0,BorderLength]);
ylim([0,BorderLength]);
title('o ��ɫ�ű�ڵ� o ��ɫδ֪�ڵ�')

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~��ʼ���ڵ����롢��������~~~~~~~~~~~~~~~~~~~~~~
for i=1:NodeAmount
    for j=1:NodeAmount
        Dall(i,j)=((Sxy(2,i)-Sxy(2,j))^2+(Sxy(3,i)-Sxy(3,j))^2)^0.5;%���нڵ���໥����
        if (Dall(i,j)<=R)&(Dall(i,j)>0)
            h(i,j)=1;%��ʼ��������
        elseif i==j
            h(i,j)=0;
        else h(i,j)=inf;
        end
    end
end
%~~~~~~~~~~~������ͼ
figure(3);
plot(Sxy(2,:),Sxy(3,:),'ko','MarkerFaceColor','k','MarkerSize',4.5)
plot(Sxy(2,1:BeaconAmount),Sxy(3,1:BeaconAmount),'ro','MarkerFaceColor','r','MarkerSize',4.5)
hold on
plot(Sxy(2,(BeaconAmount+1):NodeAmount),Sxy(3,(BeaconAmount+1):NodeAmount),'ksquare','MarkerFaceColor','k','MarkerSize',4.5)
hold on
xlim([0,BorderLength]);
ylim([0,BorderLength]);
% title('CDv-Hop')
for i=1:NodeAmount
    for j=1:NodeAmount
        if (Dall(i,j)<=R)
            line([Sxy(2,i) Sxy(2,j)],[Sxy(3,i) Sxy(3,j)],'linewidth',0.1,'color',[0.5,0.5,0.5]);
        end
    end
end