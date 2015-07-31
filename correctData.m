function [ T ] = correctData(folder)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if ~(exist(folder,'file') == 7)
    error('The specified folder does not exist');
end

fileList = dir(folder);
index = 0;
names = cell(length(fileList),1);
for i1 = 1:length(fileList)
    if fileList(i1).isdir == 0
        test1 = ~strcmpi(fileList(i1).name(end-8:end-4),'post');
        test2 = strcmpi(fileList(i1).name(end-3:end),'.txt');
        if test1 && test2
            index = index+1;
            names{index} = fileList(i1).name;
        end
    end
end
names(cellfun('isempty',names)) = [];
T = struct('data',[],'name',[],'results',[]);
for i2 = 1:length(names)
    T.name{i2} = names{i2};
    T.data{i2} = readtable([folder,'\',names{i2,1}],'Delimiter','\t','HeaderLines', 1);
    cellTable = table2cell(T.data{i2});
    f = figure('Position', [100 100 552 350]);
    uicontrol('Parent',     f,...
        'style',    'text',...
        'String',   [T.name{i2},char(10),...
        'Change the data that is incorrect if any,',char(10),...
        'when finished click outside the table and hit space.',char(10),...
        'Guess = Spoken, Answer = Key Press'],...
        'units',    'characters',...
        'Position', [0 22 120 5],...
        'HorizontalAlignment','center');
    
    newTable = uitable('Parent', f,...
        'Position',     [25 50 500 200],...
        'ColumnName',   {'Direction' 'Guess' 'Answer' 'Position' 'Missed' 'Early Ans' 'Early Time'},...
        'Data',         cellTable,...
        'ColumnEditable', [false true true false false true], ...
        'CellEditCallback',@cellEdit);
    pause;
    
    T.data{i2} = cell2table(newTable.Data,...
        'VariableNames',{'Direction' 'Guess' 'Answer' 'Position' 'Missed' ...
        'EarlyAns' 'EarlyTime'});
    T.data{i2}.Properties.VariableDescriptions = {'The Direction the deviced moved'...
        'The Guess the user gave'...
        'The key the user hit when they saw movement'...
        'The distance from the center point the user hit the button at'...
        'If they saw the device movement' ...
        'if they hit the button early'...
        'how early they hit the button'};
    close(f);
    writtenGuess = zeros(height(T.data{i2}),1);
    notes = cell(height(T.data{i2}),1);
    tempTable = table2cell(table(writtenGuess,notes));
    f = figure('Position', [100 100 552 350]);
    uicontrol('Parent',     f,...
        'style',    'text',...
        'String',   [T.name{i2},char(10),...
        'Change the data that is incorrect if any,',char(10),...
        'when finished click outside the table and hit space.',...
        char(10),'Guess = Spoken, Answer = Key Press'],...
        'units',    'characters',...
        'Position', [0 22 120 5],...
        'HorizontalAlignment','center');
    newTable = uitable('Parent', f,...
        'Position',     [25 50 500 200],...
        'ColumnName',   {'writtenGuess' 'Notes'},...
        'Data',         tempTable,...
        'ColumnEditable', [true true], ...
        'ColumnFormat',{{'0' '1'} [] },...
        'CellEditCallback',@cellEdit);
    pause;
    tempTable = cell2table(newTable.Data,...
        'VariableNames',{'writtenGuess' 'notes'});
    T.data{i2}.writtenGuess = tempTable.writtenGuess;
    T.data{i2}.note = tempTable.notes;
    close(f);
    T.time{i2} = inputdlg({'Start Time:','End Time:'},'Start and End Time',1,{'' ''});
    T.finalNote{i2} = inputdlg('What other notes do you have for this subject?','Notes',4,{''});
    age = str2double(inputdlg('How old was the subject?','age',1,{''}));
    subjectAge = ones(height(T.data{i2}),1) * age;
    subjectNum = ones(height(T.data{i2}),1)*eval(T.name{i2}(9:10));
    group = cell(height(T.data{i2}),1);
    group(:) = {T.name{i2}(18:20)};
    T.data{i2}.subjectAge = subjectAge;
    T.data{i2}.subjectNum = subjectNum;
    T.data{i2}.groupNum = group;
    instructions = ones(height(T.data{i2}),1);
    if strcmp(T.name{i2}(18),'1')
        instructions = instructions*0;
    elseif strcmp(T.name{i2}(18),'2')
        instructions = instructions*0;
    elseif strcmp(T.name{i2}(18),'3')
        instructions = instructions*1;
    elseif strcmp(T.name{i2}(18),'4')
        instructions = instructions*2;
    else
        instructions = instructions*-1;
    end
    T.data{i2}.Instructions = instructions;
    T.data{i2}.Trial = (1:height(T.data{i2}))';
end

end

function cellEdit(hObject,callbackdata)
try
    numval = eval(callbackdata.EditData);
    r = callbackdata.Indices(1);
    c = callbackdata.Indices(2);
    hObject.Data{r,c} = numval;
catch
    numval = callbackdata.EditData;
    r = callbackdata.Indices(1);
    c = callbackdata.Indices(2);
    hObject.Data{r,c} = numval;
end
end