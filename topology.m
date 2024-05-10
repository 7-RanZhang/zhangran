clear,close all;
BorderLength=100;
NodeAmount=200;
BeaconAmount=30;
UNAmount=NodeAmount-BeaconAmount;
R=15;
Dall=zeros(NodeAmount,NodeAmount);%未知节点到信标节点距离初始矩阵；BeaconAmount行NodeAmount列
h=zeros(NodeAmount,NodeAmount);%初始跳数为0；BeaconAmount行NodeAmount列
X=zeros(3,UNAmount);%节点估计坐标初始矩阵

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~在正方形区域内产生均匀分布的随机拓扑~~~~~~~~~~~~~~~~~~~~
C=BorderLength.*rand(3,NodeAmount);
%带逻辑号的节点坐标
Sxy=[[1:NodeAmount];C];
Beacon=[Sxy(2,1:BeaconAmount);Sxy(3,1:BeaconAmount)];%信标节点坐标
UN=[Sxy(2,(BeaconAmount+1):NodeAmount);Sxy(3,(BeaconAmount+1):NodeAmount)];%未知节点坐标
%画出节点分布图
plot(Sxy(2,1:BeaconAmount),Sxy(3,1:BeaconAmount),'ro','MarkerFaceColor','r','MarkerSize',5,'LineWidth',1.5)
hold on
plot(Sxy(2,(BeaconAmount+1):NodeAmount),Sxy(3,(BeaconAmount+1):NodeAmount),'ksquare','MarkerFaceColor','k','MarkerSize',5,'LineWidth',1.5)
xlim([0,BorderLength]);
ylim([0,BorderLength]);
title('o 红色信标节点 o 黑色未知节点')

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~初始化节点间距离、跳数矩阵~~~~~~~~~~~~~~~~~~~~~~
for i=1:NodeAmount
    for j=1:NodeAmount
        Dall(i,j)=((Sxy(2,i)-Sxy(2,j))^2+(Sxy(3,i)-Sxy(3,j))^2)^0.5;%所有节点间相互距离
        if (Dall(i,j)<=R)&(Dall(i,j)>0)
            h(i,j)=1;%初始跳数矩阵
        elseif i==j
            h(i,j)=0;
        else h(i,j)=inf;
        end
    end
end
%~~~~~~~~~~~画拓扑图
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