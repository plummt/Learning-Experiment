function [ s,u ] = normalizePosistion( s )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
u=struct('towards1hztotal',[],'towards4hztotal',[],'away1hztotal',[],'away4hztotal',[],'towards1hztotalstd',[],'towards4hztotalstd',[],'away1hztotalstd',[],'away4hztotalstd',[],...
'towards1hzsec1',[],'towards4hzsec1',[],'away1hzsec1',[],'away4hzsec1',[],'towards1hzsec1std',[],'towards4hzsec1std',[],'away1hzsec1std',[],'away4hzsec1std',[],...
'towards1hzsec2',[],'towards4hzsec2',[],'away1hzsec2',[],'away4hzsec2',[],'towards1hzsec2std',[],'towards4hzsec2std',[],'away1hzsec2std',[],'away4hzsec2std',[],...
'towards1hzsec3',[],'towards4hzsec3',[],'away1hzsec3',[],'away4hzsec3',[],'towards1hzsec3std',[],'towards4hzsec3std',[],'away1hzsec3std',[],'away4hzsec3std',[],...
'towards1hzsec4',[],'towards4hzsec4',[],'away1hzsec4',[],'away4hzsec4',[],'towards1hzsec4std',[],'towards4hzsec4std',[],'away1hzsec4std',[],'away4hzsec4std',[],...
'towards1hzsec234',[],'towards4hzsec234',[],'away1hzsec234',[],'away4hzsec234',[],'towards1hzsec234std',[],'towards4hzsec234std',[],'away1hzsec234std',[],'away4hzsec234std',[]);
for i = 1:length(s.group)
   s.group{i}.mean = mean(s.group{i}.data.correctedPosition);
   s.group{i}.data.normalizedPosition = s.group{i}.data.correctedPosition/s.group{i}.mean;
