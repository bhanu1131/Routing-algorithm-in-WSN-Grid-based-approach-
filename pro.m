x=zeros(200);
y=zeros(200);
con=zeros(5,5);
nei=zeros(5,5);
neig=zeros(200,1);
flag=zeros(200,1);
dist=zeros(200,200);
residual=zeros(200);
energy=zeros(200,1);
ch=zeros(200,1);
ch1=zeros(32,1);
dist1=zeros(32,1);
match=zeros(200,32);
relay=zeros(32,32);
num=zeros(32,1);
for i=1:200
x(i)=rand()*1000;
y(i)=rand()*1000;
residual(i)=2;
end
for i=1:200
    plot(x(i),y(i),'o');
hold on;
end
for i=1:200
    for j=1:200
        dist(i,j)=sqrt(power(((x(i)-x(j))),2)+power(((y(i)-y(j))),2));
    end
end
for i=1:200
    p=floor(x(i)/125);
    p1=floor(y(i)/250);
    for j=1:200
        q=floor(x(j)/125);
            q1=floor(y(j)/250);
        if((p==q&&p1==q1)&&dist(i,j))
    energy(i,1)=energy(i,1)+residual(i)*residual(i)/dist(i,j);
        end
    end
end
j=1;
for i=1:200
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
for i=1:200
    for j=1:200
        if(flag(i,1)==flag(j,1))
             if(((x(j)<=x(i)+62.5)&&(y(j)<=y(i)+125))&&((y(j)>=y(i)-62.5)&&(x(j)>=x(i)-125)))
                neig(i,1)=neig(i,1)+1;
            end
        end
    end
end
for i=1:32
    min=99;
    for j=1:200
        if((flag(j,1)==i)&&(min>=neig(j)))
            min=neig(j);
            p=j;
        end
    end
       plot(x(p),y(p),'r*');
       ch(p,1)=1;
       hold on;
end
p=1;
for i=1:200
    if(ch(i,1)==1)
        ch1(p,1)=i;
        p=p+1;
    end
end    
x1=500;
y1=500;
for i=1:32
    dist1(i,1)=sqrt(power(((x(ch1(i,1))-x1)),2)+power(((y(ch1(i,1))-y1)),2));
end
for i=1:200
    p=1;
    for j=1:200
        if((ch(j)==1)&&(dist(i,j)))
            match(i,p)=dist1(p,1)/dist(i,j);
            p=p+1;
        end
    end
end
for i=1:200
    max=match(i,1);
    a=1;
    for j=2:32
        if(max<match(i,j))
            max=match(i,j);
            a=j;
        end
    end
    if(ch(i)==0)
    num(a,1)=num(a,1)+1;
    plot([x(i) x(ch1(a,1))], [y(i) y(ch1(a,1))],'m')
    hold on;
    end
end
plot(x1,y1,'ko');
plot(x1,y1,'k*');
for i=1:32
    min=999900;
            ch1(i,1)
    for j=1:32
        if((i~=j)&&(min>dist(ch1(i,1),ch1(j,1))))
            ch1(j,1)
            min=dist(ch1(i,1),ch1(j,1));
            p=ch1(j,1);
        end
    end
    plot([x(ch1(i,1)) x(ch1(p,1))], [y(ch1(i,1)) y(ch1(p,1))],'k');
    hold on;
end
