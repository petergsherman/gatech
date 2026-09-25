%ShermanPeter_HW2_Problem4

%Part A
%-----------------------------------------------------------------------------------------
%{ 
naif0012 is a leapsecond kernel that lists every leap second that has been
inserted into the UTC since 1972. MICE then converts UTC to ephemeris time
using these leapseconds.

pck00010 is a planetary constants kernal. It provides the orientation,
size, and shape data for the sun, planets, and other natural satellites

de440 is a binary empheremis kernal that was build from JPL; it give the
position and velocity for the planets, sun, and the earth-moon system form
around 1550 to 2650

%}

%Part B
%-----------------------------------------------------------------------------------------

dir = 'C:\Users\User\Documents\MATLAB\kernels';
cspice_furnsh(fullfile(dir, 'naif0012.tls'));
cspice_furnsh(fullfile(dir, 'pck00010.tpc'));
cspice_furnsh(fullfile(dir, 'de440.bsp'));

et0 = cspice_str2et('2026 SEP 28 00:00:00.0 UTC'); %ephemeris time at epoch
state0 = cspice_spkezr('EARTH BARYCENTER', et0, 'J2000', 'NONE', 'SOLAR SYSTEM BARYCENTER'); %state at epoch

r0 = state0(1:3); %intitial position at epoch ICRF r0 = 1.0e+08 * {1.4927, 0.1014, 0.0441} km
v0 = state0(4:6); %initial velocity at epoch ICRF v0 = {-2.8223, 27.1476, 11.7678} km/s

%Part C
%------------------------------------------------------------------------------------------
%necessary constants
muSun = 132712440041.279419;
muVenus = 324858.592000;
muJupiter = 126712764.100000;
muSaturn = 37940584.841800;

%setting up time for two years
tSpan = linspace(0, 2 * 365.25 * 86400, 731); %in seconds since et0 and is daily
state0 = [r0; v0];

%setting up iterator
options = odeset('RelTol', 3e-13, 'AbsTol', 1e-6, 'MaxStep', 86400);

%propogating using ode45
[~, state_S1] = ode45(@(t, state) dyn_sun_only(t, state, et0, muSun), tSpan, state0, options);
[~, state_S2] = ode45(@(t, state) dyn_sun_jupiter(t, state, et0, muSun, muJupiter), tSpan, state0, options);
[~, state_S3] = ode45(@(t, state) dyn_sun_jupiter_saturn_venus(t, state, et0, muSun, muJupiter, muSaturn, muVenus), tSpan, state0, options);

solutions = {state_S1, state_S2, state_S3};

%true earth-moon barycenter trajectory for comparison
trueEMB_traj = zeros(numel(tSpan), 3);
for i = 1:numel(tSpan)
    state = cspice_spkezr('EARTH BARYCENTER', et0 + tSpan(i), 'J2000', 'NONE', 'SOLAR SYSTEM BARYCENTER');
    trueEMB_traj(i, :) = state(1:3).';
end

%plot 1 aka 3d orbit comparison
figure;
hold on;
grid on;

for i = 1:3
    plot3(solutions{i}(:,1), solutions{i}(:,2), solutions{i}(:,3), 'LineWidth', 1.2); %plotting all three scenarios
end

plot3(trueEMB_traj(:,1), trueEMB_traj(:,2), trueEMB_traj(:,3), 'k--', 'LineWidth', 1.0); %ploting true trajectory
plot3(0, 0, 0, 'yo', 'MarkerFaceColor', 'y', 'MarkerSize', 8); %plotting SSB

xlabel('X (km)'); 
ylabel('Y (km)'); 
zlabel('Z (km)');
title('EMB Orbit about SSB: n-body Propagation vs DE440');
legend('Sun only', 'Sun + Jupiter system', 'Sun + Jupiter + Saturn + Venus','DE440 truth', 'SSB', 'Location', 'bestoutside');
axis equal
view(3)

%plot 2 for error
figure;
hold on;
grid on;

for i = 1:3
    error = vecnorm(solutions{i}(:,1:3) - trueEMB_traj, 2, 2);
    semilogy(tSpan / 86400, error, 'LineWidth', 1.3); %plotting error semilog in days
end

xlabel('Time since epoch (days)');
ylabel('Position error (km)');
title('EMB Position Error Relative to DE440');
legend('Sun only', 'Sun + Jupiter system','Sun + Jupiter + Saturn + Venus', 'Location', 'best');

set(gca, 'YScale', 'log');


%unloading kernels
cspice_kclear();

%Part D
%------------------------------------------------------------------------------------------
%{
From the graphs it is clear that while there is a lot of error that builds
up using the iterator methods, it is still tiny compared to the size of the
orbit of EMB around the SSB. It was also shown that, as expected, adding
more elements to the dynamics increased the accuracy significantly. The
lowest error is when all four bodies are integrated into the sim and the highest error is
when only the sun is integrated into the sim.
%}

%FUNCTIONS
%------------------------------------------------------------------------------------------
function a = getGravity(body, mu, et, r) 
state = cspice_spkezr(body, et, 'J2000', 'NONE', 'SOLAR SYSTEM BARYCENTER'); %getting state from kernel
rBody = state(1:3);
distance = rBody - r; %calculating distance between bodies

a = (mu * distance) / (norm(distance)^3); %calculating acceleration using universal gravity
end

function statedot = dyn_sun_only(t, state, et0, muSun)
et = et0 + t;
r = state(1:3);
v = state(4:6);
a = getGravity('SUN', muSun, et, r);

statedot = [v; a];
end

function statedot = dyn_sun_jupiter(t, state, et0, muSun, muJupiter)
et = et0 + t;
r = state(1:3);
v = state(4:6);
a = getGravity('SUN', muSun, et, r) + getGravity('JUPITER BARYCENTER', muJupiter, et, r);

statedot = [v; a];
end

function statedot = dyn_sun_jupiter_saturn_venus(t, state, et0, muSun, muJupiter, muSaturn, muVenus)
et = et0 + t;
r = state(1:3);
v = state(4:6);
a = getGravity('SUN', muSun, et, r) + getGravity('JUPITER BARYCENTER', muJupiter, et, r) + ...
    getGravity('SATURN BARYCENTER', muSaturn, et, r) + getGravity('VENUS', muVenus, et, r);

statedot = [v; a];
end