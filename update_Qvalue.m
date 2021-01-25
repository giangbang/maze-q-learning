function [Q_table] = update_Qvalue(state,new_state,Q_table,act,alpha,gamma,t,map)
        
    % Confirm rewards
        obstacle=ismember(new_state,find(map==-50));
        goal=ismember(new_state,find(map==100));
        if obstacle==true
            reward=-200;
        elseif goal==true
            reward=100;
        elseif t==100
            reward=-25;
        else
            reward=0;
        end
       
         Q_table(state,act) = (1 - alpha) * Q_table(state,act) + alpha * (reward + gamma * max(Q_table(new_state,:)));
end