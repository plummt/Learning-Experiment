fullx = 1:48;
x = 1:24;
a = [];
b = [];
lastValue = [];
Type = [];
Group = [];
varTable = [];
for i = 1:length(avgAnswer)
    [AnswerFit{i}, AnswerGOF{i}] = createFit4(fullx,avgAnswer{i});
    [GuessFit{i}, GuessGOF{i}] = createFit4(fullx,avgGuess{i});
    [PosFit{i}, PosGOF{i}] = createFit4(fullx,avgPos{i});
    a(end+1) = AnswerFit{i}.a;
    b(end+1) = AnswerFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(fullx(end));
    Type{end+1} = ['Answer'];
    Group(end+1) = i;
    a(end+1) = GuessFit{i}.a;
    b(end+1) = GuessFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(fullx(end));
    Type{end+1} = 'Guess';
    Group(end+1) = i;
    a(end+1) = PosFit{i}.a;
    b(end+1) = PosFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(fullx(end));
    Type{end+1} = 'Pos';
    Group(end+1) = i;
    [AwayAnswerFit{i}, AwayAnswerGOF{i}] = createFit4(x,awayavgAnswer{i});
    [AwayGuessFit{i}, AwayGuessGOF{i}] = createFit4(x,awayavgGuess{i});
    [AwayPosFit{i}, AwayPosGOF{i}] = createFit4(x,awayavgPos{i});
    a(end+1) = AwayAnswerFit{i}.a;
    b(end+1) = AwayAnswerFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(x(end));
    Type{end+1} = 'AwayAnswer';
    Group(end+1) = i;
    a(end+1) = AwayGuessFit{i}.a;
    b(end+1) = AwayGuessFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(x(end));
    Type{end+1} = 'AwayGuess';
    Group(end+1) = i;
    a(end+1) = AwayPosFit{i}.a;
    b(end+1) = AwayPosFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(x(end));
    Type{end+1} = 'AwayPos';
    Group(end+1) = i;
    [TowardsAnswerFit{i}, TowardsAnswerGOF{i}] = createFit4(x,towavgAnswer{i});
    [TowardsGuessFit{i}, TowardsGuessGOF{i}] = createFit4(x,towavgGuess{i});
    [TowardsPosFit{i}, TowardsPosGOF{i}] = createFit4(x,towavgPos{i});
    a(end+1) = TowardsAnswerFit{i}.a;
    b(end+1) = TowardsAnswerFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(x(end));
    Type{end+1} = 'TowardsAnswer';
    Group(end+1) = i;
    a(end+1) = TowardsGuessFit{i}.a;
    b(end+1) = TowardsGuessFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(x(end));
    Type{end+1} = 'TowardsGuess';
    Group(end+1) = i;
    a(end+1) = TowardsPosFit{i}.a;
    b(end+1) = TowardsPosFit{i}.b;
    lastValue(end+1) = a(end) + b(end)*log(x(end));
    Type{end+1} = 'TowardsPos';
    Group(end+1) = i;
    close all
