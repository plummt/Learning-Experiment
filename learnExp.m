function [t,data,s,means] = learnExp()
%LEARNEXP compiles and generates graphs and data for the LearnEXP.
%
% SYNOPSIS: [ t,data,s ] = learnExp( )
%
% INPUT none
%
% OUTPUT t - a struct with 9 fields
%			data - cells in subject order of the data from each experiment
%			name - the file name of the original data sourse
%			results - structs in subject order of the means and medians across
%                     each of the four sections.
%			time - cells in subject order of the start and end times for each
%			       experiment.
%			finalNote - cells that can contain any notes the experimentor
%			            felt needed to be added.
%
%		data - a large table containing all of the subjects data points
%		s - a struct with 4 fields each with the following structure
%           g[n] - where n is between 1 and 4 standing for the 4 groups
%               all - 4 tables of the 4 diffrent sectsions
%               towards - 4 tables of the 4 diffrent sections using only the
%		                  towards data.
%               away - 4 tables of the 4 diffrent sections using only the
%			           away data.
%			              results - a struct filled with the mean and medians from the
%			                   different sections.
%
% REMARKS
%
% created with MATLAB ver.: 8.4.0.150421 (R2014b)
% Microsoft Windows 7 Professional  Version 6.1 (Build 7601: Service Pack 1)
%
% created by: Timothy Plummer
% DATE: 21-July-2015

load('learningExpDataNonCompliance.mat');
folder = pwd;
t = addNewData(t); %#ok<NODEF>
t = correctPosition(t);
save('learningExpData.mat','t');
sectionSize = 12;
g{1} = {};
g{2} = {};
g{3} = {};
g{4} = {};
g{5} = {};
data = table();

