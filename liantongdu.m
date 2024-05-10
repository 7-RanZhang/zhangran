clc
clear
Boundary_length=100;       %边界长度
NodeAmount=100;            %节点总数
BeaconAmount=20;           %锚节点数
UNAmount=NodeAmount-BeaconAmount;      %未知节点数
c1=[1:NodeAmount;1:NodeAmount;1:NodeAmount];c3=[1:BeaconAmount];
c2=Boundary_length*ones(size(c3));
Sxy=Boundary_length*rand(size(c1));%所有节点的坐标
% Sxy(3,1:BeaconAmount)=c2;          %锚节点都在水面上所以Z坐标都为Boundary_length 
Sxy1=Sxy(:,1:BeaconAmount); %锚节点坐标
Sxy2=Sxy(:,BeaconAmount+1:NodeAmount);%未知节点坐标
R=30;    %通信半径
%qw=0.5;%相似度的值
%K=5;
%~~~~~~~~~~~~~~~~~~~注深度都知道~~~~~~~~~~
% function [error,Accuracy]=yuanDV_hop(NodeAmount,BeaconAmount,UNAmount,Sxy)
% % global R
Beacon=[Sxy(:,1:BeaconAmount)];%信标节点坐标
UN=[Sxy(:,(BeaconAmount+1):NodeAmount)];%未知节点坐标
figure(1)
plot3(Beacon(1,:),Beacon(2,:),Beacon(3,:),'bo','MarkerSize',5,'LineWidth',2);hold on
plot3(UN(1,:),UN(2,:),UN(3,:),'rsquare','markerfacecolor','red','MarkerSize',5,'LineWidth',2);
grid on
figure(2)
plot3(Beacon(1,:),Beacon(2,:),Beacon(3,:),'bo','MarkerSize',5,'LineWidth',2);hold on
plot3(UN(1,:),UN(2,:),UN(3,:),'rsquare','markerfacecolor','red','MarkerSize',5,'LineWidth',2);
grid on
for i=1:NodeAmount
    for j=1:NodeAmount
        Dall(i,j)=((Sxy(1,i)-Sxy(1,j))^2+(Sxy(2,i)-Sxy(2,j))^2+(Sxy(3,i)-Sxy(3,j))^2)^0.5;%所有节点间相互距离
        if (Dall(i,j)<=R)&(Dall(i,j)>0)
            h(i,j)=1;%初始跳数矩阵
            XX=[Sxy(1,i) Sxy(1,j)];YY=[Sxy(2,i) Sxy(2,j)];ZZ=[Sxy(3,i) Sxy(3,j)];            
%            plot3(XX,YY,ZZ,'--','linewidth',0.1,'color',[0.5,0.5,0.5]);hold on
             plot3(XX,YY,ZZ,'-.','linewidth',0.1,'color','g');hold on
        elseif i==j
            h(i,j)=0;
        else h(i,j)=inf;
        end
    end
end
legend('Anchor node','unknown node','Location','northwest');