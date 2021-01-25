function [path Q_table success]=Solving_Maze(map,starting_point,goal,EP,length)       %staring_point and goal is the coordinate
agent=300;  %% the intensity of the agent.
[m n]=size(map);
map=map;
% map = ones(m,n);
% for i=1:40
%     map(randi([1,m]),randi([1,n]))=-50;
% end
map(starting_point(1),starting_point(2)) = agent;
map(goal(1),goal(2)) = 100; %goal
% figure(1)
% imagesc(map)
% colormap(summer)
for i=1:m
    for j=1:n
        if map(i,j)==min(min(map))
            text(j,i,'X','HorizontalAlignment','center');
        end
    end
end
% text(starting_point(2),starting_point(1),'START','HorizontalAlignment','center');
% text(goal(2),goal(1),'GOAL','HorizontalAlignment','center');
% axis off
%%define parameter for Q function
gamma=0.9;
alpha=1;

%%creating a Q table
Q_table=rand(numel(map),4);
for episode=1:EP
    maze=zeros(size(map));
    maze(1)=agent;
    epsilon = 1 - (episode / 1001) ;
    for t=1:length
        state=find(maze==agent);
        if state==find(map==100)
            break;
        end
    [act , new_maze ] = Action(maze,Q_table,epsilon,agent);
    new_state=find(new_maze==agent);
    [Q_table] = update_Qvalue(state,new_state,Q_table,act,alpha,gamma,t,map);
    maze=new_maze;
    end
end
% disp('done')
%% this block is meant to display the route that the agent will move
Q_table;
[path, success]=Path(Q_table,starting_point,map);
final_path=map;
final_path(path)=400;
% figure(2)
% imagesc(final_path)
% colormap(summer)
% for i=1:m
    % for j=1:n
        % if map(i,j)==min(min(map))
            % text(j,i,'X','HorizontalAlignment','center');
        % end
    % end
% end
% text(starting_point(2),starting_point(1),'START','HorizontalAlignment','center');
% text(goal(2),goal(1),'GOAL','HorizontalAlignment','center');
% axis off
end

    







