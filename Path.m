function [path, success]=Path(Q_table,starting_point,map)
	path=[];
	%%[y x]=size(map);
	
	[m n] = size(map);
	count_down = m * n;
	x=starting_point(2);
	y=starting_point(1);
	state = sub2ind(size(map),y,x);
	success = 1;
	g = 0;
	while count_down >= 0
			action=find(Q_table(state,:)==max(Q_table(state,:)));
			if action==1
					x=x+1;
			elseif action==2
					y=y-1;
			elseif action==3
					x=x-1;
			else
					y=y+1;
			endif
			if min(x, y) <= 0 || max(x, y) > m
				success = 0;
				break;
			endif
			state = sub2ind(size(map),y,x);
			g = max(state, g);
			count_down -= 1;
			path=[path; state];
			if g == (m * n)
				break;
			endif
	end
	% x
	% y
	% m
	% n
	success = g == (m * n);
end
    
    
