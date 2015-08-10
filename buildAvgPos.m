function s = buildAvgPos(s)
for i1 = 1:length(s.group)
    Posis = zeros(48,1);
    guess = zeros(48,1);
    answer = zeros(48,1);
    trial = zeros(48,1);
    for i2 = 1:height(s.group{i1}.data)
        Posis(s.group{i1}.data.Trial(i2),1) = Posis(s.group{i1}.data.Trial(i2),1) + s.group{i1}.data.Position(i2);
        guess(s.group{i1}.data.Trial(i2),1) = guess(s.group{i1}.data.Trial(i2),1) + s.group{i1}.data.correctGuess(i2);
        answer(s.group{i1}.data.Trial(i2),1) = answer(s.group{i1}.data.Trial(i2),1) + s.group{i1}.data.correctAnswer(i2);
        trial(s.group{i1}.data.Trial(i2),1) = trial(s.group{i1}.data.Trial(i2),1) +1;
    end
    avgPos = zeros(48,1);
    avgGuess = zeros(48,1);
    avgAnswer = zeros(48,1);
   
    for i3 = 1:length(trial)
        avgPos(i3) = Posis(i3,1)/trial(i3,1);
        avgGuess(i3) = guess(i3,1)/trial(i3,1);
        avgAnswer(i3) = answer(i3,1)/trial(i3,1);
    end
    means = zeros(48,1);
    for i2 = 1:48
        if i2 == 1
            means(i2) = mean(avgPos(i2:i2+2));
        elseif i2 == 2
            means(i2) = mean(avgPos(i2-1:i2+2));
        elseif i2 == 47
            means(i2) = mean(avgPos(i2-2:i2+1));
        elseif i2 == 48
            means(i2) = mean(avgPos(i2-2:i2));
        else
            means(i2) = mean(avgPos(i2-2:i2+2));
        end
    end
    f = figure();
    x=1:48;
    plot(x,avgPos(:),x,means,x,avgGuess(:),x,avgAnswer(:));
    title(['Group ', num2str(i1)]);
    legend('Posistion','Mean Pos','Guess','Answer','Location','southoutside','Orientation','horizontal');
    xlabel('Trial Number');
    ylabel('Percentage');
    saveas(f,[pwd,'\output\','Group ',num2str(i1),'.jpg']);
end