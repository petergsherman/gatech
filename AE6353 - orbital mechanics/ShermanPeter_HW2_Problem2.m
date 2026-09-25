%Problem #2
%Given
a = 26000; %km
e = 0.737;
i = 63.4; %deg
OMEGA = 100; %deg
omega = 270; %deg

theta = 200; %deg
mu = 398600; %km^3/s^2
%Part A
%------------------------------------------------------------------------------------------
[r_ECI, v_ECI] = OE2XYZ(a, e, i, OMEGA, omega, theta, mu);

%Part B
%-----------------------------------------------------------------------------------------
R_eci2perifocal = makeR_oe2eci(OMEGA, i, omega);
r_perifocal = R_eci2perifocal' * r_ECI;
v_perifocal = R_eci2perifocal' * v_ECI;

%Part C
%-----------------------------------------------------------------------------------------
[a, e, i, OMEGA, omega, theta] = XYZ2OE(r_ECI, v_ECI, mu);

%Part D
%-----------------------------------------------------------------------------------------
%sweep true anomaly to propagate the orbit
thetaSweep = linspace(0, 360, 361);
orbit_ECI = zeros(3, length(thetaSweep));

for k = 1:length(thetaSweep)
    [orbit_ECI(:,k), ~] = OE2XYZ(a, e, i, OMEGA, omega, thetaSweep(k), mu);
end

%3D plot
figure;
hold on;
grid on;
axis equal;

%orbit
plot3(orbit_ECI(1,:), orbit_ECI(2,:), orbit_ECI(3,:), '-b', 'LineWidth', 1.5);

%earth
earthRadius = 6378;
[sX, sY, sZ] = sphere(50);
surf(earthRadius * sX, earthRadius * sY, earthRadius * sZ, 'EdgeColor', 'none', 'FaceAlpha', 0.6);

%spacecraft position
plot3(r_ECI(1), r_ECI(2), r_ECI(3), 'r.', 'MarkerSize', 30);

xlabel('X [km]');
ylabel('Y [km]');
zlabel('Z [km]');
title('Orbit in ECI Frame');
legend('Orbit path', 'Earth', 'Spacecraft', 'Location', 'best');
view(3);
hold off;

%part E
%--------------------------------------------------------------------------------------------
%start with the quantities (we already have a)
b = a * sqrt(1 - e^2); %semi minor axis
p = a * (1 - e^2); %semi latus rectum
c = a * e; %ellipse center to focus
ra = a * (1 + e); %apoapsis
rp = a * (1 - e); %periapsis

%sweep orbit again
r_orbit = p ./ (1 + e * cosd(thetaSweep));
x_orbit = r_orbit .* cosd(thetaSweep);
y_orbit = r_orbit .* sind(thetaSweep);

figure;
hold on;
grid on;
axis equal;

%plot ellipse
plot(x_orbit, y_orbit, 'b-', 'LineWidth', 1.5);

%plot earth
theta_circle = linspace(0, 360, 360);
fill(earthRadius * cosd(theta_circle), earthRadius * sind(theta_circle), [0.3 0.6 1], 'FaceAlpha', 0.6, 'EdgeColor', 'k');

%mark spacecraft
plot(r_perifocal(1), r_perifocal(2), 'r.', "MarkerSize", 30);

%plot periapsis and apoapsis
plot(rp, 0, 'k^', 'MarkerFaceColor', 'g');
plot(-ra, 0, 'kv', 'MarkerFaceColor', 'g');

xlabel('x_{perifocal} [km]');
ylabel('y_{perifocal} [km]');
title('Orbit in the Perifocal Frame');
legend('Orbit', 'Earth', 'Spacecraft', 'Periapsis', 'Apoapsis', 'Location', 'best');

%label the six scalar quantities 
labelText = sprintf(['a  = %.1f km\n' ...
    'b  = %.1f km\n' ...
    'p  = %.1f km\n' ...
    'c  = %.1f km\n' ...
    'r_a = %.1f km\n' ...
    'r_p = %.1f km'], a, b, p, c, ra, rp);
text(min(x_orbit) + 0.02*(max(x_orbit) - min(x_orbit)), max(y_orbit) - 0.02*(max(y_orbit) - min(y_orbit)), labelText, 'FontSize', 10, 'VerticalAlignment', 'top', 'BackgroundColor', 'y', 'EdgeColor', 'k', 'Color', 'k');

hold off;


%Part f
%-----------------------------------------------------------------------------------------
%hodograph
h = cross(r_perifocal, v_perifocal);
hodoRadius = mu / norm(h);
hodoOffset = e * hodoRadius;
ApoapSpeed = hodoRadius - hodoOffset;

