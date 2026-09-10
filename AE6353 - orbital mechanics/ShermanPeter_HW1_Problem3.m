%ShermanPeter_HW1_Problem3.m

% a) brief summary of DE440 Documentation
%{
DE440 is a modern ephimeris created by NASA to calculate the precise positions and movements of planets, the Sun, and the Moon.
This model encorporates many different factors that weren't factored in DE430 like 30 Kuiper belt objects, the geodetic precession of the moon, the shapes of Mercury, Venus, and Mars, 
the solar radiation pressure on the Earth and Moon, and the viscous damping of the liquid core and solid mantle of the Moon.
Astronomers fit the data recorded from these measurements to the numerically integrated orbits to give engineers data that accurately
predicts the positions of astronomical bodies from the years 1550-2650. 
While DE440 is best for the current century that we are in, DE441 is slightly more accurate for longer timeframes (-13,200 - +17,191) while being less accurate in shorter time frames.
%}

% b)
% ------------------------------------------------------------------------------------------------------------------------------------

%time
t = linspace(0, 365 * 86400, 365); %converted days to seconds

%DE440 of earth to sun on 2022, 1, 1, 0:
state = [-0.261309788527170e8; 1.328215383161280e8; 0.575776462579674e8; -29.799238193069172; -4.958631175809364; -2.149426725759075];

options = odeset('AbsTol', 1e-14, 'RelTol', 1e-14);
[t_out, r_out] = ode45(@orbdyn, t, state, options);

% c)
% --------------------------------------------------------------------------------------------------------------------------------------
distance = vecnorm(r_out(:,1:3), 2, 2); %extracting distance from raw r_out
plot(t_out / 86400, distance); %converting from seconds to days

%extracting aphelion and perihelion
[maxDistance, idx] = max(distance);
aphelionDay = round(t_out(idx) / 86400);

[minDistance, idx] = min(distance);
perihelionDay = round(t_out(idx) / 86400);

epoch = datetime(2022, 1, 1);
aphelionDay = epoch + caldays(aphelionDay - 1);
perihelionDay = epoch + caldays(perihelionDay - 1);

aphelionStr = sprintf('aphelion of %.2fkm on day %s', maxDistance, datestr(aphelionDay));
perihelionStr = sprintf('perihelion of %.2fkm on day %s', minDistance, datestr(perihelionDay));
multilineLabel = sprintf('%s\n%s', aphelionStr, perihelionStr);

title('Distance from Earth to Sun vs. Time')
xlabel('Time (days)');
ylabel('Distance (km)');
legend(multilineLabel, 'Location', 'northeast');
grid on;

% d)
% ---------------------------------------------------------------------------------------------------------------------------------------
%{
aphelion of 152093209.11km on day 05-Jul-2022
perihelion of 147100895.01km on day 03-Jan-2022

These do not correspond to the equinoxes or solistices in 2022 (March 20,
June 20, Sept 22, Dec 21). However they are within a day of July 4 and Jan
4 for the actual recorded aphelion and periphelion for 2022.
%}

% e)
% ---------------------------------------------------------------------------------------------------------------------------------------

averageDistance = mean(distance); %averageDistance = 1.4961e+08
averageDistanceAU = averageDistance / (149597870700 / 1000); %averageDistanceAU = 1.0001
   
%these values agree very closely (within 0.01%)

% f)
% ---------------------------------------------------------------------------------------------------------------------------------------

h = cross(r_out(:,1:3), r_out(:,4:6)); %specific angular momentum
plot(t_out / 86400, h); %as shown they are all constant
title('specific angular momentum components Vs. Time');
xlabel('Time (days)');
ylabel('Specific Angular Momentum components (km^2 / s)');



















%Functions
%----------------------------------------------------------------------------------------------------------------------------------------
function statedot = orbdyn(t, state)
    %deconstructing state vector
    r = state(1:3);
    v = state(4:6);

    %gravitational acceleration
    rNorm = norm(r);
    accEarth = (-132712440041.279419 / rNorm^3) * r; %muSun = 132712440041.279419

    statedot = [v; accEarth];
end