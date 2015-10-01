function t = correctPosition(t)
for i = 1:length(t.data)
    corrPosition = t.data{i}.Position * (144.78/1.59);
    t.data{i}.correctedPosition = corrPosition;
end

end