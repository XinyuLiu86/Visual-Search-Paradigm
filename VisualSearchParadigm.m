figure
%Start screen
text(0.3,0.6,'Determine if there is a target.')
text(0.2,0.55,'Press T if there is, and press F is there is not.')
text(0.3,0.5,'Press any key to start.')
text(0.3,0.45,'The first round: The target is a purple character.')
pause
close
%Initialize variables
featuresearchresults=zeros(20,3);
conjunctionsearchresults=zeros(20,3);
%feature search
sets=1;setsize=3;
while sets<=4
numberoftrials=1;
while numberoftrials<=20
figure
%generate random number of Xs and Os according to setsize
numberofXs=randi([1,setsize]);
for i=1:numberofXs
g=text(rand(1,1),rand(1,1),'X');
set(g,'Color',[1 0 0])
end
for j=1:(setsize-numberofXs)
    g=text(rand(1,1),rand(1,1),'O');
    set(g,'Color',[1 0 0])
end
%randomly decide put target in or not put the target in
if randi([0 1])==1
    g=text(rand(1,1),rand(1,1),'X');
else
    g=text(rand(1,1),rand(1,1),'O');
end
puttarget1=randi([0 1]);
if puttarget1==1
set(g,'Color','m')
else
    set(g,'Color',[1 0 0])
end
%record the reaction time
tic
pause
rt=toc;
%obtain the key pressed and record the correct trial
press=get(gcf,'CurrentCharacter');
if (press=='t'&&puttarget1==1)||(press=='f'&&puttarget1==0)
    featuresearchresults(numberoftrials,sets)=rt;
    numberoftrials=numberoftrials+1;
end
close
end
sets=sets+1;
setsize=setsize+4;
end
y1=mean(featuresearchresults);
x1=4:4:16;


%conjunction search start 
figure
text(0.2,0.6,'Now find the purple X.')
text(0.2,0.55,'Press any key to proceed.')
pause
close
sets=1;setsize=3;
while sets<=4
numberoftrials=1;
while numberoftrials<=20
figure
%generate random number of Xs and Os according to setsize
numberofXs=randi([1,setsize]);
for i=1:numberofXs
g=text(rand(1,1),rand(1,1),'X');
set(g,'Color',[1 0 0])
end
for j=1:(setsize-numberofXs)
    g=text(rand(1,1),rand(1,1),'O');
    set(g,'Color','m')
end
%put in the target or not
g=text(rand(1,1),rand(1,1),'X');
puttarget2=randi([0 1]);
if puttarget2==1
    set(g,'Color','m')
else
    set(g,'Color',[1 0 0])
end
    
%record the reaction time
tic
pause
rt=toc;
%obtain the key pressed and record the correct trial
press=get(gcf,'CurrentCharacter');
if (press=='t'&&puttarget2==1)||(press=='f'&&puttarget2==0)
    conjunctionsearchresults(numberoftrials,sets)=rt;
    numberoftrials=numberoftrials+1;
end
close
end
sets=sets+1;
setsize=setsize+4;
end
%data representation
figure
y2=mean(conjunctionsearchresults);
x2=4:4:16;
plot(x1,y1)
hold on
plot(x2,y2)
set(gca,'XTick',[4 8 12 16])
xlabel('Set size')
ylabel('RT')
set(gcf,'Color',[0.1 0.7 0.8])
r1=corrcoef(x1,y1);r2=corrcoef(x2,y2);
r=[r1(2,1) r2(2,1)]
