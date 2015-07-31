function [ t ] = correctGroupAndSection( t )
%CORRECTGROUPANDSECTION Summary of this function goes here
%   Detailed explanation goes here
for i1 = 1:length(t.data)
    section = t.data{i1}.groupNum{1}(3);
    group = t.data{i1}.groupNum{1}(1);
    t.data{i1}.sectionNum = zeros(height(t.data{i1}),1);
    t.data{i1}.groupNum = zeros(height(t.data{i1}),1);
    
    for i2 = 1:height(t.data{i1})
        
        switch section
            case 'A'
                t.data{i1}.sectionNum(i2) = 1;
            case 'B'
                t.data{i1}.sectionNum(i2) = 2;
            case 'C'
                t.data{i1}.sectionNum(i2) = 3;
            case 'D'
                t.data{i1}.sectionNum(i2) = 4;
        end
        
        switch group
            case '1'
                t.data{i1}.groupNum(i2) = 1;
            case '2'
                t.data{i1}.groupNum(i2) = 2;
            case '3'
                t.data{i1}.groupNum(i2) = 3;
            case '4'
                t.data{i1}.groupNum(i2) = 4;
        end
    end
end

end

