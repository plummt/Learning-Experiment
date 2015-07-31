function  [s] = findMedian(data)
s = struct('all',struct('section1',table(),...
                        'section2',table(),...
                        'section3',table(),...
                        'section4',table()),...
           'towards',struct('section1',table(),...
                            'section2',table(),...
                            'section3',table(),...
                            'section4',table()),...
           'away',struct('section1',table(),...
                         'section2',table(),...
                         'section3',table(),...
                         'section4',table()));

for i1 = 1:height(data)
    if data.Trial(i1)<=12
        s.all.section1 = [s.all.section1;data(i1,1:end)];
        if data.Direction(i1) == 1
            s.towards.section1 = [s.towards.section1;data(i1,1:end)];
        else 
            s.away.section1 = [s.away.section1;data(i1,1:end)];
        end
    elseif (data.Trial(i1)<=24) && (data.Trial(i1)>12)
        s.all.section2 = [s.all.section2;data(i1,1:end)];
        if data.Direction(i1) == 1
            s.towards.section2 = [s.towards.section2;data(i1,1:end)];
        else 
            s.away.section2 = [s.away.section2;data(i1,1:end)];
        end
    elseif data.Trial(i1)<=36 && data.Trial(i1)>24
        s.all.section3 = [s.all.section3;data(i1,1:end)];
        if data.Direction(i1) == 1
            s.towards.section3 = [s.towards.section3;data(i1,1:end)];
        else 
            s.away.section3 = [s.away.section3;data(i1,1:end)];
        end
    elseif data.Trial(i1)<=48 && data.Trial(i1)>36
        s.all.section4 = [s.all.section4;data(i1,1:end)];
        if data.Direction(i1) == 1
            s.towards.section4 = [s.towards.section4;data(i1,1:end)];
        else 
            s.away.section4 = [s.away.section4;data(i1,1:end)];
        end
    end
end
s.results.Guess(1,1) = mean(s.all.section1.correctGuess);
s.results.Guess(2,1) = mean(s.all.section2.correctGuess);
s.results.Guess(3,1) = mean(s.all.section3.correctGuess);
s.results.Guess(4,1) = mean(s.all.section4.correctGuess);
s.results.Answer(1,1) = mean(s.all.section1.correctAnswer);
s.results.Answer(2,1) = mean(s.all.section2.correctAnswer);
s.results.Answer(3,1) = mean(s.all.section3.correctAnswer);
s.results.Answer(4,1) = mean(s.all.section4.correctAnswer);
s.results.MedPos(1,1) = median(s.all.section1.Position);
s.results.MedPos(2,1) = median(s.all.section2.Position);
s.results.MedPos(3,1) = median(s.all.section3.Position);
s.results.MedPos(4,1) = median(s.all.section4.Position);
s.results.AvgPos(1,1) = mean(s.all.section1.Position);
s.results.AvgPos(2,1) = mean(s.all.section2.Position);
s.results.AvgPos(3,1) = mean(s.all.section3.Position);
s.results.AvgPos(4,1) = mean(s.all.section4.Position);
s.results.StdPos(1,1) = (std(s.all.section1.Position))/(sqrt(length(s.all.section1.Position)));
s.results.StdPos(2,1) = (std(s.all.section2.Position))/(sqrt(length(s.all.section2.Position)));
s.results.StdPos(3,1) = (std(s.all.section3.Position))/(sqrt(length(s.all.section3.Position)));
s.results.StdPos(4,1) = (std(s.all.section4.Position))/(sqrt(length(s.all.section4.Position)));

s.results.towardsGuess(1,1) = mean(s.towards.section1.correctGuess);
s.results.towardsGuess(2,1) = mean(s.towards.section2.correctGuess);
s.results.towardsGuess(3,1) = mean(s.towards.section3.correctGuess);
s.results.towardsGuess(4,1) = mean(s.towards.section4.correctGuess);
s.results.towardsAnswer(1,1) = mean(s.towards.section1.correctAnswer);
s.results.towardsAnswer(2,1) = mean(s.towards.section2.correctAnswer);
s.results.towardsAnswer(3,1) = mean(s.towards.section3.correctAnswer);
s.results.towardsAnswer(4,1) = mean(s.towards.section4.correctAnswer);
s.results.towardsMedPos(1,1) = median(s.towards.section1.Position);
s.results.towardsMedPos(2,1) = median(s.towards.section2.Position);
s.results.towardsMedPos(3,1) = median(s.towards.section3.Position);
s.results.towardsMedPos(4,1) = median(s.towards.section4.Position);
s.results.towardsAvgPos(1,1) = mean(s.towards.section1.Position);
s.results.towardsAvgPos(2,1) = mean(s.towards.section2.Position);
s.results.towardsAvgPos(3,1) = mean(s.towards.section3.Position);
s.results.towardsAvgPos(4,1) = mean(s.towards.section4.Position);
s.results.towardsStdPos(1,1) = (std(s.towards.section1.Position))/(sqrt(length(s.towards.section1.Position)));
s.results.towardsStdPos(2,1) = (std(s.towards.section2.Position))/(sqrt(length(s.towards.section2.Position)));
s.results.towardsStdPos(3,1) = (std(s.towards.section3.Position))/(sqrt(length(s.towards.section3.Position)));
s.results.towardsStdPos(4,1) = (std(s.towards.section4.Position))/(sqrt(length(s.towards.section4.Position)));

s.results.awayGuess(1,1) = mean(s.away.section1.correctGuess);
s.results.awayGuess(2,1) = mean(s.away.section2.correctGuess);
s.results.awayGuess(3,1) = mean(s.away.section3.correctGuess);
s.results.awayGuess(4,1) = mean(s.away.section4.correctGuess);
s.results.awayAnswer(1,1) = mean(s.away.section1.correctAnswer);
s.results.awayAnswer(2,1) = mean(s.away.section2.correctAnswer);
s.results.awayAnswer(3,1) = mean(s.away.section3.correctAnswer);
s.results.awayAnswer(4,1) = mean(s.away.section4.correctAnswer);
s.results.awayMedPos(1,1) = median(s.away.section1.Position);
s.results.awayMedPos(2,1) = median(s.away.section2.Position);
s.results.awayMedPos(3,1) = median(s.away.section3.Position);
s.results.awayMedPos(4,1) = median(s.away.section4.Position);
s.results.awayAvgPos(1,1) = mean(s.away.section1.Position);
s.results.awayAvgPos(2,1) = mean(s.away.section2.Position);
s.results.awayAvgPos(3,1) = mean(s.away.section3.Position);
s.results.awayAvgPos(4,1) = mean(s.away.section4.Position);
s.results.awayStdPos(1,1) = (std(s.away.section1.Position))/(sqrt(length(s.away.section1.Position)));
s.results.awayStdPos(2,1) = (std(s.away.section2.Position))/(sqrt(length(s.away.section2.Position)));
s.results.awayStdPos(3,1) = (std(s.away.section3.Position))/(sqrt(length(s.away.section3.Position)));
s.results.awayStdPos(4,1) = (std(s.away.section4.Position))/(sqrt(length(s.away.section4.Position)));
end