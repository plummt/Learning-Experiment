groupNum = [5];
u.towards1hz= struct('total',[],'sec1',[],'sec2',[],'sec3',[],'sec4',[],'sec234',[]);
u.towards4hz= struct('total',[],'sec1',[],'sec2',[],'sec3',[],'sec4',[],'sec234',[]);
u.away1hz= struct('total',[],'sec1',[],'sec2',[],'sec3',[],'sec4',[],'sec234',[]);
u.away4hz= struct('total',[],'sec1',[],'sec2',[],'sec3',[],'sec4',[],'sec234',[]);
u.other = [];
for i2 = 1:length(groupNum)
    for i1 = 1:height(s.group{groupNum(i2)}.data)
        switch s.group{groupNum(i2)}.data.Direction(i1)
            case 0
                switch s.group{groupNum(i2)}.data.Frequency(i1)
                    case 2
                        u.towards1hz.total = [u.towards1hz.total;s.group{groupNum(i2)}.data(i1,1:end)];
                        if s.group{groupNum(i2)}.data.Trial(i1)<=12
                            u.towards1hz.sec1 = [u.towards1hz.sec1;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=24
                            u.towards1hz.sec2 = [u.towards1hz.sec2;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.towards1hz.sec234 = [u.towards1hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=36
                            u.towards1hz.sec3 = [u.towards1hz.sec3;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.towards1hz.sec234 = [u.towards1hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=48
                            u.towards1hz.sec4 = [u.towards1hz.sec4;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.towards1hz.sec234 = [u.towards1hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        end
                    case 3
                        u.towards4hz.total = [u.towards4hz.total;s.group{groupNum(i2)}.data(i1,1:end)];
                        if s.group{groupNum(i2)}.data.Trial(i1)<=12
                            u.towards4hz.sec1 = [u.towards4hz.sec1;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=24
                            u.towards4hz.sec2 = [u.towards4hz.sec2;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.towards4hz.sec234 = [u.towards4hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=36
                            u.towards4hz.sec3 = [u.towards4hz.sec3;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.towards4hz.sec234 = [u.towards4hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=48
                            u.towards4hz.sec4 = [u.towards4hz.sec4;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.towards4hz.sec234 = [u.towards4hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        end
                    otherwise
                end
            case 1
                switch s.group{groupNum(i2)}.data.Frequency(i1)
                    case 2
                        u.away1hz.total = [u.away1hz.total;s.group{groupNum(i2)}.data(i1,1:end)];
                        if s.group{groupNum(i2)}.data.Trial(i1)<=12
                            u.away1hz.sec1 = [u.away1hz.sec1;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=24
                            u.away1hz.sec2 = [u.away1hz.sec2;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.away1hz.sec234 = [u.away1hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=36
                            u.away1hz.sec3 = [u.away1hz.sec3;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.away1hz.sec234 = [u.away1hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=48
                            u.away1hz.sec4 = [u.away1hz.sec4;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.away1hz.sec234 = [u.away1hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        end
                    case 3
                        u.away4hz.total = [u.away4hz.total;s.group{groupNum(i2)}.data(i1,1:end)];
                        if s.group{groupNum(i2)}.data.Trial(i1)<=12
                            u.away4hz.sec1 = [u.away4hz.sec1;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=24
                            u.away4hz.sec2 = [u.away4hz.sec2;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.away4hz.sec234 = [u.away4hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=36
                            u.away4hz.sec3 = [u.away4hz.sec3;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.away4hz.sec234 = [u.away4hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        elseif s.group{groupNum(i2)}.data.Trial(i1)<=48
                            u.away4hz.sec4 = [u.away4hz.sec4;s.group{groupNum(i2)}.data(i1,1:end)];
                            u.away4hz.sec234 = [u.away4hz.sec234;s.group{groupNum(i2)}.data(i1,1:end)];
                        end
                    otherwise
                end
            otherwise
                u.other = [u.sectionOther;s.group{groupNum(i2)}.data(i1,1:end)];
        end
    end
end
towards1hztotal = mean(u.towards1hz.total.correctedPosition);
towards4hztotal = mean(u.towards4hz.total.correctedPosition);
away1hztotal = mean(u.away1hz.total.correctedPosition);
away4hztotal = mean(u.away4hz.total.correctedPosition);

towards1hztotalstd = (std(u.towards1hz.total.correctedPosition))/(sqrt(height(u.towards1hz.total)));
towards4hztotalstd = (std(u.towards4hz.total.correctedPosition))/(sqrt(height(u.towards4hz.total)));
away1hztotalstd = (std(u.away1hz.total.correctedPosition))/(sqrt(height(u.away1hz.total)));
away4hztotalstd = (std(u.away4hz.total.correctedPosition))/(sqrt(height(u.away4hz.total)));

towards1hzsec1 = mean(u.towards1hz.sec1.correctedPosition);
towards4hzsec1 = mean(u.towards4hz.sec1.correctedPosition);
away1hzsec1 = mean(u.away1hz.sec1.correctedPosition);
away4hzsec1 = mean(u.away4hz.sec1.correctedPosition);

towards1hzsec1std = std(u.towards1hz.sec1.correctedPosition)/(sqrt(height(u.towards1hz.sec1)));
towards4hzsec1std = std(u.towards4hz.sec1.correctedPosition)/(sqrt(height(u.towards4hz.sec1)));
away1hzsec1std = std(u.away1hz.sec1.correctedPosition)/(sqrt(height(u.away1hz.sec1)));
away4hzsec1std = std(u.away4hz.sec1.correctedPosition)/(sqrt(height(u.away4hz.sec1)));

towards1hzsec2 = mean(u.towards1hz.sec2.correctedPosition);
towards4hzsec2 = mean(u.towards4hz.sec2.correctedPosition);
away1hzsec2 = mean(u.away1hz.sec2.correctedPosition);
away4hzsec2 = mean(u.away4hz.sec2.correctedPosition);

towards1hzsec2std = std(u.towards1hz.sec2.correctedPosition)/(sqrt(height(u.towards1hz.sec2)));
towards4hzsec2std = std(u.towards4hz.sec2.correctedPosition)/(sqrt(height(u.towards4hz.sec2)));
away1hzsec2std = std(u.away1hz.sec2.correctedPosition)/(sqrt(height(u.away1hz.sec2)));
away4hzsec2std = std(u.away4hz.sec2.correctedPosition)/(sqrt(height(u.away4hz.sec2)));

towards1hzsec3 = mean(u.towards1hz.sec3.correctedPosition);
towards4hzsec3 = mean(u.towards4hz.sec3.correctedPosition);
away1hzsec3 = mean(u.away1hz.sec3.correctedPosition);
away4hzsec3 = mean(u.away4hz.sec3.correctedPosition);

towards1hzsec3std = std(u.towards1hz.sec3.correctedPosition)/(sqrt(height(u.towards1hz.sec3)));
towards4hzsec3std = std(u.towards4hz.sec3.correctedPosition)/(sqrt(height(u.towards4hz.sec3)));
away1hzsec3std = std(u.away1hz.sec3.correctedPosition)/(sqrt(height(u.away1hz.sec3)));
away4hzsec3std = std(u.away4hz.sec3.correctedPosition)/(sqrt(height(u.away4hz.sec3)));

towards1hzsec4 = mean(u.towards1hz.sec4.correctedPosition);
towards4hzsec4 = mean(u.towards4hz.sec4.correctedPosition);
away1hzsec4 = mean(u.away1hz.sec4.correctedPosition);
away4hzsec4 = mean(u.away4hz.sec4.correctedPosition);

towards1hzsec4std = std(u.towards1hz.sec4.correctedPosition)/(sqrt(height(u.towards1hz.sec4)));
towards4hzsec4std = std(u.towards4hz.sec4.correctedPosition)/(sqrt(height(u.towards4hz.sec4)));
away1hzsec4std = std(u.away1hz.sec4.correctedPosition)/(sqrt(height(u.away1hz.sec4)));
away4hzsec4std = std(u.away4hz.sec4.correctedPosition)/(sqrt(height(u.away4hz.sec4)));

towards1hzsec234 = mean(u.towards1hz.sec234.correctedPosition);
towards4hzsec234 = mean(u.towards4hz.sec234.correctedPosition);
away1hzsec234 = mean(u.away1hz.sec234.correctedPosition);
away4hzsec234 = mean(u.away4hz.sec234.correctedPosition);

towards1hzsec234std = std(u.towards1hz.sec234.correctedPosition)/(sqrt(height(u.towards1hz.sec234)));
towards4hzsec234std = std(u.towards4hz.sec234.correctedPosition)/(sqrt(height(u.towards4hz.sec234)));
away1hzsec234std = std(u.away1hz.sec234.correctedPosition)/(sqrt(height(u.away1hz.sec234)));
away4hzsec234std = std(u.away4hz.sec234.correctedPosition)/(sqrt(height(u.away4hz.sec234)));

