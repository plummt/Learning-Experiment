function [ ] = learningExpGraph( t, folder)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

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
end
end