%trace the full circle 
vx_hodo = -hodoRadius * sind(thetaSweep);
vy_hodo = hodoOffset + hodoRadius * cosd(thetaSweep);

%current velocity from hodograph at theta
vx_current = -hodoRadius * sind(theta);
vy_current = hodoOffset + hodoRadius * cosd(theta);

%compare hodo velocity to part B velocity
fprintf('Velocity from hodograph equation:      vx = %.6f, vy = %.6f km/s\n', vx_current, vy_current);
fprintf('Velocity from Part B (v_perifocal):     vx = %.6f, vy = %.6f km/s\n', v_perifocal(1), v_perifocal(2));

figure;
hold on;
grid on;
axis equal;

%hodo circle, origin, center, apoapsis velocity point
plot(vx_hodo, vy_hodo, 'b-', 'LineWidth', 1.5);
plot(0, 0, 'y+', 'MarkerSize', 10, 'LineWidth', 1.5);
plot(0, hodoOffset, 'ks', 'MarkerFaceColor', 'r');
plot(0, hodoOffset - hodoRadius, 'kv', 'MarkerFaceColor', 'g');

%current velocity
plot(vx_current, vy_current, 'r.', 'MarkerSize', 30);
plot(v_perifocal(1), v_perifocal(2), 'go', 'MarkerSize', 12, 'LineWidth', 1.5);

%labels
xlabel('v_x [km/s]');
ylabel('v_y [km/s]');
title('Orbital Hodograph in the Perifocal Frame');
legend('Hodograph', 'Origin', 'Circle center', 'Apoapsis velocity', ...
    'Spacecraft velocity (hodograph eq.)', 'Spacecraft velocity (Part B)', 'Location', 'best');

labelText2 = sprintf(['R   = %.4f km/s\n' ...
    'c_h = %.4f km/s\n' ...
    'v_a = %.4f km/s\n' ...
    'v   = %.4f km/s'], hodoRadius, hodoOffset, ApoapSpeed, norm(v_perifocal));
text(min(vx_hodo) + 0.02*(max(vx_hodo) - min(vx_hodo)), max(vy_hodo) - 0.02*(max(vy_hodo) - min(vy_hodo)), labelText2, 'FontSize', 10, 'VerticalAlignment', 'top', 'BackgroundColor', 'y', 'EdgeColor', 'k', 'Color', 'k');
hold off;

%FUNCTIONS
%-----------------------------------------------------------------------------------------

function [r_ECI, v_ECI] = OE2XYZ(a, e, i, OMEGA, omega, theta, mu)

%calculating p from a and e
p = a * (1 - e^2);

%calculating rmag
rmag = p / (1 + e*cosd(theta));

%calculating r and v in perifocal frame
rPerifocal = rmag * [cosd(theta); sind(theta); 0];
vPerifocal = sqrt(mu / p) * [-sind(theta); e + cosd(theta); 0];

%Transforming into ECI FRAME
R = makeR_oe2eci(OMEGA, i, omega);
r_ECI = R * rPerifocal;
v_ECI = R * vPerifocal;

end

function [a, e, i, OMEGA, omega, theta] = XYZ2OE(r_ECI, v_ECI, mu)

%calculating specifical angular momentum
h = cross(r_ECI, v_ECI);
n = cross([0;0;1], h); %ascending node vector

%calculating p from h
p = norm(h)^2 / mu;

%calculating e from r and v
e_vec = 1/mu * ((norm(v_ECI)^2 - mu/norm(r_ECI)) * r_ECI - dot(r_ECI, v_ECI) * v_ECI);
e = norm(e_vec);

%calculating a from p and e
a = p / (1 - e^2);

%calculating i
i = acosd(dot(h, [0;0;1]) / norm(h));

%calcuting right ascending node
OMEGA = acosd(dot(n, [1;0;0]) / norm(n));
if n(2) < 0
    OMEGA = 360 - OMEGA; %correcting for wrapping
end

%calculating argument for periapsis;
omega = acosd(dot(n, e_vec) / (norm(n) * norm(e)));
if e_vec(3) < 0
    omega = 360 - omega; %correcting for wrapping
end

%calculating true anomoly
theta = acosd(dot(e_vec, r_ECI) / (e * norm(r_ECI)));
if dot(e_vec, r_ECI) < 0
    theta = 360 - theta; %correcting for wrapping
end
end

function R = makeR_oe2eci(OMEGA, i, omega)

%constructing rotation matrix
R3 = @(angle) [cosd(angle), -sind(angle), 0; ...
    sind(angle), cosd(angle), 0;  ...
    0          , 0          , 1];
R1 = @(angle) [1,           0          , 0;  ...
    0, cosd(angle), -sind(angle); ...
    0, sind(angle), cosd(angle)];

R = R3(OMEGA) * R1(i) * R3(omega);

end