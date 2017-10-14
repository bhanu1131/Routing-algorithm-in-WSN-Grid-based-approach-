x=zeros(1000);
y=zeros(1000);            % x,y are points represents the position of the sensor node

flag=zeros(1000,1);       % represents the sensor belong to which group

dist=zeros(1000,1000);     % represents the distance between any two nodes

ch=zeros(1000,1);         % selects the cluster heads among all the nodes

ch1=zeros(32,1);         % represents the cluster heads

dist1=zeros(32,1);       % represents the distance between center head and clusterheads

match=zeros(1000,32);     % represents the nodes to which cluster head it should match

neig=zeros(1000,1);          % gives the number of neighbouring nodes for a perticular node

residual=zeros(1000);         % calculates the residual energy of each node

energy=zeros(32,1);          % calculate the residual energy of cluster head

join=zeros(32,32);  % represents the flag of cluster heads ehich have send the information

join1=zeros(32,1);
distance=zeros(32,32);
for i=1:1000
x(i)=rand()*1000;
y(i)=rand()*1000;
residual(i)=2;          % assigning the postion of 1000 nodes at random
end
for i=1:1000
    plot(x(i),y(i),'o');
hold on;                  % plotting those points in the graph
end
for i=1:1000                  %calculating distance among any two nodes
    for j=1:1000
        dist(i,j)=sqrt(power(((x(i)-x(j))),2)+power(((y(i)-y(j))),2));
    end  
end
for i=1:1000                  % dividing the nodes into various blocks of size 125*250 and assigining flag value
    if((floor(x(i)/125)==0)&&(floor(y(i)/250)==0))
        flag(i,1)=1;
    end
    if((floor(x(i)/125)==0)&&(floor(y(i)/250)==1))
        flag(i,1)=2;
    end
    if((floor(x(i)/125)==0)&&(floor(y(i)/250)==2))
        flag(i,1)=3;
    end
    if((floor(x(i)/125)==0)&&(floor(y(i)/250)==3))
        flag(i,1)=4;
    end
    if((floor(x(i)/125)==1)&&(floor(y(i)/250)==0))
        flag(i,1)=5;
    end
    if((floor(x(i)/125)==1)&&(floor(y(i)/250)==1))
        flag(i,1)=6;
    end
    if((floor(x(i)/125)==1)&&(floor(y(i)/250)==2))
        flag(i,1)=7;
    end
    if((floor(x(i)/125)==1)&&(floor(y(i)/250)==3))
        flag(i,1)=8;
    end
    if((floor(x(i)/125)==2)&&(floor(y(i)/250)==0))
        flag(i,1)=9;
    end
    if((floor(x(i)/125)==2)&&(floor(y(i)/250)==1))
        flag(i,1)=10;
    end
    if((floor(x(i)/125)==2)&&(floor(y(i)/250)==2))
        flag(i,1)=11;
    end
    if((floor(x(i)/125)==2)&&(floor(y(i)/250)==3))
        flag(i,1)=12;
    end
    if((floor(x(i)/125)==3)&&(floor(y(i)/250)==0))
        flag(i,1)=13;
    end
    if((floor(x(i)/125)==3)&&(floor(y(i)/250)==1))
        flag(i,1)=14;
    end
    if((floor(x(i)/125)==3)&&(floor(y(i)/250)==2))
        flag(i,1)=15;
    end
    if((floor(x(i)/125)==3)&&(floor(y(i)/250)==3))
        flag(i,1)=16;
    end
    if((floor(x(i)/125)==4)&&(floor(y(i)/250)==0))
        flag(i,1)=17;
    end
    if((floor(x(i)/125)==4)&&(floor(y(i)/250)==1))
        flag(i,1)=18;
    end
    if((floor(x(i)/125)==4)&&(floor(y(i)/250)==2))
        flag(i,1)=19;
    end
    if((floor(x(i)/125)==4)&&(floor(y(i)/250)==3))
        flag(i,1)=20;
    end
    if((floor(x(i)/125)==5)&&(floor(y(i)/250)==0))
        flag(i,1)=21;
    end
    if((floor(x(i)/125)==5)&&(floor(y(i)/250)==1))
        flag(i,1)=22;
    end
    if((floor(x(i)/125)==5)&&(floor(y(i)/250)==2))
        flag(i,1)=23;
    end
    if((floor(x(i)/125)==5)&&(floor(y(i)/250)==3))
        flag(i,1)=24;
    end
    if((floor(x(i)/125)==6)&&(floor(y(i)/250)==0))
        flag(i,1)=25;
    end
    if((floor(x(i)/125)==6)&&(floor(y(i)/250)==1))
        flag(i,1)=26;
    end
    if((floor(x(i)/125)==6)&&(floor(y(i)/250)==2))
        flag(i,1)=27;
    end
    if((floor(x(i)/125)==6)&&(floor(y(i)/250)==3))
        flag(i,1)=28;
    end
    if((floor(x(i)/125)==7)&&(floor(y(i)/250)==0))
        flag(i,1)=29;
    end
    if((floor(x(i)/125)==7)&&(floor(y(i)/250)==1))
        flag(i,1)=30;
    end
    if((floor(x(i)/125)==7)&&(floor(y(i)/250)==2))
        flag(i,1)=31;
    end
    if((floor(x(i)/125)==7)&&(floor(y(i)/250)==3))
        flag(i,1)=32;
    end
