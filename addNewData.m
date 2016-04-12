function t = addNewData(t)
folder = '\\ROOT\projects\NIOSH-WarningBeacons\Learning-Experiment\Data Files';
files = dir(folder);
files(1:2) = [];
del=[];
for i1 = 1:length(t.name)
    for i2 = 1:length(files)
        if strcmpi(t.name(i1),files(i2).name)
            del = [del,i2];
        end
        if ~isempty(strfind(files(i2).name,'10'))
            del = [del,i2];
        end
        if ~isempty(strfind(files(i2).name,'30'))
            del = [del,i2];
        end
        if ~isempty(strfind(files(i2).name,'33'))
            del = [del,i2];
        end
        if ~isempty(strfind(files(i2).name,'23'))
            del = [del,i2];
        end
    end
end
files(del) = [];


%% add way to correct data here
for i1 = 1:length(files)
i2 = length(t.name)+1;
name = files(i1).name;
t.name{i2} = name;
t.data{i2} = readtable([folder,'\',name],'Delimiter','\t','HeaderLines', 1);
cellTable = table2cell(t.data{i2});
f = figure('Position', [100 100 552 350]);
uicontrol('Parent',     f,...
    'style',    'text',...
    'String',   [t.name{i2},char(10),...
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

t.data{i2} = cell2table(newTable.Data,...
    'VariableNames',{'Direction' 'Guess' 'Answer' 'Position' 'Missed' ...
    'EarlyAns' 'EarlyTime'});
t.data{i2}.Properties.VariableDescriptions = {'The Direction the deviced moved'...
    'The Guess the user gave'...
    'The key the user hit when they saw movement'...
    'The distance from the center point the user hit the button at'...
    'If they saw the device movement' ...
    'if they hit the button early'...
    'how early they hit the button'};
close(f);
writtenGuess = t.data{i2}.Guess;
notes = cell(height(t.data{i2}),1);
tempTable = table2cell(table(writtenGuess,notes));
f = figure('Position', [100 100 552 350]);
uicontrol('Parent',     f,...
    'style',    'text',...
    'String',   [t.name{i2},char(10),...
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
t.data{i2}.writtenGuess = tempTable.writtenGuess;
t.data{i2}.note = tempTable.notes;
close(f);
t.time{i2} = inputdlg({'Start Time:','End Time:'},'Start and End Time',1,{'' ''});
t.finalNote{i2} = inputdlg('What other notes do you have for this subject?','Notes',4,{''});
age = str2double(inputdlg('How old was the subject?','age',1,{''}));
subjectAge = ones(height(t.data{i2}),1) * age;
subjectNum = ones(height(t.data{i2}),1)*eval(t.name{i2}(9:10));
group = t.name{i2}(18:20);
switch group(1)
    case '1'
        groupNum = ones(height(t.data{i2}),1);
    case '2'
        groupNum = ones(height(t.data{i2}),1)*2;
    case '3'
        groupNum = ones(height(t.data{i2}),1)*3;
    case '4'
        groupNum = ones(height(t.data{i2}),1)*4;
    case '5'
        groupNum = ones(height(t.data{i2}),1)*5;
end
switch group(3)
    case 'A'
        sectionNum = ones(height(t.data{i2}),1);
    case 'B'
        sectionNum = ones(height(t.data{i2}),1)*2;
    case 'C'
        sectionNum = ones(height(t.data{i2}),1)*3;
    case 'D'
        sectionNum = ones(height(t.data{i2}),1)*4;
end
t.data{i2}.subjectAge = subjectAge;
t.data{i2}.subjectNum = subjectNum;
t.data{i2}.groupNum = groupNum;
t.data{i2}.sectionNum = sectionNum;
instructions = ones(height(t.data{i2}),1);
if strcmp(t.name{i2}(18),'1')
    instructions = instructions*0;
elseif strcmp(t.name{i2}(18),'2')
    instructions = instructions*0;
elseif strcmp(t.name{i2}(18),'3')
    instructions = instructions*1;
elseif strcmp(t.name{i2}(18),'4')
    instructions = instructions*2;
else
    instructions = instructions*-1;
end
t.data{i2}.Instructions = instructions;
t.data{i2}.Trial = (1:height(t.data{i2}))';
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