end
varTable = table(a',b',lastValue',Type',Group','VariableNames',{'a','b','lastValue','type','group'});
writetable(varTable,[pwd,'\output\','BestFit Variables.xlsx'])
blue = [0,0.447,0.741];
orange = [0.85,0.325,0.098];
yellow = [0.929,0.694,0.125];
purple= [0.495,0.184,0.556];
f = figure();
y1 = feval(AnswerFit{1},fullx);
y2 = feval(AnswerFit{2},fullx);
y3 = feval(AnswerFit{3},fullx);
y4 = feval(AnswerFit{4},fullx);
plot(fullx,y1,fullx,y2,fullx,y3,fullx,y4,'LineWidth',2);
hold on
line(fullx,0*fullx+.5,'LineStyle','--','Color','k');
scatter(fullx,avgAnswer{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(fullx,avgAnswer{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(fullx,avgAnswer{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(fullx,avgAnswer{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
avgAnswerTable = table(avgAnswer{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(avgAnswerTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','AvgResponce');
title('Correct Responce Percentage');
legend('Group 1','Group 2','Group 3','Group4','Chance','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Average Responce BestFit.jpg']);
close(f);

f = figure();
y1 = feval(GuessFit{1},fullx);
y2 = feval(GuessFit{2},fullx);
y3 = feval(GuessFit{3},fullx);
y4 = feval(GuessFit{4},fullx);
plot(fullx,y1,fullx,y2,fullx,y3,fullx,y4,'LineWidth',2);
hold on
line(fullx,0*fullx+.5,'LineStyle','--','Color','k');
scatter(fullx,avgGuess{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(fullx,avgGuess{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(fullx,avgGuess{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(fullx,avgGuess{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
avgGuessTable = table(avgGuess{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(avgGuessTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','AvgPerdiction');
title('Correct Perdiction Percentage');
legend('Group 1','Group 2','Group 3','Group4','Chance','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Average Perdiction BestFit.jpg']);
close(f);

f = figure();
y1 = feval(PosFit{1},fullx);
y2 = feval(PosFit{2},fullx);
y3 = feval(PosFit{3},fullx);
y4 = feval(PosFit{4},fullx);
plot(fullx,y1,fullx,y2,fullx,y3,fullx,y4,'LineWidth',2);
hold on
scatter(fullx,avgPos{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(fullx,avgPos{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(fullx,avgPos{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(fullx,avgPos{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
avgPosTable = table(avgPos{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(avgPosTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','avgDistance');
title('Average Responce Position');
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Distance (cm)');
ylim([0,(144.78/1.59)]);
saveas(f,[pwd,'\output\','Average Distance BestFit.jpg']);
close(f);

f = figure();
y1 = feval(AwayAnswerFit{1},x);
y2 = feval(AwayAnswerFit{2},x);
y3 = feval(AwayAnswerFit{3},x);
y4 = feval(AwayAnswerFit{4},x);
plot(x,y1,x,y2,x,y3,x,y4,'LineWidth',2);
hold on
line(x,0*x+.5,'LineStyle','--','Color','k');
scatter(x,awayavgAnswer{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(x,awayavgAnswer{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(x,awayavgAnswer{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(x,awayavgAnswer{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
awayavgAnswerTable = table(awayavgAnswer{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(awayavgAnswerTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','awayAvgResponce');
title('Away Correct Responce Percentage');
legend('Group 1','Group 2','Group 3','Group4','Chance','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Away Responce BestFit.jpg']);
close(f);

f = figure();
y1 = feval(AwayGuessFit{1},x);
y2 = feval(AwayGuessFit{2},x);
y3 = feval(AwayGuessFit{3},x);
y4 = feval(AwayGuessFit{4},x);
plot(x,y1,x,y2,x,y3,x,y4,'LineWidth',2);
hold on
line(x,0*x+.5,'LineStyle','--','Color','k');
scatter(x,awayavgGuess{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(x,awayavgGuess{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(x,awayavgGuess{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(x,awayavgGuess{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
awayavgGuessTable = table(awayavgGuess{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(awayavgGuessTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','awayAvgPerdiction');
title('Away Correct Perdiction Percentage');
legend('Group 1','Group 2','Group 3','Group4','Chance','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Away Perdiction BestFit.jpg']);
close(f);

f = figure();
y1 = feval(AwayPosFit{1},x);
y2 = feval(AwayPosFit{2},x);
y3 = feval(AwayPosFit{3},x);
y4 = feval(AwayPosFit{4},x);
plot(x,y1,x,y2,x,y3,x,y4,'LineWidth',2);
hold on
scatter(x,awayavgPos{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(x,awayavgPos{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(x,awayavgPos{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(x,awayavgPos{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
awayavgPosTable = table(awayavgPos{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(awayavgPosTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','awayavgDistance');
title('Away Responce Position');
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Distance (cm)');
ylim([0,(144.78/1.59)]);
saveas(f,[pwd,'\output\','Away Position BestFit.jpg']);
close(f);

f = figure();
y1 = feval(TowardsAnswerFit{1},x);
y2 = feval(TowardsAnswerFit{2},x);
y3 = feval(TowardsAnswerFit{3},x);
y4 = feval(TowardsAnswerFit{4},x);
plot(x,y1,x,y2,x,y3,x,y4,'LineWidth',2);
hold on
line(x,0*x+.5,'LineStyle','--','Color','k');
scatter(x,towavgAnswer{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(x,towavgAnswer{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(x,towavgAnswer{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(x,towavgAnswer{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
towavgAnswerTable = table(towavgAnswer{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(towavgAnswerTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','towavgResponce');
title('Towards Correct Responce Percentage');
legend('Group 1','Group 2','Group 3','Group4','Chance','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Towards Responce BestFit.jpg']);
close(f);

f = figure();
y1 = feval(TowardsGuessFit{1},x);
y2 = feval(TowardsGuessFit{2},x);
y3 = feval(TowardsGuessFit{3},x);
y4 = feval(TowardsGuessFit{4},x);
plot(x,y1,x,y2,x,y3,x,y4,'LineWidth',2);
hold on
line(x,0*x+.5,'LineStyle','--','Color','k');
scatter(x,towavgGuess{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(x,towavgGuess{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(x,towavgGuess{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(x,towavgGuess{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
towavgGuessTable = table(towavgGuess{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(towavgGuessTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','towavgPerdiction');
title('Towards Correct Perdiction Percentage');
legend('Group 1','Group 2','Group 3','Group4','Chance','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Percentage');
ylim([0,1]);
saveas(f,[pwd,'\output\','Towards Perdiction BestFit.jpg']);
close(f);

f = figure();
y1 = feval(TowardsPosFit{1},x);
y2 = feval(TowardsPosFit{2},x);
y3 = feval(TowardsPosFit{3},x);
y4 = feval(TowardsPosFit{4},x);
plot(x,y1,x,y2,x,y3,x,y4,'LineWidth',2);
hold on
scatter(x,towavgPos{1},'.','MarkerFaceColor',blue,'MarkerEdgeColor',blue);
scatter(x,towavgPos{2},'.','MarkerFaceColor',orange,'MarkerEdgeColor',orange);
scatter(x,towavgPos{3},'.','MarkerFaceColor',yellow,'MarkerEdgeColor',yellow);
scatter(x,towavgPos{4},'.','MarkerFaceColor',purple,'MarkerEdgeColor',purple);
towavgPosTable = table(towavgPos{1:4},y1,y2,y3,y4,'VariableNames',{'group1','group2','group3','group4','fit1','fit2','fit3','fit4'});
writetable(towavgPosTable,[pwd,'\output\','BestFit Variables.xlsx'],'sheet','towavgDistance');
title('Towards Responce Position');
legend('Group 1','Group 2','Group 3','Group4','Location','southoutside','Orientation','horizontal');
xlabel('Trail Number');
ylabel('Distance (cm)');
ylim([0,(144.78/1.59)]);
saveas(f,[pwd,'\output\','Towards Position BestFit.jpg']);
close(f);