type = struct('position',0,'n',0);
s.group{i}.towards1hz= struct('total',[type],'sec1',[type],'sec2',[type],'sec3',[type],'sec4',[type],'sec234',[type]);
s.group{i}.towards4hz= struct('total',[type],'sec1',[type],'sec2',[type],'sec3',[type],'sec4',[type],'sec234',[type]);
s.group{i}.away1hz= struct('total',[type],'sec1',[type],'sec2',[type],'sec3',[type],'sec4',[type],'sec234',[type]);
s.group{i}.away4hz= struct('total',[type],'sec1',[type],'sec2',[type],'sec3',[type],'sec4',[type],'sec234',[type]);
s.group{i}.other = [];
for i1 = 1:height(s.group{i}.data)
    switch s.group{i}.data.Direction(i1)
        case 0
            switch s.group{i}.data.Frequency(i1)
                case 2
                    s.group{i}.towards1hz.total.position = [s.group{i}.towards1hz.total.position;s.group{i}.data.correctedPosition(i1)];
                    s.group{i}.towards1hz.total.n=s.group{i}.towards1hz.total.n+1;
                    if s.group{i}.data.Trial(i1)<=12
                        s.group{i}.towards1hz.sec1.position = [s.group{i}.towards1hz.sec1.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.towards1hz.sec1.n = s.group{i}.towards1hz.sec1.n+1;
                    elseif s.group{i}.data.Trial(i1)<=24
                        s.group{i}.towards1hz.sec2.position = [s.group{i}.towards1hz.sec2.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.towards1hz.sec234.position = [s.group{i}.towards1hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=36
                        s.group{i}.towards1hz.sec3.position = [s.group{i}.towards1hz.sec3.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.towards1hz.sec234.position = [s.group{i}.towards1hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=48
                        s.group{i}.towards1hz.sec4.position = [s.group{i}.towards1hz.sec4.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.towards1hz.sec234.position = [s.group{i}.towards1hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    end    
                case 3
                    s.group{i}.towards4hz.total.position = [s.group{i}.towards4hz.total.position;s.group{i}.data.correctedPosition(i1)];
                    s.group{i}.towards4hz.total.n=s.group{i}.towards4hz.total.n+1;
                    if s.group{i}.data.Trial(i1)<=12
                        s.group{i}.towards4hz.sec1.position = [s.group{i}.towards4hz.sec1.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=24
                        s.group{i}.towards4hz.sec2.position = [s.group{i}.towards4hz.sec2.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.towards4hz.sec234.position = [s.group{i}.towards4hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=36
                        s.group{i}.towards4hz.sec3.position = [s.group{i}.towards4hz.sec3.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.towards4hz.sec234.position = [s.group{i}.towards4hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=48
                        s.group{i}.towards4hz.sec4.position = [s.group{i}.towards4hz.sec4.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.towards4hz.sec234.position = [s.group{i}.towards4hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    end    
                otherwise
            end
        case 1
            switch s.group{i}.data.Frequency(i1)
                case 2
                    s.group{i}.away1hz.total.position = [s.group{i}.away1hz.total.position;s.group{i}.data.correctedPosition(i1)];
                    s.group{i}.away1hz.total.n=s.group{i}.away1hz.total.n+1;
                    if s.group{i}.data.Trial(i1)<=12
                        s.group{i}.away1hz.sec1.position = [s.group{i}.away1hz.sec1.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=24
                        s.group{i}.away1hz.sec2.position = [s.group{i}.away1hz.sec2.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.away1hz.sec234.position = [s.group{i}.away1hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=36
                        s.group{i}.away1hz.sec3.position = [s.group{i}.away1hz.sec3.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.away1hz.sec234.position = [s.group{i}.away1hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=48
                        s.group{i}.away1hz.sec4.position = [s.group{i}.away1hz.sec4.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.away1hz.sec234.position = [s.group{i}.away1hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    end    
                case 3
                    s.group{i}.away4hz.total.position = [s.group{i}.away4hz.total.position;s.group{i}.data.correctedPosition(i1)];
                    s.group{i}.away4hz.total.n=s.group{i}.away4hz.total.n+1;
                    if s.group{i}.data.Trial(i1)<=12
                        s.group{i}.away4hz.sec1.position = [s.group{i}.away4hz.sec1.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=24
                        s.group{i}.away4hz.sec2.position = [s.group{i}.away4hz.sec2.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.away4hz.sec234.position = [s.group{i}.away4hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=36
                        s.group{i}.away4hz.sec3.position = [s.group{i}.away4hz.sec3.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.away4hz.sec234.position = [s.group{i}.away4hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    elseif s.group{i}.data.Trial(i1)<=48
                        s.group{i}.away4hz.sec4.position = [s.group{i}.away4hz.sec4.position;s.group{i}.data.correctedPosition(i1)];
                        s.group{i}.away4hz.sec234.position = [s.group{i}.away4hz.sec234.position;s.group{i}.data.correctedPosition(i1)];
                    end 
                otherwise
            end
        otherwise
            s.group{i}.other = [s.group{i}.sectionOther;s.group{i}.data(i1,1:end)];
    end
end
u.towards1hztotal{i} = mean(s.group{i}.towards1hz.total.position);
u.towards4hztotal{i} = mean(s.group{i}.towards4hz.total.position);
u.away1hztotal{i} = mean(s.group{i}.away1hz.total.position);
u.away4hztotal{i} = mean(s.group{i}.away4hz.total.position);

u.towards1hztotalstd{i} = (std(s.group{i}.towards1hz.total.position))/(sqrt(s.group{i}.towards1hz.total.n));
u.towards4hztotalstd{i} = (std(s.group{i}.towards4hz.total.position))/(sqrt(s.group{i}.towards4hz.total.n));
u.away1hztotalstd{i} = (std(s.group{i}.away1hz.total.position))/(sqrt(s.group{i}.away1hz.total.n));
u.away4hztotalstd{i} = (std(s.group{i}.away4hz.total.position))/(sqrt(s.group{i}.away4hz.total.n));

u.towards1hzsec1{i} = mean(s.group{i}.towards1hz.sec1.position);
u.towards4hzsec1{i} = mean(s.group{i}.towards4hz.sec1.position);
u.away1hzsec1{i} = mean(s.group{i}.away1hz.sec1.position);
u.away4hzsec1{i} = mean(s.group{i}.away4hz.sec1.position);

u.towards1hzsec1std{i} = std(s.group{i}.towards1hz.sec1.position)/(sqrt(s.group{i}.towards1hz.sec1.n));
u.towards4hzsec1std{i} = std(s.group{i}.towards4hz.sec1.position)/(sqrt(s.group{i}.towards4hz.sec1.n));
u.away1hzsec1std{i} = std(s.group{i}.away1hz.sec1.position)/(sqrt(s.group{i}.away1hz.sec1.n));
u.away4hzsec1std{i} = std(s.group{i}.away4hz.sec1.position)/(sqrt(s.group{i}.away4hz.sec1.n));

u.towards1hzsec2{i} = mean(s.group{i}.towards1hz.sec2.position);
u.towards4hzsec2{i} = mean(s.group{i}.towards4hz.sec2.position);
u.away1hzsec2{i} = mean(s.group{i}.away1hz.sec2.position);
u.away4hzsec2{i} = mean(s.group{i}.away4hz.sec2.position);

u.towards1hzsec2std{i} = std(s.group{i}.towards1hz.sec2.position)/(sqrt(s.group{i}.towards1hz.sec2.n));
u.towards4hzsec2std{i} = std(s.group{i}.towards4hz.sec2.position)/(sqrt(s.group{i}.towards4hz.sec2.n));
u.away1hzsec2std{i} = std(s.group{i}.away1hz.sec2.position)/(sqrt(s.group{i}.away1hz.sec2.n));
u.away4hzsec2std{i} = std(s.group{i}.away4hz.sec2.position)/(sqrt(s.group{i}.away4hz.sec2.n));

u.towards1hzsec3{i} = mean(s.group{i}.towards1hz.sec3.position);
u.towards4hzsec3{i} = mean(s.group{i}.towards4hz.sec3.position);
u.away1hzsec3{i} = mean(s.group{i}.away1hz.sec3.position);
u.away4hzsec3{i} = mean(s.group{i}.away4hz.sec3.position);

u.towards1hzsec3std{i} = std(s.group{i}.towards1hz.sec3.position)/(sqrt(s.group{i}.towards1hz.sec3.n));
u.towards4hzsec3std{i} = std(s.group{i}.towards4hz.sec3.position)/(sqrt(s.group{i}.towards4hz.sec3.n));
u.away1hzsec3std{i} = std(s.group{i}.away1hz.sec3.position)/(sqrt(s.group{i}.away1hz.sec3.n));
u.away4hzsec3std{i} = std(s.group{i}.away4hz.sec3.position)/(sqrt(s.group{i}.away4hz.sec3.n));

u.towards1hzsec4{i} = mean(s.group{i}.towards1hz.sec4.position);
u.towards4hzsec4{i} = mean(s.group{i}.towards4hz.sec4.position);
u.away1hzsec4{i} = mean(s.group{i}.away1hz.sec4.position);
u.away4hzsec4{i} = mean(s.group{i}.away4hz.sec4.position);

u.towards1hzsec4std{i} = std(s.group{i}.towards1hz.sec4.position)/(sqrt(s.group{i}.towards1hz.sec4.n));
u.towards4hzsec4std{i} = std(s.group{i}.towards4hz.sec4.position)/(sqrt(s.group{i}.towards4hz.sec4.n));
u.away1hzsec4std{i} = std(s.group{i}.away1hz.sec4.position)/(sqrt(s.group{i}.away1hz.sec4.n));
u.away4hzsec4std{i} = std(s.group{i}.away4hz.sec4.position)/(sqrt(s.group{i}.away4hz.sec4.n));

u.towards1hzsec234{i} = mean(s.group{i}.towards1hz.sec234.position);
u.towards4hzsec234{i} = mean(s.group{i}.towards4hz.sec234.position);
u.away1hzsec234{i} = mean(s.group{i}.away1hz.sec234.position);
u.away4hzsec234{i} = mean(s.group{i}.away4hz.sec234.position);

u.towards1hzsec234std{i} = std(s.group{i}.towards1hz.sec234.position)/(sqrt(s.group{i}.towards1hz.sec234.n));
u.towards4hzsec234std{i} = std(s.group{i}.towards4hz.sec234.position)/(sqrt(s.group{i}.towards4hz.sec234.n));
u.away1hzsec234std{i} = std(s.group{i}.away1hz.sec234.position)/(sqrt(s.group{i}.away1hz.sec234.n));
u.away4hzsec234std{i} = std(s.group{i}.away4hz.sec234.position)/(sqrt(s.group{i}.away4hz.sec234.n));
end
end
