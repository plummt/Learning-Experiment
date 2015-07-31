function [t,data,s] = learningExpSave(t,folder)
%LEARNINGEXPSAVE Saves the learningExp data to the folder specified 
%   
%
% Syntax:  
%       learningExpGraph(t,pwd);
%
% Inputs:
%       t - a struct with 9 fields
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
%
%    
% Outputs:
%
%
%
% Other m-files required:
% Subfunctions: 
% MAT-files required: 

% Author: Timothy Plummer
% email: plummt@rpi.edu
% Created:  
%Last revision: 
g1 = {};
g2 = {};
g3 = {};
g4 = {};

for i1 = 1:length(t.data)
    if exist(fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']),'file') ~= 2
        writetable(t.data{i1},fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']));
    end
    groupid = t.data{i1}.groupNum(1);
    switch groupid
        case 1
            g1 = [g1,i1];
        case 2
            g2 = [g2,i1];
        case 3
            g3 = [g3,i1];
        case 4
            g4 = [g4,i1];
    end
    A{i1} = struct2table(t.results{i1});
    if exist(fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']),'file') ~= 2
        writetable(A{i1},fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']),'sheet',1,'range',['A' num2str(height(t.data{i1})+3)]);
        
        time = {'StartTime','EndTime';t.time{i1}{1,1},t.time{i1}{2,1}};
        xlswrite(fullfile(folder,'output', [t.name{i1}(1:end-3), 'xlsx']),time,1,...
            ['A' num2str(height(t.data{i1})+9)]);
    end
end
s = struct('g1',[],'g2',[],'g3',[],'g4',[]);
[data.table1,s.g1] = groupBuilder(t, g1);
[data.table2,s.g2] = groupBuilder(t, g2);
[data.table3,s.g3] = groupBuilder(t, g3);
[data.table4,s.g4] = groupBuilder(t, g4);
data = [data.table1;data.table2;data.table3;data.table4];

t.group1 = struct2table(s.g1.results);
t.group2 = struct2table(s.g2.results);
t.group3 = struct2table(s.g3.results);
t.group4 = struct2table(s.g4.results);

writetable(t.group1,fullfile(folder,'output','Averages.xlsx'),'sheet',1,'range','A1');
writetable(t.group2,fullfile(folder,'output','Averages.xlsx'),'sheet',1,'range','A7');
writetable(t.group3,fullfile(folder,'output','Averages.xlsx'),'sheet',1,'range','A13');
writetable(t.group4,fullfile(folder,'output','Averages.xlsx'),'sheet',1,'range','A19');
writetable(data,fullfile(folder,'output','LearningExperimentData.xlsx'),'sheet',1,'range','A1');

end