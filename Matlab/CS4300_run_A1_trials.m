function [res,M,V,CI1,CI2] = CS4300_run_A1_trials(num_trials)
% CS4300_run_A1_trials - run experiments for A1
% On input:
%     num_trials (int): number of trials
% On output:
%     res (num_trialsx3 array): results of trials
%     M (1x3 vector): means of trials
%      (1): distinct number of rooms visited
%      (2): number of FORWARD actions
%      (3): total number of actions
%     V (1x3 vector): variances of trials
%     CI1 (1x3 vector): lower bound on confidence intervals
%     CI2 (1x3 vector): upper bound on confidence intervals
% Call:
%     [res,M,V,CI1,CI2] = CS4300_run_A1_trials(200);
% Author:
%     T. Henderson
%     UU
%     Summer 2015
%

FORWARD = 1;

res = zeros(num_trials,3);
wb = waitbar(0,'Run A1');
for t = 1:num_trials
    waitbar(t/num_trials);
    trace = CS4300_WW2(Inf,'CS4300_agent1');
    res_t = CS4300_get_data(trace);
    res(t,1) = res_t(1);
    res(t,2) = res_t(2);
end
close(wb);

M = zeros(1,3);
V = zeros(1,3);
CI = zeros(1,3);

M = mean(res);
V = var(res);
CI1 = M - 1.96*sqrt(V/num_trials);
CI2 = M + 1.96*sqrt(V/num_trials);
tch = 0;

% Plot for Gold Reached
% plot(res(:,1));
% set(gca,'YTick',[0, 1] );
% title('Figure 2: Gold Reached for 2000 Trials')
% xlabel('Trial')
% ylabel('Gold Reached (Boolean)')

% Plot for Step Count
% plot(res(:,2));
% title('Figure 3: Number of Steps Taken')
% xlabel('Trial')
% ylabel('Number of Steps')