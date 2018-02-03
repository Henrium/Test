global score distance B
[score distance] = load_data();
B = 0;
%-------------constrain of GA algorithm--------------------
n = length(score);
%num of POI
l = 10   
LB = ones(l,1);
UB = ones(l,1)*n;
intcon = [1:l];
tol = 0.1;
%----------------------------------------------------------

%------------Set Training Time and interval----------------
k = 11; %Num of B value
Fval = zeros(k,1);
Bval = linspace(1,3,k);
Pval = [10,20]
FResult = zeros(2,k);
%----------------------------------------------------------

%--------------------Training------------------------------
for m = 1:2
    P = Pval(m) 
for i = 1:k  
    B = Bval(i)
    options=optimoptions(@ga,'MaxGenerations',1000,'ConstraintTolerance',tol,'Populationsize',P);
    Sum = 0; 
    for j = 1:5
        [x,fval,exitflag,output,population,scores] = ga(@fitness_func,l,[],[],[],[],LB,UB,@constrain,intcon,options);
        Sum = Sum + fval;
    end
    Fval(i) = -Sum/5;
end
    FResult(m,:) = Fval
end
%-------------------Visualization---------------------------
plot(Bval,Fval);
hold on;

