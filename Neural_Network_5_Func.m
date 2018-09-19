function Neural_Network_Func(handles)

%% Neural_Network_2_19.m
% Simulation of network of Hodgekin-Huxley neurons.
%   Includes STDP learning.
% Simulation created by Justin Skycak; GUI created by EG Sect 9 group 6 


hwb = waitbar(0, 'Simulation Progress');

%%===========SET UP NETWORK & STIMULI============

%% simulation time resolution

simTime = str2double(get(handles.timeText, 'String')); % stimulation time (ms)
tSize = str2double(get(handles.stepText, 'String')); % timestep size (ms)
tNum = simTime/tSize; % number of timesteps
tVec = 0:tSize:tNum*tSize; % time vector

%% network topology

W(1,1) = str2double(get(handles.w11text, 'String'));
W(1,2) = str2double(get(handles.w12text, 'String'));
W(1,3) = str2double(get(handles.w13text, 'String'));

W(2,1) = str2double(get(handles.w21text, 'String'));
W(2,2) = str2double(get(handles.w22text, 'String'));
W(2,3) = str2double(get(handles.w23text, 'String'));

W(3,1) = str2double(get(handles.w31text, 'String'));
W(3,2) = str2double(get(handles.w32text, 'String'));
W(3,3) = str2double(get(handles.w33text, 'String'));

W = W/5;
N=3;


delayMin = 1; % min time (ms) to look back for learning
delayMax = 20; % max time (ms) to look back for learning
propDelay = 1; % time (ms) for a signal from one neuron to reach another
        

%% set external stim

stimMagn = str2double(get(handles.amplText, 'String')); % stimulus magnitude (mV)
stimDur = str2double(get(handles.durText, 'String')); % stimulus duration (ms)
stimPer = str2double(get(handles.perText, 'String')); % stimulus period (ms)

stim = zeros(N,tNum+1);

stimTrue = [get(handles.stim1, 'Value'), get(handles.stim2, 'Value'), ...
    get(handles.stim3, 'Value')];

for i = 1:1:N
    if stimTrue(i)
        for j=1:stimPer/tSize:tNum+1-stimDur/tSize
            stim(i,j:j+stimDur/tSize) = stimMagn; % stim (stimulus) waveform
        end
    end
end

%% stdp learning parameters

A = 1; % scales STDP function
spikeThreshold = 60; % depolarization (mV) at which we can assume a spike
                     % is occurring

dmin = 1;
dmax = 10/tSize; % number of timesteps to look back for learning
propdelay = 1/tSize;

%% HH simulation constants

gbar_Na=120; gbar_K=36; g_L=.3; % conductances
V_Na=115; V_K=-12; V_L=10.6; % reversal potentials
C=1; % membrane conductance
restV = -65; % resting potential

%%============NUMERICAL APPROXIMATION=================

%% initial conditions

% all Eqs in [1]
for i=1:1:N
    V(i,1)=0; % resting voltage (mV) (will shift to restV at end)
    nowV = V(i,1); % for use in computation
    
    alpha_n(i,1) = .01*((10-nowV)/(exp((10-nowV)/10)-1)); % Eq 12
    beta_n(i,1) = .125*exp(-nowV/80); % Eq 13
    alpha_m(i,1) = .1*((25-nowV)/(exp((25-nowV)/10)-1)); % Eq 20
    beta_m(i,1) = 4*exp(-nowV/18); % Eq 21
    alpha_h(i,1) = .07*exp(-nowV/20); % Eq 23
    beta_h(i,1) = 1/(exp((30-nowV)/10)+1); % Eq 24

    n(i,1) = alpha_n(i,1)/(alpha_n(i,1)+beta_n(i,1)); % Eq 9
    m(i,1) = alpha_m(i,1)/(alpha_m(i,1)+beta_m(i,1)); % Eq 18
    h(i,1) = alpha_h(i,1)/(alpha_h(i,1)+beta_h(i,1)); % Eq 18  
end

I_adj = zeros(N,1); % stim contributions from neighboring neurons
I = zeros(N,1); % stims given off by neurons
crosspoint = zeros(N,tNum+1); % will store spike times

Wadj = []; % will store weight adjustment times


