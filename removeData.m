function removeData(n)
load('learningExpDataNonCompliance.mat');
t.data(n) = [];
t.name(n) = [];
t.time(n) = [];
t.finalNote(n) = [];
save('learningExpDataNonCompliance.mat','t');
end