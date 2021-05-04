function PrintVoronoi(C:\Users\Usuario\Desktop\ARQUITECTURA\4 ARQUITECTURA\Nueva carpeta\Fiesta\1 500 ENTORNO.pdf)
%% PRINTVORONOI loads the image stored in filename and lets the user draw a
% point-by-point Voronoi tesselation.
%
% Example: execute PrintVoronoi('img/World.jpg')
% and add the points clicking on the displayed image.
%
% By Pablo Rodríguez. September 2013.
% http://about.me/pablo.rodriguez.sanchez

%% Aesthetics
voronoiColor = 'b';
pointWidth = 15;

%% Load the image
map = imread(filename);

% Measure the image
sizeY = size(map, 1);
sizeX = size(map, 2);

% Display the image
figure;
image(map);

xlim([0 sizeX]);
ylim([0 sizeY]);
hold on;

%% Draw the Voronoi map dynamically
title('Pick at least 3 points with using the left mouse button.')
button = 1;
counter = 1;
while(button == 1) % Right button terminates loop
    [xi, yi, button] = ginput(1);
    if(button == 1) % Avoids selecting the cancellation click. Used because Matlab does not support do-while loops
        scatter(xi, yi, pointWidth, voronoiColor, 'filled');
        x(counter, 1) = xi;
        y(counter, 1) = yi;
        counter = counter + 1;

        if(counter > 3) % Update dynamically when enough points are selected
            title('Left mouse button picks points. Right mouse button for finishing.')
            image(map);
            hold on;
            voronoi(x, y, voronoiColor);
            xlim([0 sizeX]);
            ylim([0 sizeY]);
        end

    end
end

end
