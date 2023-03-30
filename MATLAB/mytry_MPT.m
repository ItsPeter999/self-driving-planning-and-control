sys = LTISystem('A', [1 1; 0 1],'B', [1; 0.5]);
sys.x.min = [-5; -5];
sys.x.max = [5, 5];
sys.u.min = -1;
sys.u.max = 1;
sys.x.penalty = QuadFunction(eye(2));
sys.u.penalty = QuadFunction(1);
sys.x.with('terminalPenalty');
sys.x.terminalPenalty=QuadFunction(5*eye(2));
sys.x.with('terminalSet');
sys.x.terminalSet = Polyhedron('lb',[-1;-1], 'ub', [1;1]);
N = 5;
expc = MPCController(sys,N).toExplicit();

simple = expc.simplify('fitting');

simple.partition.plot();

[a, w] = expc.comparePerformance(simple);