%% first-order approximation
adjTime = 0;
for j=1:1:tNum
    adjTime = adjTime + 1;
    for i=1:1:N
        nowV = V(i,j);
        
        % coefficients calculated using previous equations at each
        % time step
        alpha_n(i,j) = .01*((10-nowV)/(exp((10-nowV)/10)-1)); % Eq 12
        beta_n(i,j) = .125*exp(-nowV/80); % Eq 13
        alpha_m(i,j) = .1*((25-nowV)/(exp((25-nowV)/10)-1)); % Eq 20
        beta_m(i,j) = 4*exp(-nowV/18); % Eq 21
        alpha_h(i,j) = .07*exp(-nowV/20); % Eq 23
        beta_h(i,j) = 1/(exp((30-nowV)/10)+1); % Eq 24
    
        % ion stim calculations
        g_Na = m(i,j)^3*h(i,j)*gbar_Na; % Eq 14
        I_Na(i,j) = g_Na*(nowV-V_Na); % Eq 3
        
        g_K = n(i,j)^4*gbar_K; % Eq 6
        I_K(i,j) = g_K * (nowV-V_K); %Eq 4
        
        I_L(i,j) = g_L*(nowV-V_L); % Eq 5
        
        I_self(i,j) = - I_K(i,j) - I_Na(i,j) - I_L(i,j);
            % Eq 26
            % net stim flow due to stimulus and intracellular
            % processes

        % include stimulus for stimulated neurons
        if stimTrue(i)
            I_self(i,j) = I_self(i,j) + stim(i,j);
        end
        
            
        % find stim contribution from adjacent neurons
        % extends Hodgkin-Huxley model to network of neurons
        if j > propDelay/tSize
           I_adj(i,j) = W(i,:)*I_self(:,j-propDelay/tSize); % current due to
                                             % activity in adjacent
                                             % neurons
           I(i,j) = I_self(i,j) + I_adj(i,j-1); % total current
        else
           I(i,j) = I_self(i,j); % because I_adj doesn't contribute before
                                 % propdelay
        end

        % first order approximation of derivatives
        V(i,j+1) = V(i,j) + tSize*I(i,j)/C; % Eq 26
        n(i,j+1) = n(i,j) + tSize*(alpha_n(i,j)*(1-n(i,j)) - ...
            beta_n(i,j)*n(i,j)); % Eq 7
        m(i,j+1) = m(i,j) + tSize*(alpha_m(i,j)*(1-m(i,j)) - ...
            beta_m(i,j)*m(i,j)); % Eq 15
        h(i,j+1) = h(i,j) + tSize*(alpha_h(i,j)*(1-h(i,j)) - ...
            beta_h(i,j)*h(i,j)); % Eq 16
        
%         if n(i,j+1) > 1 || m(i,j+1) > 1 || h(i,j+1) > 1
%             error('ABORT: Channel open probability above 1')
%         end
%         
%         if n(i,j+1) < 0 || m(i,j+1) < 0 || h(i,j+1) < 
%             error('ABORT: Channel open probability below 0')
%         end

        if V(i,j+1) > 200 || V(i,j+1) < -100
            error('ABORT')
        end
        
        % store threshold-crossing times (occurs a spike is happening)
        if V(i,j+1) > spikeThreshold && V(i,j) < spikeThreshold
            crosspoint(i,j+1) = 1; % started to spike
        end
    end
        
        
    % Weight updates (STDP learning) (continued j for-block)      
    if j > 2*dmax && j < tNum - 2*dmax
        for pre=1:1:N
            for post=1:1:N
                if post ~= pre
                    for d=1:1:1/tSize-1 % linear realm
                        
                        % if post fired after pre, increase weight
                        if crosspoint(pre,j-10/tSize-d) == 1 && ...
                                crosspoint(post,j-10/tSize) == 1
                            W(post,pre) = W(post,pre)*...
                                (1+A*exp(-1/10)*tSize*d);
                        end
                        
                        % if post fired before pre, decrease weight
                        if crosspoint(pre,j-10/tSize+d) == 1 && ...
                                crosspoint(post,j-10/tSize) == 1
                            W(post,pre) = W(post,pre)*...
                                (1-A*exp(-1/10)*tSize*d);
                        end
                    end
                    
                    for d=1/tSize:1:10/tSize % exp decay realm
                        
                        % if post fired after pre, increase weight
                        if crosspoint(pre,j-10/tSize-d) == 1 && ...
                                crosspoint(post,j-10/tSize) == 1
                            W(post,pre) = W(post,pre)*...
                                (1+A*exp(-d*tSize/10));
                        end
                        
                        % if post fired before pre, decrease weight
                        if crosspoint(pre,j-10/tSize+d) == 1 && ...
                                crosspoint(post,j-10/tSize) == 1
                            W(post,pre) = W(post,pre)*...
                                (1-A*exp(-d*tSize/10));
                        end
                    end
                end
            end
        end
    end

    waitbar(j/tNum, hwb);      
                
end
close(hwb)
V=V+restV; % shift to biological resting voltage
Wpost = W*5;

set(handles.w11post,'String',num2str(Wpost(1,1)));
set(handles.w12post,'String',num2str(Wpost(1,2)));
set(handles.w13post,'String',num2str(Wpost(1,3)));

set(handles.w21post,'String',num2str(Wpost(2,1)));
set(handles.w22post,'String',num2str(Wpost(2,2)));
set(handles.w23post,'String',num2str(Wpost(2,3)));

set(handles.w31post,'String',num2str(Wpost(3,1)));
set(handles.w32post,'String',num2str(Wpost(3,2)));
set(handles.w33post,'String',num2str(Wpost(3,3)));


colonORdash = char(':','-');

plot(handles.plotAxes, tVec, V(1,:), ['b',colonORdash(stimTrue(1)+1)],...
    tVec, V(2,:), ['g',colonORdash(stimTrue(2)+1)],...
    tVec, V(3,:), ['r',colonORdash(stimTrue(3)+1)],...
    tVec,stim,'k-',...
    tVec, 100+50*crosspoint(1,:), ['b',colonORdash(stimTrue(1)+1)],...
    tVec, 100+50*crosspoint(2,:), ['g',colonORdash(stimTrue(2)+1)],...
    tVec, 100+50*crosspoint(3,:), ['r',colonORdash(stimTrue(3)+1)]);

title(handles.plotAxes,'Neuron Voltages (mV) and Stimulus (mA)')
xlabel(handles.plotAxes,'Time (ms)')
ylabel(handles.plotAxes,'Voltage (mV) and Stimulus (mA)')


for i=1:1:N
    legendInfo{i} = ['Neuron ',num2str(i)];
end
legendInfo{N+1} = 'Stimulus';

legend(handles.plotAxes,legendInfo,'Location','BestOutside')