%ShermanPeter_HW3_Problem2.m

%loading kernels
kernelDir = fileparts(mfilename('fullpath')); 
cspice_furnsh(fullfile(kernelDir, 'naif0012.tls'));
cspice_furnsh(fullfile(kernelDir, 'pck00010.tpc'));
cspice_furnsh(fullfile(kernelDir, 'de440.bsp'));

%part a)
%------------------------------------------------------------------------------------------------------
%{ 
I chose to use p-iteration for my approach to solving the lambert's
function for two main reasons. The first reason is that the actual
p-iteration methodology is a lot more understandable for me compared to the
universal variables. The second reason is that in my research, universal
variables is a lot more common to use, so I wanted to be exposed to the
p-iteration method here due to the fact that I may never have to use it in the future.
%}

%part b)
%--------------------------------------------------------------------------------------------------------
%{
The mars reconnaissance orbiter (MRO) was launched on August 12th, 2005,
and entered mars orbit on march 10, 2006. The primary goal of the MRO was
to study Mars' atmosphere, surface, and subsurface to better understand the
planet's geological and climate history (Zurek & Smrekar, 2007). It was
equipped with six scientific instruments to collect high-resolution
imagery, mineralogical measurements, atmospheric observations, and
subsurface radar data to investigate the presence and role of water on
mars. Additionally, MRO supports future Mars exploration by identifying
valuable and safe landing sites and serving as a communications relay for
surface missions (NASA).

SOURCES:
1. Peer-reviewed journal paper: Zurek, R. W., & Smrekar, S. E. (2007). An overview of the Mars Reconnaissance Orbiter (MRO) science mission. 
                                       Journal of Geophysical Research: Planets, 112(E5), E05S01. https://doi.org/10.1029/2006JE002701 
                                       Wiley Online Library
2. NASA: NASA. (n.d.). Mars Reconnaissance Orbiter: Science. NASA Science. https://science.nasa.gov/mission/mars-reconnaissance-orbiter/science/

%}

%part c)
%------------------------------------------------------------------------------------------------------
%pulling data from kernels
et0 = cspice_str2et('2005 FEB 12 11:43:00.0 UTC'); %ephemeris time at epoch //IMPORTANT: USED FEB INSTEAD OF AUG BECAUSE OF ASSIGNMENT DIRECTIONS
state0_earth = cspice_spkezr('EARTH', et0, 'J2000', 'NONE', 'SUN'); %r0_earth = 1.0e+08 * {-1.1918, 0.8003, 0.3470} km

%part d)
%------------------------------------------------------------------------------------------------------
et1 = cspice_str2et('2006 MAR 10 21:24:00.0 UTC');
state1_mars = cspice_spkezr('MARS BARYCENTER', et1, 'J2000', 'NONE', 'SUN'); %r1_mars = 1.0e+08 * {-0.7554, 2.0729, 0.9712} km

%part e)
%-------------------------------------------------------------------------------------------------------
%TOF from launch from Earth to landing on Mars in seconds 
dt = et1 - et0; %dt = 3.3817e+07 seconds

%part f)
%------------------------------------------------------------------------------------------------------
r0_earth = state0_earth(1:3);
r1_mars = state1_mars(1:3);

R = cspice_pxform('ECLIPJ2000', 'J2000', et0); %rotation tensor between eclipticJ2000 to ICRFJ2000
n = R * [0; 0; 1]; %applying rotation to normal vec in eclipitcJ2000 to ICRFJ2000

%calculating angle between earth and mars 
dTheta = mod(rad2deg(atan2(dot(cross(r0_earth, r1_mars), n), dot(r0_earth, r1_mars))), 360); %dTheta = 324.4702 deg

%Since dTheta = 324 deg, it means that the orbit segment was a 'long way' transfer
if dTheta > 180
    swlw = 1; % long-way transfer
else
    swlw = 0; % short-way transfer
end

%part g)
%---------------------------------------------------------------------------------------------------------
mu = 1.32712440041279419e11; %km^3/s^2
[v0_earth, v1_mars] = lambert(r0_earth, r1_mars, dt, swlw, mu)





























%----------------------------------------------------------------
%FUNCTIONS
function [v1, v2] = lambert(r1, r2, dt, swlw, mu)
    
    i = 0;
    iterate = true;
    while iterate
        i = i + 1;

        %computing deltaTheta with quadrant check
        deltaTheta = acos(dot(r1, r2)/(vecnorm(r1) * vecnorm(r2)));
        if swlw == 1
            deltaTheta = 2*pi - deltaTheta;
        end
           

        %calculate k, l, and m
        mag_r1 = vecnorm(r1);
        mag_r2 = vecnorm(r2);
        k = (mag_r1) * (mag_r2) * (1 - cos(deltaTheta));
        l = mag_r1 + mag_r2;
        m = (mag_r1) * (mag_r2) * (1 + cos(deltaTheta));
    
        if i == 1
            %guess P
            if swlw == 0
                P = k / (l - sqrt(2 * m));
            else
                P = k / (l + sqrt(2 * m));
            end
        end

        %compute a(p)
        a = (m * k * P) / (((2 * m - l^2) * P^2) + (2 * k * l * P - k^2));
    
        %compute f, fdot, g functions
        f = 1 - (mag_r2/P) * (1 - cos(deltaTheta));
        fdot = sqrt(mu/P) * tan(deltaTheta / 2) * (((1 - cos(deltaTheta)) / P) - (1/mag_r1) - (1/mag_r2));
        g = ((mag_r1 * mag_r2) / sqrt(mu * P)) * sin(deltaTheta);
        gdot = 1 - (mag_r1 / P) * (1 - cos(deltaTheta));
    
        %compute deltaT based on the sign of a (elliptical or hyperbolic)
        if a > 0
            sindeltaE = - (mag_r1 * mag_r2 * fdot) / sqrt(mu * a);
            cosdeltaE = 1 - (mag_r1 / a) * (1 - f);
            deltaE = mod(atan2(sindeltaE, cosdeltaE),2*pi); %mod for angle wrapping
            deltaT = g + sqrt(a^3 / mu) * (deltaE - sin(deltaE));
    
            %calulate dt/dp for later use
            t = g + sqrt(a^3 / mu) * (deltaE - sin(deltaE));
            dtdp = -g / (2 * P) - (3/2) * a * (t-g) * ((k^2 + (2 * m - l^2) * P^2)/(m * k * P^2)) + sqrt(a^3/mu)*(2 * k * sin(deltaE)/(P * (k-l * P)));
        else
            deltaF = acosh(1 - (mag_r1 / a) * (1 - f));
            deltaT = g + sqrt((-a)^3 / mu) * (sinh(deltaF) - deltaF);
    
            %calulate dt/dp for later use
            t = g + sqrt(a^3 / mu) * (deltaF - sin(deltaF));
            dtdp = -g / (2 * P) - (3/2) * a * (t-g) * ((k^2 + (2 * m - l^2) * P^2)/(m * k * P^2)) + sqrt(a^3/mu)*(2 * k * sinh(deltaF)/(P * (k-l * P)));
        end
        
        error = abs(deltaT - dt);
        if error < 1e-3
           iterate = false;
        else 
            P = P - (deltaT - dt) / dtdp;
        end

    end %end while
    
    v1 = (1/g) * (r2 - f * r1);
    v2 = (1/g) * (gdot * r2 - r1); 
end

