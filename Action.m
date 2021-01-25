function [act , new_maze ] = Action(maze,Q_table,epsilon,agent)
    out = 0 ;
    [Y X]=size(maze);
    while out == 0
        [y x]=find(maze==agent);
        state=find(maze==agent);

    % Determine actions (É√-greedy algorithm)
        random = rand ;
        if epsilon <= random
            max_value = max(Q_table(state,:));
            [Q act]=find(Q_table==max_value);
        else
            random_value = rand ;
            if random_value <= 0.25
                act = 1 ;
            elseif random_value <= 0.5
                act = 2 ;
            elseif random_value <= 0.75
                act = 3 ;
            else
                act = 4 ;
            end
        end
        
    % Creation of the labyrinth panel at the transition destination
        if act == 1
            x = x + 1 ;
        elseif act == 2
            y = y -1 ;
        elseif act == 3
            x = x -1 ;
        else 
            y = y + 1 ;
        end
        
        % If the action results in going outside the framework of the board, make a decision again.
        if x == 0
            out = 0 ;
        elseif y == 0
            out = 0 ;
        elseif x == X+1;
            out = 0 ;
        elseif y == Y+1;
            out = 0 ;
        else
            out = out + 1 ;
        end
    end
        new_maze = zeros(Y,X);
        new_maze(y,x) = agent;
end