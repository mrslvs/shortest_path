%uloha2
%isid92654
set = [18,77; 12,88; 30,37; 41,64; 10,19; 72,37; 87,17; 35,82;
18,15; 18,90; 23,57; 75,12; 97,27; 7,67; 20,82; 49,0; 62,14; 10,35];

figure(1)
plot(set(:,1),set(:,2),'o-');
grid;

pop_size = 100;
population = [];
vec_of_best_ones = [15, 10 ,5];
cycles = 900;

for i=1:pop_size
    population = [population;1:18];
    population = swapgen(population, 0.3);
end

for i=1:cycles
    fit = fitness(population, pop_size, set);
    best_individuals(i) = min(fit);
    
    %store best ones
    
    %mutate and cross
    population = swapgen(population, 0.3);
    
    %concatonate
end

fit = fitness(population, pop_size, set);


function fit = fitness(population, pop_size, set)
    for i=1:pop_size
        for j=1:18
            for k=1:2
                path(j,k) = set(population(i,j), k); %this does magic
            end
        end
        
        fit(i) = length_of_path(path);
    end
end

function len = length_of_path(individ)
    start = [0,0];
    stop = [100,100];
    path = [start;individ;stop];
    len = 0;
    
    for i=1:19
        len = len + length_A_to_B(path(i, :), path(i+1, :));
    end
end

function len = length_A_to_B(A, B)
%parameters a=[xa,yb]
%returns length
    diff_x = abs(A(1,1) - B(1,1));
    diff_y = abs(A(1,2) - B(1,2));
    
    len = diff_x^2 + diff_y^2;
    len = sqrt(len);
end