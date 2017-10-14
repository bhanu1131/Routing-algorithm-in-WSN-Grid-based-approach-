x=zeros(1000);            % x,y are points represents the position of the sensor node

y=zeros(1000);            % x,y are points represents the position of the sensor node

flag=zeros(1000,1);       % represents the sensor belong to which group

dist=zeros(1000,1000);     % represents the distance between any two nodes

ch=zeros(1000,1);         % selects the cluster heads among all the nodes

ch1=zeros(100,1);         % represents the cluster heads

dist1=zeros(100,1);       % represents the distance between center head and sink

match=zeros(1000,100);     % represents the nodes to which cluster head it should match

neig=zeros(1000,1);          % gives the number of neighbouring nodes for a perticular node

residual=zeros(1000);         % calculates the residual energy of each node

energy=zeros(100,1);          % calculate the residual energy of cluster head

join=zeros(100,100);           % represents the flag of cluster heads which have send the information from node i to node j

join1=zeros(100,1);             % represents the flag of cluster heads ehich have send the information

distance=zeros(100,100);        % represents the distance between center heads

for i=1:1000
x(i)=rand()*1000;
y(i)=rand()*1000;
residual(i)=2;          % assigning the postion of 1000 nodes at random
end
for i=1:1000
    plot(x(i),y(i),'o');        % plotting those points in the graph
hold on;                  
end
for i=1:1000                  %calculating distance among any two nodes
    for j=1:1000
        dist(i,j)=sqrt(power(((x(i)-x(j))),2)+power(((y(i)-y(j))),2));
    end  
end
for i=1:1000                  % dividing the nodes into various blocks of size 100*100 and assigining flag value
    a=floor(x(i)/100);
    b=floor(y(i)/100);
    flag(i,1)=a*10+b+1;
end
for i=1:1000                     %calculating the number of neigbouring nodes for each node in each block 62.5*100
    for j=1:1000
        if(flag(i,1)==flag(j,1))
                neig(i,1)=neig(i,1)+dist(i,j);
        end
    end
end
x1=500;
y1=500;                      % x1,y1 are sink co-ordinates
plot(x1,y1,'o');
hold on;
plot(x1,y1,'k*');
hold on;
for i=1:1000                  % connecting all nodes which are near to the sink to the sink and assigining flag value 0
    if((x(i)<=x1+100)&&(x(i)>=x1-100)&&(y(i)<=y1+100)&&(y(i)>=y1-100))
        flag(i,1)=0;
        plot([x(i) x1] ,[y(i) y1],'g');
        hold on;
    end
end

for i=1:100                      % finding the cluster heads by using formulae which is inversly proportional to no of neighbours
    min=999999999;
    for j=1:1000
        if((flag(j,1)==i)&&(min>=neig(j,1)))
            min=neig(j);
            p=j;
        end
    end
       plot(x(p),y(p),'r*');
       ch(p,1)=1;
       hold on;
end
p=1;
for i=1:1000                      %finding the position of cluster heads
    if(ch(i,1)==1)
        ch1(p,1)=i;
        p=p+1;
    end
end
for i=1:100  
    if(ch1(i,1))            % calculating the distance of cluster heads from sink
    dist1(i,1)=sqrt(power(((x(ch1(i,1))-x1)),2)+power(((y(ch1(i,1))-y1)),2));
    end
end
for i=1:100                      
    for j=1:1000
        if(ch1(i,1))
        if(flag(j,1)==flag(ch1(i,1),1))          % joining the remaining cluster nodes with their corresponding clusterheads
            plot([x(j) x(ch1(i,1))],[y(j) y(ch1(i,1))],'g');
            hold on;
        end
        end
    end
end
for i=1:100                 % joining near cluster heads  to sink
    if(ch1(i,1))
    dist1(i,1)=sqrt(power(((x(ch1(i,1))-x1)),2)+power(((y(ch1(i,1))-y1)),2));
    if(dist1(i,1)<200)
        join1(i,1)=1;
        plot([x1 x(ch1(i,1))],[y1 y(ch1(i,1))],'k');
    end    
    end
end
l=sum(ch);
for i=1:l                   %finding the distance of the cluster head among themselves
    for j=1:l
    if(ch1(i,1)&&ch1(j,1))
    distance(i,j)=sqrt(power(((x(ch1(i,1))-x(ch1(j,1)))),2)+power(((y(ch1(i,1))-y(ch1(j,1)))),2));
    end
    end
end
for i=1:l                    % joining the cluster head among themselves
    min=999999;
    p=i;
    for j=1:l
    if(((join1(i,1)==0)&&(join(j,i)==0)&&(ch1(i,1))&&(ch1(j,1)&&i~=j)))
        if((min>distance(i,j))&&(dist1(i,1)>dist1(j,1)))
            min=distance(i,j);
            p=j;
        end
    end
    end
    join(i,p)=1;
    if(ch1(i,1)&&ch1(p,1))
    plot([x(ch1(i,1)) x(ch1(p,1))],[y(ch1(i,1)) y(ch1(p,1))],'k');
    end
end