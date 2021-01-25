%% create a maze randomly by asigning the index of bombs randomly. 

episode = [1 2 3 5 10 20 30 50 70 90 120 150 200]
for i=3:8
disp('size:')
disp(i)
	m=i	;
	n=m ;
	map = ones(m,n);
	plt = [];
	for j=1:round(m * n *0.2)
			
			map(randi([1,m]),randi([1,n]))=-50;
	end
	starting_point=[1 1]
	goal=[m m];

	for EP = episode
	res = [];
		for trial = 1:10	
			[path Q_table success]=Solving_Maze(map,starting_point,goal,EP,m*n);     %staring_point and goal is the coordinate
			res = [res success];
		endfor
	plt= [plt mean(res)];
	endfor
	figure(i)
	plot(episode, plt)
	title(strcat('probability of successfully solving the maze with size ', num2str(i)))
endfor