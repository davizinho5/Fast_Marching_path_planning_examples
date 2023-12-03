%%%%%%%%%%%%%%%%
% Fast Marhing Square method path planner
%%%%%%%%%%%%%%%%

clear;close all
map_name = 'room_test.png';
Wo = imread(map_name);

%% Compute velocities map
W = rescale( double(Wo) );
[row,col]=find(W<0.5);
start_points=[row,col]';
options.nb_iter_max = Inf;
options.Tmax = sum(size(W));
[W,~] = perform_fast_marching(W, start_points, options);
W= rescale( double(W) );
figure
imagesc(W)
colormap gray(256);

%% pick starting point
[start_point,end_point] = pick_start_end_point(Wo);

%% Compute arrival time
options.Tmax = sum(size(W));
% options.end_points = end_point;
disp('calcular FM')
[D,S] = perform_fast_marching(W, [start_point(2);start_point(1)], options);

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