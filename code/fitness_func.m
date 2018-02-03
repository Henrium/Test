function [ans] = fitness_func(x)
%length(x) = 110
%total_time_bound
global score startpoint;
B = 0.5;
v = 20;%velocity
Num_of_POI = length(x) - sum(x==0);
ans = 0;%fitness value
now = 0;
time = 0;
visit = zeros(110,1);
for i = 1:length(x)
    now = uint32(x(i));
    if now ~= 0
        ans = ans - score(now,1);
    end
end 
end

