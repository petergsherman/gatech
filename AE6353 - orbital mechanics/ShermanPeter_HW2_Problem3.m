%ShermanPeter_HW2_Problem3

%Given
a = 7980; %km
e = 0.1;
i = 15; %deg
OMEGA = 230; %deg
omega = 45; %deg
theta1 = deg2rad(20); %rad
mu = 398600; %km^3 / s^2

%Part a
%--------------------------------------------------------------------------------------
%orbital period
orbitalPeriod = (2 * pi * sqrt((a^3) / mu)); %orbitalPeriod = 118.2400 MIN

%Part b
%--------------------------------------------------------------------------------------
deltaT = 30 * 60; %t2-t1 in seconds

%first solve for mean motion using keplars third law
n = (2 * pi) / orbitalPeriod;

%solve for first eccentric anomaly
E1 = acos((cos(theta1) + e)/(1 + e * cos(theta1)));

%solve for first mean anomaly
M1 = E1 - e*sin(E1);

%solve for second mean anomaly based on M1
M2 = M1 + n*(deltaT);

%solve for E2 using newton-raphson method
E2 = M2; %initial guess for E2
for iteration = 1:20
    eccentricAnomalyError = (E2 - e*sin(E2) - M2) / (1 - e*cos(E2));
    E2 = E2 - eccentricAnomalyError;
end

%use E2 to solve for theta2
theta2 = acos((cos(E2) - e)/(1 - e*cos(E2))); %true anomaly theta2 = 2.1190 rad or 121 deg

%Part C
%--------------------------------------------------------------------------------------
%solving for r1 and v1 at t1
[r_ECI1, v_ECI1] = OE2XYZ(a, e, i, OMEGA, omega, theta1, mu); %r_ECI1 = {2881.1, -6401.6, 1694.0} km  -- v_ECI1 = {7.0538, 3.1406, 0.9069} km/s

%solving for r2 and v2 at t2
[r_ECI2, v_ECI2] = OE2XYZ(a, e, i, OMEGA, omega, theta2, mu); %r_ECI2 = {3562.5, -6058.7, 1774.8} km -- v_ECI2 = {6.7182, 3.7896, 0.7263} km/s

%Part D
%--------------------------------------------------------------------------------------
%setting t span
tspan = [0 deltaT];

%setting state at t1
initialState = [r_ECI1; v_ECI1];

%propogate to t2 using ode45
options = odeset('AbsTol', 1e-14, 'RelTol', 1e-14);
[t_out, stateOut] = ode45(@orbdyn, tspan, initialState, options);

r2_out = stateOut(end, 1:3)';
v2_out = stateOut(end, 4:6)';

%{ 
r2 from ode45:
   1.0e+03 *

    6.8797    4.5855    0.6224

r2 from Part C:
   1.0e+03 *

    6.8797    4.5855    0.6224

difference:
   7.7937e-11

v2 from ode45:
   -3.0114    5.8717   -1.6294

v2 from Part C:
   -3.0114    5.8717   -1.6294

difference:
   2.1460e-14
%}


%FUNCTIONS
%--------------------------------------------------------------------------------------
function [r_ECI, v_ECI] = OE2XYZ(a, e, i, OMEGA, omega, theta, mu)

%calculating p from a and e
p = a * (1 - e^2);

%calculating rmag
rmag = p / (1 + e*cos(theta));

%calculating r and v in perifocal frame
rPerifocal = rmag * [cos(theta); sin(theta); 0];
vPerifocal = sqrt(mu / p) * [-sin(theta); e + cos(theta); 0];

%Transforming into ECI FRAME
R = makeR_oe2eci(OMEGA, i, omega);
r_ECI = R * rPerifocal;
v_ECI = R * vPerifocal;

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

function statedot = orbdyn(t, state) %from HW1
%deconstructing state vector
r = state(1:3);
v = state(4:6);

%gravitational acceleration
rNorm = norm(r);
accEarth = (-398600 / rNorm^3) * r;

statedot = [v; accEarth];
end