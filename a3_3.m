
FitnessFunction = @simple_fitness;
numberOfVariables = 1;
generations = 10;
stallgenerations =10; %10;
max_time = 0.1;
functiontolerance = 1e-6;


%default : Maxgeneration:100; MaxStallgeneration: 50; Maxtime: infinity;
%FunctionTolerance: 1e-6

% test different generations(generation: 10,100,190)
while generations <= 190
    options = optimoptions(@ga,...
    'display','off', ...
    ... 'PlotFcn',@gaplotbestf, ...
    ...'CrossoverFraction',cross,...
    ...'MutationFcn',{@mutationadaptfeasible,1,mut},...
    'FunctionTolerance', 1e-6,...
    'MaxGenerations', generations,...
    'MaxStallGenerations',50);
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with Max generations = ' num2str(generations)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],1, options);
    toc
    generations = generations + 90;
    disp(output);
    disp(['Max found x = ' num2str(x)]);
    disp(['Max found f_max = ' num2str(-fval)]);
    disp('-------------------------------------------------');
end

% test different stallgenerations(stallgeneration: 10,30,50)
while stallgenerations <= 50
    options = optimoptions(@ga,...
    'display','off', ...
    ... 'PlotFcn',@gaplotbestf, ...
    ...'CrossoverFraction',cross,...
    ...'MutationFcn',{@mutationadaptfeasible,1,mut},...
    'FunctionTolerance', 1e-6,...
    'MaxGenerations', stallgenerations,...
    'MaxStallGenerations',10);
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with Max Stallgenerations = ' num2str(stallgenerations)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],1, options);
    toc
    stallgenerations = stallgenerations + 20;
    disp(output);
    disp(['Max found x = ' num2str(x)]);
    disp(['Max found f_max = ' num2str(-fval)]);
    disp('-------------------------------------------------');
end

% test different max_time(max_time: 0.1,0.5,0.9)
while max_time <= 0.9
    options = optimoptions(@ga,...
    'display','off', ...
    ... 'PlotFcn',@gaplotbestf, ...
    ...'CrossoverFraction',cross,...
    ...'MutationFcn',{@mutationadaptfeasible,1,mut},...
    'FunctionTolerance', 1e-6,...
    'MaxGenerations', 100,...
    'MaxStallGenerations',50);
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with Max time = ' num2str(max_time)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],1, options);
    toc
    max_time = max_time + 0.4;
    disp(output);
    disp(['Max found x = ' num2str(x)]);
    disp(['Max found f_max = ' num2str(-fval)]);
    disp('-------------------------------------------------');
end

% test different function tolerance(functiontolerance:1e-6, 2* 1e-6, 3*1e-6 )
while functiontolerance <= 3*1e-6
    k = 1;
    options = optimoptions(@ga,...
    'display','off', ...
    ... 'PlotFcn',@gaplotbestf, ...
    ...'CrossoverFraction',cross,...
    ...'MutationFcn',{@mutationadaptfeasible,1,mut},...
    'FunctionTolerance', functiontolerance,...
    'MaxGenerations', 100,...
    'MaxStallGenerations',50);
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with function tolerance = ' num2str(functiontolerance)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],1, options);
    toc
    k = k+ 1;
    functiontolerance = k * 1e-6;
    disp(['Max found x = ' num2str(x)]);
    disp(['Max found f_max = ' num2str(-fval)]);
    disp('-------------------------------------------------');
end