end
for i=1:1000                     %calculating the number of neigbouring nodes for each node in each block 62.5*125
    for j=1:1000
        if(flag(i,1)==flag(j,1))
             if(((x(j)<=x(i)+62.5)&&(y(j)<=y(i)+125))&&((y(j)>=y(i)-62.5)&&(x(j)>=x(i)-125)))
                neig(i,1)=neig(i,1)+1;
            end
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
    if((x(i)<=x1+125)&&(x(i)>=x1-125)&&(y(i)<=y1+125)&&(y(i)>=y1-125))
        flag(i,1)=0;
        plot([x(i) x1] ,[y(i) y1],'m');
        hold on;
    end
end
for i=1:1000                     % calculate the number of neighbours of each node
    for j=1:1000
        if(flag(i,1)==flag(j,1))
             if(((x(j)<=x(i)+62.5)&&(y(j)<=y(i)+125))&&((y(j)>=y(i)-62.5)&&(x(j)>=x(i)-125)))
                neig(i,1)=neig(i,1)+1;
            end
        end
    end
end
for i=1:32                       % finding the cluster heads by using formulae which is inversly proportional to no of neighbours
    min=0;
    for j=1:1000
        if((flag(j,1)==i)&&(min<=neig(j)))
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
for i=1:32                       % calculating the distance of cluster heads from sink
    dist1(i,1)=sqrt(power(((x(ch1(i,1))-x1)),2)+power(((y(ch1(i,1))-y1)),2));
end
for i=1:32                       
    for j=1:1000
        if(flag(j,1)==flag(ch1(i,1),1))          % joining the remaining cluster nodes with their corresponding clusterheads
            plot([x(j) x(ch1(i,1))],[y(j) y(ch1(i,1))],'m');
            hold on;
        end
    end
end
for i=1:32
    dist1(i,1)=sqrt(power(((x(ch1(i,1))-x1)),2)+power(((y(ch1(i,1))-y1)),2));
    if(dist1(i,1)<225)
        join1(i,1)=1;
        plot([x1 x(ch1(i,1))],[y1 y(ch1(i,1))],'k');
    end    
end
for i=1:32
    for j=1:32
    distance(i,j)=sqrt(power(((x(ch1(i,1))-x(ch1(j,1)))),2)+power(((y(ch1(i,1))-y(ch1(j,1)))),2));
    end
end
for i=1:32
    min=999999;
    if(join1(i,1)==0)
    for j=1:32
        if((min>distance(i,j))&&(distance(i,j))&&join(i,j)==0)
            min=distance(i,j);
            p=j;
        end
    end
    join(i,p)=1;
    plot([x(ch1(i,1)) x(ch1(p,1))],[y(ch1(i,1)) y(ch1(p,1))],'k');
    end
end

        