for i1 = 1:length(t.data)
    workingTable = t.data{i1};
    trials = height(workingTable);
    section = workingTable.sectionNum(1);
    group = workingTable.groupNum(1);
    sectionNum = zeros(height(workingTable),1);
    groupNum = zeros(height(workingTable),1);
    
    if ~(mod(trials,sectionSize)==0)
        error('Section size does not divide size of data');
    end
    correctGuess = zeros(trials,1);
    correctAnswer = zeros(trials,1);
    percentGuess = zeros(trials,1);
    percentAnswer = zeros(trials,1);
    towardsCount = []; %#ok<*NASGU>
    awayCount = [];
    r.Guess = zeros(trials/sectionSize,1);
    r.Answer = zeros(trials/sectionSize,1);
    r.AvgPos = zeros(trials/sectionSize,1);
    r.StdPos = zeros(trials/sectionSize,1);
    r.towardsCount = zeros(trials/sectionSize,1);
    r.towardsGuess= zeros(trials/sectionSize,1);
    r.towardsAnswer = zeros(trials/sectionSize,1);
    r.towardsAvgPos = zeros(trials/sectionSize,1);
    r.towardsStdPos = zeros(trials/sectionSize,1);
    r.awayCount = zeros(trials/sectionSize,1);
    r.awayGuess= zeros(trials/sectionSize,1);
    r.awayAnswer = zeros(trials/sectionSize,1);
    r.awayAvgPos = zeros(trials/sectionSize,1);
    r.awayStdPos = zeros(trials/sectionSize,1);
    for i2 = 1:trials
        direction = workingTable.Direction(i2);
        guess = workingTable.Guess(i2);
        answer = workingTable.Answer(i2);
        missed = workingTable.Missed(i2);
        correctGuess(i2) = (guess==direction);
        correctAnswer(i2) = (answer == direction) && (missed == 0);
        percentGuess(i2) = sum(correctGuess)/i2;
        percentAnswer(i2) = sum(correctAnswer)/i2;
        if direction == 1
            towardsCount = [towardsCount;i2];
        elseif direction == 0
            awayCount = [awayCount;i2];
        end
        switch section
            case 1
                sectionNum(i2) = 1;
            case 2
                sectionNum(i2) = 2;
            case 3
                sectionNum(i2) = 3;
            case 4
                sectionNum(i2) = 4;
            case 5
                sectionNum(i2) = 5;
            otherwise
                
        end
        
        switch group
            case 1
                groupNum(i2) = 1;
            case 2
                groupNum(i2) = 2;
            case 3
                groupNum(i2) = 3;
            case 4
                groupNum(i2) = 4;
            case 5
                groupNum(i2) = 5;
        end
        
        if mod(i2,sectionSize) == 0
            totalGuess = sum(correctGuess(i2-(sectionSize-1):i2));
            r.Guess(i2/(sectionSize),1) = totalGuess/(sectionSize);
            groupAnswer = sum(correctAnswer(i2-(sectionSize-1):i2));
            r.Answer(i2/(sectionSize),1) = groupAnswer/(sectionSize);
            groupPos = sum(workingTable.Position(i2-(sectionSize-1):i2));
            r.AvgPos(i2/sectionSize,1) = groupPos/sectionSize;
            r.StdPos(i2/sectionSize,1) = std(workingTable.Position(i2-(sectionSize-1):i2));
            if ~isempty(towardsCount)
                r.towardsCount(i2/sectionSize,1) = length(towardsCount);
                towardsGuess = sum(correctGuess(towardsCount));
                r.towardsGuess(i2/sectionSize,1) = towardsGuess/length(towardsCount);
                towardsAnswer = sum(correctAnswer(towardsCount));
                r.towardsAnswer(i2/sectionSize,1) = towardsAnswer/length(towardsCount);
                towardsPos = sum(workingTable.Position(towardsCount));
                r.towardsAvgPos(i2/sectionSize,1) = towardsPos/length(towardsCount);
                r.towardsStdPos(i2/sectionSize,1) = std(workingTable.Position(towardsCount));
                
                towardsCount = [];
            end
            if ~isempty(awayCount)
                r.awayCount(i2/sectionSize,1) = length(awayCount);
                awayGuess = sum(correctGuess(awayCount));
                r.awayGuess(i2/sectionSize,1) = awayGuess/length(awayCount);
                awayAnswer = sum(correctAnswer(awayCount));
                r.awayAnswer(i2/sectionSize,1) = awayAnswer/length(awayCount);
                awayPos = sum(workingTable.Position(awayCount));
                r.awayAvgPos(i2/sectionSize,1) = awayPos/length(awayCount);
                r.awayStdPos(i2/sectionSize,1) = std(workingTable.Position(awayCount));
                
                awayCount = [];
            end
        end
        
    end
    switch group
        case 1
            g{1} = [g{1},i1];
        case 2
            g{2} = [g{2},i1];
        case 3
            g{3} = [g{3},i1];
        case 4
            g{4} = [g{4},i1];
        case 5
            g{5} = [g{5},i1];
            
    end
    workingTable.correctGuess= correctGuess;
    workingTable.correctAnswer = correctAnswer;
    workingTable.percentGuess= percentGuess;
    workingTable.percentAnswer = percentAnswer;
    workingTable.sectionNum = sectionNum;
    workingTable.groupNum = groupNum;
    data = [data;workingTable]; %#ok<*AGROW>
    t.data{i1} = workingTable;
    t.results{i1} = r;
    r = struct();
end

