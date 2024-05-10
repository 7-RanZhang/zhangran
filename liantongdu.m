clc
clear
Boundary_length=100;       %�߽糤��
NodeAmount=100;            %�ڵ�����
BeaconAmount=20;           %ê�ڵ���
UNAmount=NodeAmount-BeaconAmount;      %δ֪�ڵ���
c1=[1:NodeAmount;1:NodeAmount;1:NodeAmount];c3=[1:BeaconAmount];
c2=Boundary_length*ones(size(c3));
Sxy=Boundary_length*rand(size(c1));%���нڵ������
% Sxy(3,1:BeaconAmount)=c2;          %ê�ڵ㶼��ˮ��������Z���궼ΪBoundary_length 
Sxy1=Sxy(:,1:BeaconAmount); %ê�ڵ�����
Sxy2=Sxy(:,BeaconAmount+1:NodeAmount);%δ֪�ڵ�����
R=30;    %ͨ�Ű뾶
%qw=0.5;%���ƶȵ�ֵ
%K=5;
%~~~~~~~~~~~~~~~~~~~ע��ȶ�֪��~~~~~~~~~~
% function [error,Accuracy]=yuanDV_hop(NodeAmount,BeaconAmount,UNAmount,Sxy)
% % global R
Beacon=[Sxy(:,1:BeaconAmount)];%�ű�ڵ�����
UN=[Sxy(:,(BeaconAmount+1):NodeAmount)];%δ֪�ڵ�����
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
        Dall(i,j)=((Sxy(1,i)-Sxy(1,j))^2+(Sxy(2,i)-Sxy(2,j))^2+(Sxy(3,i)-Sxy(3,j))^2)^0.5;%���нڵ���໥����
        if (Dall(i,j)<=R)&(Dall(i,j)>0)
            h(i,j)=1;%��ʼ��������
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