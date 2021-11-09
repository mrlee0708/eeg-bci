function [output] = arrow_randfunction (total_trial)

arrow_random(1:total_trial/2) = 1
arrow_random(total_trial/2+1:total_trial) = 2

idx = randperm(total_trial)

for i=1:total_trial
    tmp(1,i) = arrow_random(1,idx(1,i))
end

output = tmp;
