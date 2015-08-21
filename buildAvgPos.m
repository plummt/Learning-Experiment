
for i1 = 1:length(s.group)
    Posis = zeros(48,1);
    guess = zeros(48,1);
    answer = zeros(48,1);
    trial = zeros(48,1);
    for i2 = 1:height(s.group{i1}.data)
        Posis(s.group{i1}.data.Trial(i2),1) = Posis(s.group{i1}.data.Trial(i2),1) + s.group{i1}.data.correctedPosition(i2);
        guess(s.group{i1}.data.Trial(i2),1) = guess(s.group{i1}.data.Trial(i2),1) + s.group{i1}.data.correctGuess(i2);
        answer(s.group{i1}.data.Trial(i2),1) = answer(s.group{i1}.data.Trial(i2),1) + s.group{i1}.data.correctAnswer(i2);
        trial(s.group{i1}.data.Trial(i2),1) = trial(s.group{i1}.data.Trial(i2),1) +1;
    end
    
    avgPos{i1} = zeros(48,1);
    avgGuess{i1} = zeros(48,1);
    avgAnswer{i1} = zeros(48,1);
   
    for i3 = 1:length(trial)
        avgPos{i1}(i3) = Posis(i3,1)/trial(i3,1);
        avgGuess{i1}(i3) = sum(guess(1:i3,1))/sum(trial(1:i3,1));
        avgAnswer{i1}(i3) = sum(answer(1:i3,1))/sum(trial(1:i3,1));
    end
    means = zeros(48,1);
    for i2 = 1:48
        if i2 == 1
            means(i2) = mean(avgPos{i1}(i2:i2+2));
        elseif i2 == 2
            means(i2) = mean(avgPos{i1}(i2-1:i2+2));
        elseif i2 == 47
            means(i2) = mean(avgPos{i1}(i2-2:i2+1));
        elseif i2 == 48
            means(i2) = mean(avgPos{i1}(i2-2:i2));
        else
            means(i2) = mean(avgPos{i1}(i2-2:i2+2));
        end
    end
end
    f = figure();
    x=1:48;
 %% fix this to new system 
    plot(x,avgPos{1}(:),x,avgPos{2}(:),x,avgPos{3}(:),x,avgPos{4},'LineWidth',2);
    title(['Group Average Position']);
    legend('Group 1','Group 2','Group 3','Group 4','Location','southoutside','Orientation','horizontal');
    xlabel('Trial Number');
    ylabel('Distance (in.)');
    ylim([0,(57/1.59)]);
    saveas(f,[pwd,'\output\','Group average pos.jpg']);
    close(f);
    f = figure();
    plot(x,avgGuess{1}(:),x,avgGuess{2}(:),x,avgGuess{3}(:),x,avgGuess{4},'LineWidth',2);
    title(['Group Percentage Correct Predications']);
    legend('Group 1','Group 2','Group 3','Group 4','Location','southoutside','Orientation','horizontal');
    xlabel('Trial Number');
    ylabel('Percentage');
    ylim([0,1]);
    saveas(f,[pwd,'\output\Group avg guess.jpg']);
    close(f);
    f = figure();
    plot(x,avgAnswer{1}(:),x,avgAnswer{2}(:),x,avgAnswer{3}(:),x,avgAnswer{4},'LineWidth',2);
    title(['Group Percent Correct Response']);
    legend('Group 1','Group 2','Group 3','Group 4','Location','southoutside','Orientation','horizontal');
    xlabel('Trial Number');
    ylabel('Percentage');
    ylim([0,1]);
    saveas(f,[pwd,'\output\','Group avg answer.jpg']);
    close(f);
