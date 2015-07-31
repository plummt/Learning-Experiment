function [newTable,s] = groupBuilder(t, g)

newTable = table();

for i2 = 1:length(g)
    newTable = [newTable;t.data{g{i2}}];
end
s = findMedian(newTable);


end
