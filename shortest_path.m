%uloha2
%isid92654

start = [0,0];
stop = [100, 100];
set = [18,77; 12,88; 30,37; 41,64; 10,19; 72,37; 87,17; 35,82;
18,15; 18,90; 23,57; 75,12; 97,27; 7,67; 20,82; 49,0; 62,14; 10,35];

path = [start; set; stop];

plot(path(:,1),path(:,2),'rx');

for cycle=1:200
    fit = fitness(path)
end

function digit = get_random_digit(smax, smin)
%returns random digit belonging to interval <0,9>
    digit = round(rand() * (smax - smin + 1) + smin);
end

function fit = fitness(path)
    fit = 0;
    
    for i=1:(length(path)-1)
        fit = fit + length_A_to_B(path(i, :), path(i+1, :));
    end
end

function len = length_A_to_B(A, B)
    diff_x = abs(A(1,1) - B(1,1));
    diff_y = abs(A(1,2) - B(1,2));
    
    len = diff_x^2 + diff_y^2;
    len = sqrt(len);
end