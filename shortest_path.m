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
vec_of_best_ones = [15, 10 ,5];

for cycle=1:200
    
    %fill in population with shaken and swapped individuals
    %for i=1:pop_size
        %population(i, :, :) = path;
       % path = cross_mut(start, set, stop);
   %end
    
    population = get_population(pop_size, start, set, stop);
   
    for i=1:pop_size
        fit(i)=fitness(population(i, :, :));
    end
    
    best_individuals(cycle) = min(fit);
    
    
end

figure(2)
plot(best_individuals);
grid;

function population = get_population(pop_size, start, set, stop)
    path = cross_mut(start, set, stop);
    
    for i=1:pop_size
        population(i,:,:) = path;
        path = cross_mut(start, set, stop);
    end
end

function crossmut_path = cross_mut(start, set, stop)
    set = shake(set, 1);
    set = swapgen(set, 0.5);
    
    crossmut_path = [start; set; stop];
end

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