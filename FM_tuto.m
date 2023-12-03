%%%%%%%%%%%%%%%%
% Fast Marhing method path planner
%%%%%%%%%%%%%%%%

clear;close all
map_name = 'room_test.png';
Wo = imread(map_name);

%% pick starting point
[start_point,end_point] = pick_start_end_point(Wo);

%% Compute arrival time
options.Tmax = sum(size(Wo));
% options.end_points = end_point;
disp('calcular FM')
[D,S] = perform_fast_marching(double(Wo), [start_point(2);start_point(1)], options);

%% Compute path with gradient descent
disp('calcular path')
path = compute_geodesic(D, [end_point(2);end_point(1)]);

%% display path and arrival time map
ms = 30; lw = 3;
figure;
imagesc(D);
hold on;
h = plot(path(2,:), path(1,:), 'k' );
set(h, 'LineWidth', lw);
h = plot(end_point(1),end_point(2), '.b');
set(h, 'MarkerSize', ms);    
h = plot(start_point(1),start_point(2), '.r');
set(h, 'MarkerSize', ms);
hold off;
colormap jet(256);

%% display the map with the arrival time as Z axis
figure
contour3(D,250)