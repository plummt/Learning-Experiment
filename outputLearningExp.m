function [means] = outputLearningExp(t,data,s,folder)
if exist(fullfile(folder,'output'),'dir') ~= 7
    mkdir(fullfile(folder,'output'));
end
rightDist = [1.125 2.125 3.125 4.125];
leftDist = [1.125-.25 2.125-.25 3.125-.25 4.125-.25];
for i1 = 1:length(t.data)
    f = figure( 'PaperPositionMode','auto',...
        'PaperOrientation','landscape',...
        'Position',[50 0 1200 800]);
    age = num2str(t.data{i1}.subjectAge(1));
    uicontrol(f,'Style','text','String',[t.name{1,i1}(1:end-4),' Age:',age],...
        'units','normalized','Position',[.5-(.25/2) .951 .3 .035],'FontSize',15);
    hold on;
    subplot(2,2,1)
    bar([t.results{i1}.Guess,t.results{i1}.AvgPos]);
    title('Subject Guess with Mean Pos.');
    axis([0,5,0,1]);
    xlabel( 'Group of 10 seq. Trials');
    legend('Guess %','Dist. traveled');
    hold on;
    err=errorbar(rightDist,t.results{i1}.AvgPos,t.results{i1}.StdPos);
    set(err,'linestyle','none')
    subplot(2,2,2)
    bar([t.results{i1}.Answer,t.results{i1}.AvgPos]);
    title('Subject Answer with Mean Pos.');
    axis([0,5,0,1]);
    xlabel( 'Group of 10 seq. Trials');
    legend('Answer %','Dist. traveled');
    hold on;
    err=errorbar(rightDist,t.results{i1}.AvgPos,t.results{i1}.StdPos);
    set(err,'linestyle','none')
    subplot(2,2,3)
    bar([t.results{i1}.towardsAvgPos,t.results{i1}.awayAvgPos]);
    title('Towards  and Away Dist. traveled');
    axis([0,5,0,1]);
    xlabel( 'Group of 10 seq. Trials');
    legend('Towards','Away');
    hold on;
    err=errorbar(leftDist,t.results{i1}.towardsAvgPos,t.results{i1}.towardsStdPos);
    set(err,'linestyle','none')
    err=errorbar(rightDist,t.results{i1}.awayAvgPos,t.results{i1}.awayStdPos);
    set(err,'linestyle','none')
    userData = [t.results{i1}.Guess,t.results{i1}.Answer,t.results{i1}.AvgPos,...
        t.results{i1}.towardsAvgPos,t.results{i1}.awayAvgPos];
    tab = uitable('ColumnName',{'Guess','Answer','DistTraveled','Towards','Away'},...
        'RowName',{'Group1','Group2','Group3','Group4'},...
        'data',userData,...
        'units','normalized');
    tab.Position(1:3) = [.54 .1 tab.Position(3)+.13];
    if exist(fullfile(folder,'output', [t.name{i1}(1:end-3), 'pdf']),'file') ~= 2
        saveas(f,fullfile(folder,'output', [t.name{i1}(1:end-3), 'pdf']));
    end
    close(f);
    x=1:48;
    f = figure();
    
    means = [];
    for i2 = 1:48
        if i2 == 1
            means(i2) = mean(t.data{i1}.Position(i2:i2+2));
        elseif i2 == 2
            means(i2) = mean(t.data{i1}.Position(i2-1:i2+2));
        elseif i2 == 47
            means(i2) = mean(t.data{i1}.Position(i2-2:i2+1));
        elseif i2 == 48
            means(i2) = mean(t.data{i1}.Position(i2-2:i2));
        else
            means(i2) = mean(t.data{i1}.Position(i2-2:i2+2));
        end
    end
    plot(x,t.data{i1}.Position(:),x,means,x,t.data{i1}.percentGuess(:),x,t.data{i1}.percentAnswer(:));
    title(t.name{i1});
    legend('Posistion','Mean Pos','Guess','Answer','Location','southoutside','Orientation','horizontal');
    if exist(fullfile(folder,'output', [t.name{i1}(1:end-3), 'jpg']),'file') ~= 2
        saveas(f,[pwd,'\output\',t.name{i1}(1:end-3),'jpg']);
    end
    close(f)
end
for i1 = 1:length(t.data)
    if exist(fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']),'file') ~= 2
        writetable(t.data{i1},fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']));
    end
    
    A{i1} = struct2table(t.results{i1});
    if exist(fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']),'file') ~= 2
        writetable(A{i1},fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']),'sheet',1,'range',['A' num2str(height(t.data{i1})+3)]);
        
        time = {'StartTime','EndTime';t.time{i1}{1,1},t.time{i1}{2,1}};
        xlswrite(fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']),time,1,...
            ['A' num2str(height(t.data{i1})+9)]);
    end
end
writetable(data,fullfile(folder,'output','LearningExperimentData.xlsx'),'sheet',1,'range','A1');
t.group1 = struct2table(s.group{1}.results);
t.group2 = struct2table(s.group{2}.results);
t.group3 = struct2table(s.group{3}.results);
t.group4 = struct2table(s.group{4}.results);
writetable(t.group1,fullfile(folder,'output','Averages.xlsx'),'sheet',1,'range','A1');
writetable(t.group2,fullfile(folder,'output','Averages.xlsx'),'sheet',1,'range','A7');
writetable(t.group3,fullfile(folder,'output','Averages.xlsx'),'sheet',1,'range','A13');
writetable(t.group4,fullfile(folder,'output','Averages.xlsx'),'sheet',1,'range','A19');
end