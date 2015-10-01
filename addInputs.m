function [t] = addInputs(t)
folder = '\\ROOT\projects\NIOSH-WarningBeacons\Learning-Experiment\Input-Files\';
for i1 = 1:length(t.data)
    if strcmpi(t.data{i1}.Properties.VariableNames{end},'correctedPosition')|strcmpi(t.data{i1}.Properties.VariableNames{end},'percentAnswer')
        switch t.name{i1}(18:20)
            case '1-A'
                temp = readtable(fullfile(folder,'Learning-Group1-A.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '1-B'
                temp = readtable(fullfile(folder,'Learning-Group1-B.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '1-C'
                temp = readtable(fullfile(folder,'Learning-Group1-C.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '1-D'
                temp = readtable(fullfile(folder,'Learning-Group1-D.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '2-A'
                temp = readtable(fullfile(folder,'Learning-Group2-A.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '2-B'
                temp = readtable(fullfile(folder,'Learning-Group2-B.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '2-C'
                temp = readtable(fullfile(folder,'Learning-Group2-C.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '2-D'
                temp = readtable(fullfile(folder,'Learning-Group2-D.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '3-A'
                temp = readtable(fullfile(folder,'Learning-Group3-A.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '3-B'
                temp = readtable(fullfile(folder,'Learning-Group3-B.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '3-C'
                temp = readtable(fullfile(folder,'Learning-Group3-C.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '3-D'
                temp = readtable(fullfile(folder,'Learning-Group3-D.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '4-A'
                temp = readtable(fullfile(folder,'Learning-Group4-A.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '4-B'
                temp = readtable(fullfile(folder,'Learning-Group4-B.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '4-C'
                temp = readtable(fullfile(folder,'Learning-Group4-C.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '4-D'
                temp = readtable(fullfile(folder,'Learning-Group4-D.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '5-A'
                temp = readtable(fullfile(folder,'Learning-Group5-A.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '5-B'
                temp = readtable(fullfile(folder,'Learning-Group5-B.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '5-C'
                temp = readtable(fullfile(folder,'Learning-Group5-C.txt'), 'Delimiter','\t','ReadVariableNames',false);
            case '5-D'
                temp = readtable(fullfile(folder,'Learning-Group5-D.txt'), 'Delimiter','\t','ReadVariableNames',false);
            otherwise
        end
        temp.Properties.VariableNames = {'Frequency','Color','inputDirection','High','Low'};
        t.data{i1}= [t.data{i1},temp];
    end
    
end
end