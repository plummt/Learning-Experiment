function [tables] = generateJohnTables(s)
tables = struct('exp1correctDirPerdiction' , {cell(4)},...
    'exp1correctDirResponse',{cell(4)},...
    'exp1meanResponseDistTotal',{cell(4,8)},...
    'exp1meanResponseDist1hz',{cell(4,8)},...
    'exp1meanResponseDist4hz',{cell(4,8)},...
    'exp2meanResponseDistTotal',{cell(1,8)},...
    'exp2meanResponseDist1hzTowards',{cell(1,8)},...
    'exp2meanResponseDist1hzAway',{cell(1,8)},...
    'exp2meanResponseDist4hzTowards',{cell(1,8)},...
    'exp2meanResponseDist4hzAway',{cell(1,8)},...
    'exp1nValuesTotal',{cell(4,1)},...
    'exp1nValues1hz',{cell(4,1)},...
    'exp1nValues4hz',{cell(4,1)},...
    'exp2nValuesTotal',{cell(4,1)},...
    'exp2nValues1hzToward',{cell(4,1)},...
    'exp2nValues1hzAway',{cell(4,1)},...
    'exp2nValues4hzToward',{cell(4,1)},...
    'exp2nValues4hzAway',{cell(4,1)});

for iGroup = 1:5
    groupData = s.group{iGroup}.data;
    trialGroups = cell(1,4);
    % generate data Splits
    for iGroupData = 1:height(groupData)
        if groupData.Trial(iGroupData) <=12
            trialGroups{1} = [trialGroups{1};groupData(iGroupData,:)];
        elseif groupData.Trial(iGroupData) <=24
            trialGroups{2} = [trialGroups{2};groupData(iGroupData,:)];
        elseif groupData.Trial(iGroupData) <=36
            trialGroups{3} = [trialGroups{3};groupData(iGroupData,:)];
        elseif groupData.Trial(iGroupData) <=48
            trialGroups{4} = [trialGroups{4};groupData(iGroupData,:)];
        end
    end
    % calc cells required.
    if iGroup == 5
        %%
        for iTrialGroup =1:length(trialGroups)
            tables.exp2meanResponseDistTotal{1,iTrialGroup}= mean(trialGroups{iTrialGroup}.correctedPosition);
            tables.exp2meanResponseDistTotal{1,iTrialGroup+4}= (std(trialGroups{iTrialGroup}.correctedPosition))/(sqrt(height(trialGroups{iTrialGroup})));
            tables.exp2nValuesTotal{iTrialGroup,1} = height(trialGroups{iTrialGroup});
            oneHz = table;
            fourHz = table;
            oneHzAway = table;
            fourHzAway = table;
            oneHzToward = table;
            fourHzToward = table;
            for iFreqSplit = 1:height(trialGroups{iTrialGroup})
                if trialGroups{iTrialGroup}.Frequency(iFreqSplit) == 2
                    oneHz = [oneHz;trialGroups{iTrialGroup}(iFreqSplit,:)];
                else 
                    fourHz = [fourHz;trialGroups{iTrialGroup}(iFreqSplit,:)];
                end
            end
            % one hz dir Split
            for iDirSplit = 1:height(oneHz)
                if oneHz.Direction(iDirSplit) == 1
                    oneHzToward = [oneHzToward;oneHz(iDirSplit,:)];
                else
                    oneHzAway = [oneHzAway;oneHz(iDirSplit,:)];
                end
            end
            % four hz dir split
            for iDirSplit = 1:height(fourHz)
                if fourHz.Direction(iDirSplit) == 1
                    fourHzToward = [fourHzToward;fourHz(iDirSplit,:)];
                else
                    fourHzAway = [fourHzAway;fourHz(iDirSplit,:)];
                end
            end
            tables.exp2meanResponseDist1hzTowards{1,iTrialGroup}= mean(oneHzToward.correctedPosition);
            tables.exp2meanResponseDist1hzTowards{1,iTrialGroup+4}= (std(oneHzToward.correctedPosition))/(sqrt(height(oneHzToward)));
            tables.exp2meanResponseDist4hzTowards{1,iTrialGroup}= mean(fourHzToward.correctedPosition);
            tables.exp2meanResponseDist4hzTowards{1,iTrialGroup+4}= (std(fourHzToward.correctedPosition))/(sqrt(height(fourHzToward)));
            tables.exp2meanResponseDist1hzAway{1,iTrialGroup}= mean(oneHzAway.correctedPosition);
            tables.exp2meanResponseDist1hzAway{1,iTrialGroup+4}= (std(oneHzAway.correctedPosition))/(sqrt(height(oneHzAway)));
            tables.exp2meanResponseDist4hzAway{1,iTrialGroup}= mean(fourHzAway.correctedPosition);
            tables.exp2meanResponseDist4hzAway{1,iTrialGroup+4}= (std(fourHzAway.correctedPosition))/(sqrt(height(fourHzAway)));
            tables.exp2nValues1hzToward{iTrialGroup,1} = height(oneHzToward);
            tables.exp2nValues1hzAway{iTrialGroup,1} = height(oneHzAway);
            tables.exp2nValues4hzToward{iTrialGroup,1} = height(fourHzToward);
            tables.exp2nValues4hzAway{iTrialGroup,1} = height(fourHzAway);
        end
    else
        %% groups 1 through 4
        for iTrialGroup =1:length(trialGroups)
            tables.exp1correctDirPerdiction{iGroup,iTrialGroup} = mean(trialGroups{iTrialGroup}.correctGuess)*100;
            tables.exp1correctDirResponse{iGroup,iTrialGroup}= mean(trialGroups{iTrialGroup}.correctAnswer)*100;
            tables.exp1meanResponseDistTotal{iGroup,iTrialGroup}= mean(trialGroups{iTrialGroup}.correctedPosition);
            tables.exp1meanResponseDistTotal{iGroup,iTrialGroup+4}= (std(trialGroups{iTrialGroup}.correctedPosition))/(sqrt(height(trialGroups{iTrialGroup})));
            tables.exp1nValuesTotal{iGroup,iTrialGroup} = height(trialGroups{iTrialGroup});
            oneHz = table;
            fourHz = table;
            for iFreqSplit = 1:height(trialGroups{iTrialGroup})
                if trialGroups{iTrialGroup}.Frequency(iFreqSplit) == 2
                    oneHz = [oneHz;trialGroups{iTrialGroup}(iFreqSplit,:)];
                elseif trialGroups{iTrialGroup}.Frequency(iFreqSplit) == 3
                    fourHz = [fourHz;trialGroups{iTrialGroup}(iFreqSplit,:)];
                else
                end
            end
            
            tables.exp1meanResponseDist1hz{iGroup,iTrialGroup}= mean(oneHz.correctedPosition);
            tables.exp1meanResponseDist1hz{iGroup,iTrialGroup+4}= (std(oneHz.correctedPosition))/(sqrt(height(oneHz)));
            tables.exp1meanResponseDist4hz{iGroup,iTrialGroup}= mean(fourHz.correctedPosition);
            tables.exp1meanResponseDist4hz{iGroup,iTrialGroup+4}= (std(fourHz.correctedPosition))/(sqrt(height(fourHz)));
            tables.exp1nValues1hz{iGroup,iTrialGroup} = height(oneHz);
            tables.exp1nValues4hz{iGroup,iTrialGroup} = height(fourHz);
        end
    end
end
end