savedata(t);
s = struct();
for i1 = 1:5
    newTable = table();
    
    for i2 = 1:length(g{i1})
        newTable = [newTable;t.data{g{i1}{i2}}];
    end
    
    s.group{i1}.data = newTable;
    s.group{i1}.results = struct('Guess',zeros(4,1),'Answer',zeros(4,1),...
        'MedPos',zeros(4,1),'AvgPos',zeros(4,1),'StdPos',zeros(4,1),...
        'towardsGuess',zeros(4,1),'towardsAnswer',zeros(4,1),...
        'towardsMedPos',zeros(4,1),'towardsAvgPos',zeros(4,1),'towardsStdPos',zeros(4,1),...
        'awayGuess',zeros(4,1),'awayAnswer',zeros(4,1),...
        'awayMedPos',zeros(4,1),'awayAvgPos',zeros(4,1),'awayStdPos',zeros(4,1));
    s.group{i1}.section{1} = [];
    s.group{i1}.section{2} = [];
    s.group{i1}.section{3} = [];
    s.group{i1}.section{4} = [];
    s.group{i1}.towards{1} = [];
    s.group{i1}.towards{2} = [];
    s.group{i1}.towards{3} = [];
    s.group{i1}.towards{4} = [];
    s.group{i1}.away{1} = [];
    s.group{i1}.away{2} = [];
    s.group{i1}.away{3} = [];
    s.group{i1}.away{4} = [];
    s.group{i1}.mean = [];
    for i3 = 1:height(s.group{i1}.data)
        switch s.group{i1}.data.Trial(i3)
            case {1,2,3,4,5,6,7,8,9,10,11,12}
                s.group{i1}.section{1} = [s.group{i1}.section{1};s.group{i1}.data(i3,1:end)];
                if s.group{i1}.data.Direction(i3) == 1
                    s.group{i1}.towards{1} = [s.group{i1}.towards{1};s.group{i1}.data(i3,1:end)];
                else
                    s.group{i1}.away{1} = [s.group{i1}.away{1};s.group{i1}.data(i3,1:end)];
                end
            case {13,14,15,16,17,18,19,20,21,22,23,24}
                s.group{i1}.section{2} = [s.group{i1}.section{2};s.group{i1}.data(i3,1:end)];
                if s.group{i1}.data.Direction(i3) == 1
                    s.group{i1}.towards{2} = [s.group{i1}.towards{2};s.group{i1}.data(i3,1:end)];
                else
                    s.group{i1}.away{2} = [s.group{i1}.away{2};s.group{i1}.data(i3,1:end)];
                end
            case {25,26,27,28,29,30,31,32,33,34,35,36}
                s.group{i1}.section{3} = [s.group{i1}.section{3};s.group{i1}.data(i3,1:end)];
                if s.group{i1}.data.Direction(i3) == 1
                    s.group{i1}.towards{3} = [s.group{i1}.towards{3};s.group{i1}.data(i3,1:end)];
                else
                    s.group{i1}.away{3} = [s.group{i1}.away{3};s.group{i1}.data(i3,1:end)];
                end
            case {37,38,39,40,41,42,43,44,45,46,47,48}
                s.group{i1}.section{4} = [s.group{i1}.section{4};s.group{i1}.data(i3,1:end)];
                if s.group{i1}.data.Direction(i3) == 1
                    s.group{i1}.towards{4} = [s.group{i1}.towards{4};s.group{i1}.data(i3,1:end)];
                else
                    s.group{i1}.away{4} = [s.group{i1}.away{4};s.group{i1}.data(i3,1:end)];
                end
        end
    end
    
end
for i = 1:length(s.group)
    for j = 1:length(s.group{i}.section)
        s.group{i}.mean = mean(s.group{i}.data.correctedPosition);
        s.group{i}.results.Guess(j) = mean(s.group{i}.section{j}.correctGuess);
        s.group{i}.results.Answer(j) = mean(s.group{i}.section{j}.correctAnswer);
        s.group{i}.results.AvgPos(j) = mean(s.group{i}.section{j}.correctedPosition/s.group{i}.mean);
        s.group{i}.results.MedPos(j) = median(s.group{i}.section{j}.correctedPosition/s.group{i}.mean);
        s.group{i}.results.StdPos(j) = std(s.group{i}.section{j}.correctedPosition/s.group{i}.mean);
        
        s.group{i}.results.towardsGuess(j) = mean(s.group{i}.towards{j}.correctGuess);
        s.group{i}.results.towardsAnswer(j) = mean(s.group{i}.towards{j}.correctAnswer);
        s.group{i}.results.towardsAvgPos(j) = mean(s.group{i}.towards{j}.correctedPosition/s.group{i}.mean);
        s.group{i}.results.towardsMedPos(j) = median(s.group{i}.towards{j}.correctedPosition/s.group{i}.mean);
        s.group{i}.results.towardsStdPos(j) = std(s.group{i}.towards{j}.correctedPosition/s.group{i}.mean);
        
        s.group{i}.results.awayGuess(j) = mean(s.group{i}.away{j}.correctGuess);
        s.group{i}.results.awayAnswer(j) = mean(s.group{i}.away{j}.correctAnswer);
        s.group{i}.results.awayAvgPos(j) = mean(s.group{i}.away{j}.correctedPosition/s.group{i}.mean);
        s.group{i}.results.awayMedPos(j) = median(s.group{i}.away{j}.correctedPosition/s.group{i}.mean);
        s.group{i}.results.awayStdPos(j) = std(s.group{i}.away{j}.correctedPosition/s.group{i}.mean);
        
    end
end

%% output the new numbers if needed
means = outputLearningExp(t,data,s,folder);
t = addInputs(t);
save('learningExpData.mat','t');
end
