function [score,distance] = load_data(alpha,beta,gamma,pref)
%alpha 景点偏好比重
%beta  景点评分比重
%gamma 景点热度（访问人数）比重
%score = alpha*map(type) + beta*rating + gamma*Viewer
alpha = 0.5
beta = 0.3
gamma = 0.2
% pref = [3,1,4,5,2]
pref = [5,4,2,1,3];
    data = xlsread('C:\Users\lenovo\Desktop\MONI\spider\data\Satisfactory_Score\score.xlsx');
    data2 = xlsread('C:\Users\lenovo\Desktop\MONI\spider\data\Traffic\Distance_Matrix_red.csv');
    distance = data2(2:111,2:111);
% Regularize
    total_num = size(data,1);
    Rating = data(:,3);
    Rating = (Rating - min(Rating))/(max(Rating)-min(Rating))
    Viewer = data(:,4);
    Viewer = (Viewer - min(Viewer))/(max(Viewer)-min(Viewer))
    Type = data(:,2);
    Map = zeros(5);
    for i = 1:5
        Map(pref(i)) = 6 - i;
    end
    for j = 1:total_num
        Type(j) = Map(Type(j) + 1)/5;
    end
    Type
    score = alpha*Type + beta*Rating + gamma*Viewer;
end

