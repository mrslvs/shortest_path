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

for i=1:pop_size
    population = [population;2:19];
end