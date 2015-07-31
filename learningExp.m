function [ t,data,s ] = learningExp( )
%LEARNINGEXP - compiles and generates graphs and data for the LearningEXP.
%
%
% Syntax:  [t, data, s ] = learningExp( )
%
% Inputs:
%    None
% Outputs:
%    t - a struct with 9 fields
%         data - cells in subject order of the data from each experiment
%         name - the file name of the original data sourse
%         results - structs in subject order of the means and medians
%              across each of the four sections.
%         time - cells in subject order of the start and end times for each
%              experiment.
%         finalNote - cells that can contain any notes the experimentor
%              felt needed to be added.
%         group1 - table of the means and medians across each of the four
%              sections for the first group.
%         group2 - table of the means and medians across each of the four
%              sections for the second group.
%         group3 - table of the means and medians across each of the four
%              sections for the third group.
%         group4 - table of the means and medians across each of the four
%              sections for the fourth group.
%    data - a large table containing all of the subjects data points
%    s - a struct with 4 fields each with the following structure
%         g[n] - where n is between 1 and 4 standing for the 4 groups
%              all - 4 tables of the 4 diffrent sectsions
%              towards - 4 tables of the 4 diffrent sections using only the
%                   towards data.
%              away - 4 tables of the 4 diffrent sections using only the
%                   awat data.
%              results - a struct filled with the mean and medians from the
%                   different sections.
%
% Other m-files required: learningExpDataNonCompliance.mat
% Subfunctions: learningExpGraph, learningExpSave
% MAT-files required: learningExpDataNonCompliance.mat
%
load('learningExpDataNonCompliance.mat');
folder = pwd;

for i1 = 1:length(t.data)
    workingTable = t.data{i1};
    trials = height(workingTable);
    correctGuess = zeros(trials,1);
    correctAnswer = zeros(trials,1);
    percentGuess = zeros(trials,1);
    percentAnswer = zeros(trials,1);
    towardsCount = [];
    awayCount = [];
    for i2 = 1:trials
        if workingTable.Direction(i2) == 1
            towardsCount = [towardsCount;i2];
        elseif workingTable.Direction(i2) == 0
            awayCount = [awayCount;i2];
        end
        correctGuess(i2) = (workingTable.Direction(i2) == workingTable.Guess(i2))...
            && (workingTable.Missed(i2) == 0);
        correctAnswer(i2) = (workingTable.Direction(i2) == workingTable.Answer(i2))...
            && (workingTable.Missed(i2) == 0);
        totalGuess = sum(correctGuess);
        percentGuess(i2) = (totalGuess / i2);
        totalAnswer = sum(correctAnswer);
        percentAnswer(i2) = (totalAnswer / i2);
        if mod(i2,trials/4) == 0
            groupGuess = sum(correctGuess(i2-((trials/4)-1):i2));
            t.results{i1}.Guess(i2/(trials/4),1) = groupGuess/(trials/4);
            groupAnswer = sum(correctAnswer(i2-((trials/4)-1):i2));
            t.results{i1}.Answer(i2/(trials/4),1) = groupAnswer/(trials/4);
            groupPos = sum(workingTable.Position(i2-((trials/4)-1):i2));
            t.results{i1}.AvgPos(i2/(trials/4),1) = groupPos/(trials/4);
            t.results{i1}.StdPos(i2/(trials/4),1) = std(workingTable.Position(i2-((trials/4)-1):i2));
            if ~isempty(towardsCount)
                t.results{i1}.towardsCountDenom(i2/(trials/4),1) = length(towardsCount);
                towardsGuess = sum(correctGuess(towardsCount));
                t.results{i1}.towardsGuess(i2/(trials/4),1) = towardsGuess/length(towardsCount);
                towardsAnswer = sum(correctAnswer(towardsCount));
                t.results{i1}.towardsAnswer(i2/(trials/4),1) = towardsAnswer/length(towardsCount);
                towardsPos = sum(workingTable.Position(towardsCount));
                t.results{i1}.towardsAvgPos(i2/(trials/4),1) = towardsPos/length(towardsCount);
                t.results{i1}.towardsStdPos(i2/(trials/4),1) = std(workingTable.Position(towardsCount));
                
                towardsCount = [];
            end
            if ~isempty(awayCount)
                t.results{i1}.awayCountDenom(i2/(trials/4),1) = length(awayCount);
                awayGuess = sum(correctGuess(awayCount));
                t.results{i1}.awayGuess(i2/(trials/4),1) = awayGuess/length(awayCount);
                awayAnswer = sum(correctAnswer(awayCount));
                t.results{i1}.awayAnswer(i2/(trials/4),1) = awayAnswer/length(awayCount);
                awayPos = sum(workingTable.Position(awayCount));
                t.results{i1}.awayAvgPos(i2/(trials/4),1) = awayPos/length(awayCount);
                t.results{i1}.awayStdPos(i2/(trials/4),1) = std(workingTable.Position(awayCount));
                
                awayCount = [];
            end
        end
        
    end
    
    
    workingTable.correctGuess= correctGuess;
    workingTable.correctAnswer = correctAnswer;
    workingTable.percentGuess= percentGuess;
    workingTable.percentAnswer = percentAnswer;
    t.data{i1} = workingTable;
    
end
t = correctGroupAndSection(t);

learningExpGraph(t,folder);
pause(.1);
[t,data,s]=learningExpSave(t,folder);

end
