%task2
%isid92###
set = [18,77; 12,88; 30,37; 41,64; 10,19; 72,37; 87,17; 35,82;
18,15; 18,90; 23,57; 75,12; 97,27; 7,67; 20,82; 49,0; 62,14; 10,35];

pop_size = 50;
population = [];
vec_of_best_ones = [3, 2 ,1];
cycles = 900;

for i=1:pop_size
    %fill the population with numbers(1 to 18)
    %each number represents index in the initial set
    population = [population;1:18];
end
population = swapgen(population, 0.3); %swap for diversity

for i=1:cycles
    fit = fitness(population, pop_size, set);
    best_individuals(i) = min(fit);
    best_one = selbest(population, fit, 1);
    
    path = get_path_for_graph(best_one, set);
    
    %show path of the best individual in current cycle
    figure(1)
    plot(path(:,1),path(:,2),'o-');
    grid;
    
    %store best ones
    temp_best= selbest(population, fit, vec_of_best_ones);
    %
    old = seltourn(population, fit, 6);
    work = seltourn(population, fit, 50-12);
    work = swapgen(work, 0.1);
    work = swappart(work, 0.1);
    work = crosord(work,0);
    
    %concatonate
    population = [temp_best; old ; work];
    
end

fit = fitness(population, pop_size, set);

figure(2)
plot(best_individuals);
grid;

function path = get_path(order, set)
    for j=1:18
        %J: for each index of set
        for k=1:2
            %K: for each value on axis (X and Y) of set
            %store to PATH
            path(j,k) = set(order(1,j), k);
        end
    end
end

function p = get_path_for_graph(order, set)
    p = get_path(order,set);
    
    start = [0,0];
    stop = [100,100];
    p = [start; p; stop];
    
end

function fit = fitness(population, pop_size, set)
    for i=1:pop_size
        %I: for each individual in population
        for j=1:18
            %J: for each index of set (individual = indexes of set)
            for k=1:2
                %K: for each value on axis (X and Y) of set
                %value of X = set(index,1)
                %value of Y = set(index,2)
                %store to PATH X,Y
                path(j,k) = set(population(i,j), k);
            end
        end
        
        %fitness of individual is the length of its path
        fit(i) = length_of_path(path);
    end
end

function len = length_of_path(individ)
%argument are indexes of initial set
    start = [0,0];
    stop = [100,100];
    path = [start;individ;stop];
    len = 0;
    
    for i=1:19
        %calculate length of path between each points, add to len
        len = len + length_A_to_B(path(i, :), path(i+1, :));
    end
end

function len = length_A_to_B(A, B)
%argument A=[Xa,Yb]
%returns distance between A&B
    diff_x = abs(A(1,1) - B(1,1));
    diff_y = abs(A(1,2) - B(1,2));
    
    len = diff_x^2 + diff_y^2;
    len = sqrt(len);
end