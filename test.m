load('learningExpDataNonCompliance.mat');
x=1:48;
f = figure();
for i = 1:length(t.data)
    plot(x,t.data{i}.Position(:),x,t.data{i}.percentGuess(:),x,t.data{i}.percentAnswer(:));
    title(t.name{i});
    saveas(f,[pwd,'\output\',t.name{i}(1:end-3),'jpg']);
end