groupNum = 5;
s.group{groupNum}.towards1hz= struct('total',[],'sec1',[],'sec2',[],'sec3',[],'sec4',[],'sec234',[]);
s.group{groupNum}.towards4hz= struct('total',[],'sec1',[],'sec2',[],'sec3',[],'sec4',[],'sec234',[]);
s.group{groupNum}.away1hz= struct('total',[],'sec1',[],'sec2',[],'sec3',[],'sec4',[],'sec234',[]);
s.group{groupNum}.away4hz= struct('total',[],'sec1',[],'sec2',[],'sec3',[],'sec4',[],'sec234',[]);
s.group{groupNum}.other = [];

for i1 = 1:height(s.group{groupNum}.data)
    switch s.group{groupNum}.data.Direction(i1)
        case 0
            switch s.group{groupNum}.data.Frequency(i1)
                case 2
                    s.group{groupNum}.towards1hz.total = [s.group{groupNum}.towards1hz.total;s.group{groupNum}.data(i1,1:end)];
                    if s.group{groupNum}.data.Trial(i1)<=12
                        s.group{groupNum}.towards1hz.sec1 = [s.group{groupNum}.towards1hz.sec1;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=24
                        s.group{groupNum}.towards1hz.sec2 = [s.group{groupNum}.towards1hz.sec2;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.towards1hz.sec234 = [s.group{groupNum}.towards1hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=36
                        s.group{groupNum}.towards1hz.sec3 = [s.group{groupNum}.towards1hz.sec3;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.towards1hz.sec234 = [s.group{groupNum}.towards1hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=48
                        s.group{groupNum}.towards1hz.sec4 = [s.group{groupNum}.towards1hz.sec4;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.towards1hz.sec234 = [s.group{groupNum}.towards1hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    end    
                case 3
                    s.group{groupNum}.towards4hz.total = [s.group{groupNum}.towards4hz.total;s.group{groupNum}.data(i1,1:end)];
                    if s.group{groupNum}.data.Trial(i1)<=12
                        s.group{groupNum}.towards4hz.sec1 = [s.group{groupNum}.towards4hz.sec1;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=24
                        s.group{groupNum}.towards4hz.sec2 = [s.group{groupNum}.towards4hz.sec2;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.towards4hz.sec234 = [s.group{groupNum}.towards4hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=36
                        s.group{groupNum}.towards4hz.sec3 = [s.group{groupNum}.towards4hz.sec3;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.towards4hz.sec234 = [s.group{groupNum}.towards4hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=48
                        s.group{groupNum}.towards4hz.sec4 = [s.group{groupNum}.towards4hz.sec4;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.towards4hz.sec234 = [s.group{groupNum}.towards4hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    end    
                otherwise
            end
        case 1
            switch s.group{groupNum}.data.Frequency(i1)
                case 2
                    s.group{groupNum}.away1hz.total = [s.group{groupNum}.away1hz.total;s.group{groupNum}.data(i1,1:end)];
                    if s.group{groupNum}.data.Trial(i1)<=12
                        s.group{groupNum}.away1hz.sec1 = [s.group{groupNum}.away1hz.sec1;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=24
                        s.group{groupNum}.away1hz.sec2 = [s.group{groupNum}.away1hz.sec2;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.away1hz.sec234 = [s.group{groupNum}.away1hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=36
                        s.group{groupNum}.away1hz.sec3 = [s.group{groupNum}.away1hz.sec3;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.away1hz.sec234 = [s.group{groupNum}.away1hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=48
                        s.group{groupNum}.away1hz.sec4 = [s.group{groupNum}.away1hz.sec4;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.away1hz.sec234 = [s.group{groupNum}.away1hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    end    
                case 3
                    s.group{groupNum}.away4hz.total = [s.group{groupNum}.away4hz.total;s.group{groupNum}.data(i1,1:end)];
                    if s.group{groupNum}.data.Trial(i1)<=12
                        s.group{groupNum}.away4hz.sec1 = [s.group{groupNum}.away4hz.sec1;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=24
                        s.group{groupNum}.away4hz.sec2 = [s.group{groupNum}.away4hz.sec2;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.away4hz.sec234 = [s.group{groupNum}.away4hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=36
                        s.group{groupNum}.away4hz.sec3 = [s.group{groupNum}.away4hz.sec3;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.away4hz.sec234 = [s.group{groupNum}.away4hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    elseif s.group{groupNum}.data.Trial(i1)<=48
                        s.group{groupNum}.away4hz.sec4 = [s.group{groupNum}.away4hz.sec4;s.group{groupNum}.data(i1,1:end)];
                        s.group{groupNum}.away4hz.sec234 = [s.group{groupNum}.away4hz.sec234;s.group{groupNum}.data(i1,1:end)];
                    end 
                otherwise
            end
        otherwise
            s.group{groupNum}.other = [s.group{groupNum}.sectionOther;s.group{groupNum}.data(i1,1:end)];
    end
end
towards1hztotal = mean(s.group{groupNum}.towards1hz.total.correctedPosition);
towards4hztotal = mean(s.group{groupNum}.towards4hz.total.correctedPosition);
away1hztotal = mean(s.group{groupNum}.away1hz.total.correctedPosition);
away4hztotal = mean(s.group{groupNum}.away4hz.total.correctedPosition);

towards1hztotalstd = (std(s.group{groupNum}.towards1hz.total.correctedPosition))/(sqrt(height(s.group{groupNum}.towards1hz.total)));
towards4hztotalstd = (std(s.group{groupNum}.towards4hz.total.correctedPosition))/(sqrt(height(s.group{groupNum}.towards4hz.total)));
away1hztotalstd = (std(s.group{groupNum}.away1hz.total.correctedPosition))/(sqrt(height(s.group{groupNum}.away1hz.total)));
away4hztotalstd = (std(s.group{groupNum}.away4hz.total.correctedPosition))/(sqrt(height(s.group{groupNum}.away4hz.total)));

towards1hzsec1 = mean(s.group{groupNum}.towards1hz.sec1.correctedPosition);
towards4hzsec1 = mean(s.group{groupNum}.towards4hz.sec1.correctedPosition);
away1hzsec1 = mean(s.group{groupNum}.away1hz.sec1.correctedPosition);
away4hzsec1 = mean(s.group{groupNum}.away4hz.sec1.correctedPosition);

towards1hzsec1std = std(s.group{groupNum}.towards1hz.sec1.correctedPosition)/(sqrt(height(s.group{groupNum}.towards1hz.sec1)));
towards4hzsec1std = std(s.group{groupNum}.towards4hz.sec1.correctedPosition)/(sqrt(height(s.group{groupNum}.towards4hz.sec1)));
away1hzsec1std = std(s.group{groupNum}.away1hz.sec1.correctedPosition)/(sqrt(height(s.group{groupNum}.away1hz.sec1)));
away4hzsec1std = std(s.group{groupNum}.away4hz.sec1.correctedPosition)/(sqrt(height(s.group{groupNum}.away4hz.sec1)));

towards1hzsec2 = mean(s.group{groupNum}.towards1hz.sec2.correctedPosition);
towards4hzsec2 = mean(s.group{groupNum}.towards4hz.sec2.correctedPosition);
away1hzsec2 = mean(s.group{groupNum}.away1hz.sec2.correctedPosition);
away4hzsec2 = mean(s.group{groupNum}.away4hz.sec2.correctedPosition);

towards1hzsec2std = std(s.group{groupNum}.towards1hz.sec2.correctedPosition)/(sqrt(height(s.group{groupNum}.towards1hz.sec2)));
towards4hzsec2std = std(s.group{groupNum}.towards4hz.sec2.correctedPosition)/(sqrt(height(s.group{groupNum}.towards4hz.sec2)));
away1hzsec2std = std(s.group{groupNum}.away1hz.sec2.correctedPosition)/(sqrt(height(s.group{groupNum}.away1hz.sec2)));
away4hzsec2std = std(s.group{groupNum}.away4hz.sec2.correctedPosition)/(sqrt(height(s.group{groupNum}.away4hz.sec2)));

towards1hzsec3 = mean(s.group{groupNum}.towards1hz.sec3.correctedPosition);
towards4hzsec3 = mean(s.group{groupNum}.towards4hz.sec3.correctedPosition);
away1hzsec3 = mean(s.group{groupNum}.away1hz.sec3.correctedPosition);
away4hzsec3 = mean(s.group{groupNum}.away4hz.sec3.correctedPosition);

towards1hzsec3std = std(s.group{groupNum}.towards1hz.sec3.correctedPosition)/(sqrt(height(s.group{groupNum}.towards1hz.sec3)));
towards4hzsec3std = std(s.group{groupNum}.towards4hz.sec3.correctedPosition)/(sqrt(height(s.group{groupNum}.towards4hz.sec3)));
away1hzsec3std = std(s.group{groupNum}.away1hz.sec3.correctedPosition)/(sqrt(height(s.group{groupNum}.away1hz.sec3)));
away4hzsec3std = std(s.group{groupNum}.away4hz.sec3.correctedPosition)/(sqrt(height(s.group{groupNum}.away1hz.sec3)));

towards1hzsec4 = mean(s.group{groupNum}.towards1hz.sec4.correctedPosition);
towards4hzsec4 = mean(s.group{groupNum}.towards4hz.sec4.correctedPosition);
away1hzsec4 = mean(s.group{groupNum}.away1hz.sec4.correctedPosition);
away4hzsec4 = mean(s.group{groupNum}.away4hz.sec4.correctedPosition);

towards1hzsec4std = std(s.group{groupNum}.towards1hz.sec4.correctedPosition)/(sqrt(height(s.group{groupNum}.towards1hz.sec4)));
towards4hzsec4std = std(s.group{groupNum}.towards4hz.sec4.correctedPosition)/(sqrt(height(s.group{groupNum}.towards4hz.sec4)));
away1hzsec4std = std(s.group{groupNum}.away1hz.sec4.correctedPosition)/(sqrt(height(s.group{groupNum}.away1hz.sec4)));
away4hzsec4std = std(s.group{groupNum}.away4hz.sec4.correctedPosition)/(sqrt(height(s.group{groupNum}.away1hz.sec4)));

towards1hzsec234 = mean(s.group{groupNum}.towards1hz.sec234.correctedPosition);
towards4hzsec234 = mean(s.group{groupNum}.towards4hz.sec234.correctedPosition);
away1hzsec234 = mean(s.group{groupNum}.away1hz.sec234.correctedPosition);
away4hzsec234 = mean(s.group{groupNum}.away4hz.sec234.correctedPosition);

towards1hzsec234std = std(s.group{groupNum}.towards1hz.sec234.correctedPosition)/(sqrt(height(s.group{groupNum}.towards1hz.sec234)));
towards4hzsec234std = std(s.group{groupNum}.towards4hz.sec234.correctedPosition)/(sqrt(height(s.group{groupNum}.towards4hz.sec234)));
away1hzsec234std = std(s.group{groupNum}.away1hz.sec234.correctedPosition)/(sqrt(height(s.group{groupNum}.away1hz.sec234)));
away4hzsec234std = std(s.group{groupNum}.away4hz.sec234.correctedPosition)/(sqrt(height(s.group{groupNum}.away4hz.sec234)));

