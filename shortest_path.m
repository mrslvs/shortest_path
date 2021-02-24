%uloha2
%isid92654

start = [0,0];
stop = [100, 100];
set = [18,77; 12,88; 30,37; 41,64; 10,19; 72,37; 87,17; 35,82;
18,15; 18,90; 23,57; 75,12; 97,27; 7,67; 20,82; 49,0; 62,14; 10,35];
path = [start; set; stop];

figure(1)
plot(path(:,1),path(:,2),'rx');
grid;

pop_size = 100;
population = [];

for cycle=1:200
    
    %fill in population
    for i=1:pop_size
        population(i, :, :) = path;
        set = shake(set, 1);
        set = swapgen(set, 0.5);
        path = [start; set; stop];
    end
    
    for i=1:pop_size
        fit(i)=fitness(population(i, :, :));
    end
    
    best_individuals(cycle) = min(fit);
end

figure(2)
plot(best_individuals);
grid;

function fit = fitness(path)
    fit = 0;
    
    for i=1:19
        fit = fit + length_A_to_B(path(1, i, :), path(1, i+1, :));
    end
end

function len = length_A_to_B(A, B)
    diff_x = abs(A(1,1) - B(1,1));
    diff_y = abs(A(1,2) - B(1,2));
    
    len = diff_x^2 + diff_y^2;
    len = sqrt(len);
end