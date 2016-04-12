% for i = 1:length(avgGuess{1})
%     Guess(i) = mean([avgGuess{1}(i),avgGuess{2}(i),avgGuess{3}(i),avgGuess{4}(i)]);
%     Answer(i) = mean([avgAnswer{1}(i),avgAnswer{2}(i),avgAnswer{3}(i),avgAnswer{4}(i)]);
%     Posistion(i) = mean([avgPos{1}(i),avgPos{2}(i),avgPos{3}(i),avgPos{4}(i)]);
% end
for i1 = 1:length(s.group)
    s.group{i1}.towardsdata = [];
    s.group{i1}.awaydata = [];
    for i2 = 1:4
        s.group{i1}.towards{i2}.normalizedPosition = s.group{i1}.towards{i2}.correctedPosition/s.group{i1}.mean;
        s.group{i1}.away{i2}.normalizedPosition = s.group{i1}.away{i2}.correctedPosition/s.group{i1}.mean;
        s.group{i1}.towardsdata = [s.group{i1}.towardsdata; s.group{i1}.towards{i2}];
        s.group{i1}.awaydata = [s.group{i1}.awaydata; s.group{i1}.away{i2}];
    end
    towPosis = zeros(48,1);
    towguess = zeros(48,1);
    towanswer = zeros(48,1);
    towtrial = zeros(48,1);
    awayPosis = zeros(48,1);
    awayguess = zeros(48,1);
    awayanswer = zeros(48,1);
    awaytrial = zeros(48,1);
    
    
    for i2 = 1:height(s.group{i1}.towardsdata)
        towPosis(s.group{i1}.towardsdata.Trial(i2),1) = towPosis(s.group{i1}.towardsdata.Trial(i2),1) + s.group{i1}.towardsdata.normalizedPosition(i2);
        towguess(s.group{i1}.towardsdata.Trial(i2),1) = towguess(s.group{i1}.towardsdata.Trial(i2),1) + s.group{i1}.towardsdata.correctGuess(i2);
        towanswer(s.group{i1}.towardsdata.Trial(i2),1) = towanswer(s.group{i1}.towardsdata.Trial(i2),1) + s.group{i1}.towardsdata.correctAnswer(i2);
        towtrial(s.group{i1}.towardsdata.Trial(i2),1) = towtrial(s.group{i1}.towardsdata.Trial(i2),1) +1;
    end
    towavgPos{i1} = zeros(48,1);
    towavgGuess{i1} = zeros(48,1);
    towavgAnswer{i1} = zeros(48,1);
    for i3 = 1:length(towtrial)
        towavgPos{i1}(i3) = towPosis(i3,1)/towtrial(i3,1);
        towavgGuess{i1}(i3) = sum(towguess(1:i3,1))/sum(towtrial(1:i3,1));
        towavgAnswer{i1}(i3) = sum(towanswer(1:i3,1))/sum(towtrial(1:i3,1));
    end
    
    
    for i2 = 1:height(s.group{i1}.awaydata)
        awayPosis(s.group{i1}.awaydata.Trial(i2),1) = awayPosis(s.group{i1}.awaydata.Trial(i2),1) + s.group{i1}.awaydata.normalizedPosition(i2);
        awayguess(s.group{i1}.awaydata.Trial(i2),1) = awayguess(s.group{i1}.awaydata.Trial(i2),1) + s.group{i1}.awaydata.correctGuess(i2);
        awayanswer(s.group{i1}.awaydata.Trial(i2),1) = awayanswer(s.group{i1}.awaydata.Trial(i2),1) + s.group{i1}.awaydata.correctAnswer(i2);
        awaytrial(s.group{i1}.awaydata.Trial(i2),1) = awaytrial(s.group{i1}.awaydata.Trial(i2),1) +1;
    end
    awayavgPos{i1} = zeros(48,1);
    awayavgGuess{i1} = zeros(48,1);
    awayavgAnswer{i1} = zeros(48,1);
    for i3 = 1:length(awaytrial)
        awayavgPos{i1}(i3) = awayPosis(i3,1)/awaytrial(i3,1);
        awayavgGuess{i1}(i3) = sum(awayguess(1:i3,1))/sum(awaytrial(1:i3,1));
        awayavgAnswer{i1}(i3) = sum(awayanswer(1:i3,1))/sum(awaytrial(1:i3,1));
    end
    x = 1:length(towtrial);
    f = figure();
    plot(x,towavgPos{i1}(:),x,towavgGuess{i1}(:),x,towavgAnswer{i1}(:),'LineWidth',2);
    title(['Group ', num2str(i1)]);
    legend('Posistion','Perdiction','Response','Location','southoutside','Orientation','horizontal');
    xlabel('Trial Number');
    ylabel('Percentage');
    ylim([0,(1.4478/1.59)]);
    saveas(f,[pwd,'\output\','Group ',num2str(i1),' towards.jpg']);
    close(f);
    f = figure();
    plot(x,awayavgPos{i1}(:),x,awayavgGuess{i1}(:),x,awayavgAnswer{i1}(:),'LineWidth',2);
    title(['Group ', num2str(i1)]);
    legend('Posistion','Perdiction','Response','Location','southoutside','Orientation','horizontal');
    xlabel('Trial Number');
    ylabel('Percentage');
    saveas(f,[pwd,'\output\','Group ',num2str(i1),' away.jpg']);
    close(f);
end