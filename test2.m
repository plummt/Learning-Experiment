for i1 = 1:length(s.group)
    subNum = 0;
    towardsNum = 0;
    awayNum = 0;
    towards = sortrows(s.group{i1}.towardsdata,'subjectNum');
    away = sortrows(s.group{i1}.awaydata,'subjectNum');
    towards.ord = zeros(height(towards),1);
    away.ord = zeros(height(away),1);
    for i2 = 1:height(towards)
        if subNum == towards.subjectNum(i2)
            towards.ord(i2) = towardsNum +1;
            towardsNum = towardsNum +1;
        else
            towardsNum = 0;
            towards.ord(i2) = towardsNum +1;
            towardsNum = towardsNum +1;
            subNum = towards.subjectNum(i2);
        end
    end
    subNum = 0;
    for i2 = 1:height(away)
        if subNum == away.subjectNum(i2)
            away.ord(i2) = awayNum +1;
            awayNum = awayNum +1;
        else
            awayNum = 0;
            away.ord(i2) = awayNum +1;
            awayNum = awayNum +1;
            subNum = away.subjectNum(i2);
        end
    end
    
    towPosis = zeros(24,1);
    towguess = zeros(24,1);
    towanswer = zeros(24,1);
    towtrial = zeros(24,1);
    awayPosis = zeros(24,1);
    awayguess = zeros(24,1);
    awayanswer = zeros(24,1);
    awaytrial = zeros(24,1);
    for i2 = 1:height(towards)
        towPosis(towards.ord(i2),1) = towPosis(towards.ord(i2),1) + towards.normalizedPosition(i2);
        towguess(towards.ord(i2),1) = towguess(towards.ord(i2),1) + towards.correctGuess(i2);
        towanswer(towards.ord(i2),1) = towanswer(towards.ord(i2),1) + towards.correctAnswer(i2);
        towtrial(towards.ord(i2),1) = towtrial(towards.ord(i2),1) +1;
    end
    towavgPos{i1} = zeros(24,1);
    towavgGuess{i1} = zeros(24,1);
    towavgAnswer{i1} = zeros(24,1);
    for i3 = 1:length(towtrial)
        towavgPos{i1}(i3) = towPosis(i3,1)/towtrial(i3,1);
        towavgGuess{i1}(i3) = sum(towguess(1:i3,1))/sum(towtrial(1:i3,1));
        towavgAnswer{i1}(i3) = sum(towanswer(1:i3,1))/sum(towtrial(1:i3,1));
    end
    
    for i2 = 1:height(away)
        awayPosis(away.ord(i2),1) = awayPosis(away.ord(i2),1) + away.normalizedPosition(i2);
        awayguess(away.ord(i2),1) = awayguess(away.ord(i2),1) + away.correctGuess(i2);
        awayanswer(away.ord(i2),1) = awayanswer(away.ord(i2),1) + away.correctAnswer(i2);
        awaytrial(away.ord(i2),1) = awaytrial(away.ord(i2),1) +1;
    end
    awayavgPos{i1} = zeros(24,1);
    awayavgGuess{i1} = zeros(24,1);
    awayavgAnswer{i1} = zeros(24,1);
    for i3 = 1:length(towtrial)
        awayavgPos{i1}(i3) = awayPosis(i3,1)/awaytrial(i3,1);
        awayavgGuess{i1}(i3) = sum(awayguess(1:i3,1))/sum(awaytrial(1:i3,1));
        awayavgAnswer{i1}(i3) = sum(awayanswer(1:i3,1))/sum(awaytrial(1:i3,1));
    end
    
end
x = 1:length(towtrial);
f = figure();
plot(x,towavgPos{1}(:),x,towavgPos{2}(:),x,towavgPos{3}(:),x,towavgPos{4}(:),'LineWidth',2);
title(['Towards Average Position ']);
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Ordered instance of Towards Condition ');
ylabel('Distance (in.)');
ylim([0,2]);
saveas(f,[pwd,'\output\','Group towards pos.jpg']);
close(f);
f = figure();
plot(x,towavgGuess{1}(:),x,towavgGuess{2}(:),x,towavgGuess{3}(:),x,towavgGuess{4}(:),'LineWidth',2);
title(['Towards Percentage Correct Predication']);
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Trial Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Group Towards Guess.jpg']);
close(f);
f = figure();
plot(x,towavgAnswer{1}(:),x,towavgAnswer{2}(:),x,towavgAnswer{3}(:),x,towavgAnswer{4}(:),'LineWidth',2);
title(['Towards Percentage Correct Response ']);
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Trial Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Group towards answer.jpg']);
close(f);
f = figure();
plot(x,awayavgPos{1}(:),x,awayavgPos{2}(:),x,awayavgPos{3}(:),x,awayavgPos{4}(:),'LineWidth',2);
title(['Away Average Position ']);
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Ordered instance of Away Condition');
ylabel('Distance (in.)');
ylim([0,2]);
saveas(f,[pwd,'\output\','Group away pos.jpg']);
close(f);
f = figure();
plot(x,awayavgGuess{1}(:),x,awayavgGuess{2}(:),x,awayavgGuess{3}(:),x,awayavgGuess{4}(:),'LineWidth',2);
title(['Away Percentage Correct Predication']);
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Trial Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Group away Guess.jpg']);
close(f);
f = figure();
plot(x,awayavgAnswer{1}(:),x,awayavgAnswer{2}(:),x,awayavgAnswer{3}(:),x,awayavgAnswer{4}(:),'LineWidth',2);
title(['Away Percentage Correct Response']);
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Trial Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Group away answer.jpg']);
close(f);
