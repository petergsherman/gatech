%ShermanPeter_HW2

%step 1: Selection of points between eta = 0 and eta > 10;
N = 40;
K = 1.1;
ETA = zeros(N, 1);
deltaETA = zeros(N, 1);
deltaETA(2) = 0.02;

for j = 3:N
    deltaETA(j) = K * deltaETA(j - 1);
end

for j = 2:N
    ETA(j) = ETA(j-1) + deltaETA(j);
end

%step 2: Initilizing the G vector
G = ones(40, 1);
G(1) = 0;

%iterating to converge G
error = Inf;
while error > 1e-3

    oldG = G;

    %step 3: Computing f from G
    f = zeros(N, 1);
    for j = 1:N-1
        f(j+1) = f(j) + (1/2) * (G(j) + G(j+1)) * deltaETA(j+1);
    end
    
    %step 4: discretization of G dif-e
    A = zeros(N-1, 1);
    B = zeros(N, 1);
    C = zeros(N-1, 1);
    
    for j = 2:N-1
        A(j-1) = -f(j) + 2 / (deltaETA(j));
        C(j) =  f(j) + 2 / (deltaETA(j+1));
        B(j) = -(A(j-1) + C(j)) - G(j) * (deltaETA(j) + deltaETA(j+1));
    end
 
    %step 5: Solve the tridiagonal system Ax = b
    M = diag(B) + diag(A, -1) + diag(C, 1);
    M(1, :) = 0;
    M(1, 1) = 1;
    M(end, :) = 0;
    M(end, end) = 1;
    
    %step 6: apply boundary conditions
    RHS = zeros(N,1);
    for j = 2:N-1
        RHS(j) = - (deltaETA(j) + deltaETA(j+1));
    end
    RHS(N) = 1;
    
    %step 7: solve system of equations
    G = M \ RHS;

    error = max(abs(G - oldG));
end

%makking a table and plotting 
linearETA = linspace(0, 3.9, N)';
tableData_f = interp1(ETA, f, linearETA);
tableData_G = interp1(ETA, G, linearETA);

disp(table(linearETA, tableData_f, tableData_G))

%plotting 
exactG = [
    0.000000; 0.118265; 0.226612; 0.325241; 0.414456; 0.494649; 0.566281; 0.629861; 0.685937; 0.735079; 0.777865; 0.814873; 0.846671; 0.873808; 0.896809;
    0.916168; 0.932348; 0.945774; 0.956834; 0.965877; 0.973217; 0.979128; 0.983853; 0.987601; 0.990549; 0.992851; 0.994634; 0.996003; 0.997046; 0.997834;
    0.998424; 0.998863; 0.999186; 0.999422; 0.999593; 0.999716; 0.999803; 0.999865; 0.999908; 0.999938];

figure;
plot(linearETA, tableData_G, 'b-', 'LineWidth', 2);
hold on;
plot(linearETA, exactG, 'ro', 'MarkerSize', 5);

xlabel('\eta');
ylabel('G');
title('Computed vs. Exact Velocity Profile');
legend('Computed Solution', 'Exact Solution', ...
    'Location', 'southeast');
grid on;
hold off;