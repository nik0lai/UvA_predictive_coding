%% GAT matrices computation and ploting
% GAT matrices computation and ploting to elaborate general results
% presentation.

% Outline:
% 1. Expectation session
% 1.1 Cue prediction


%% Paths setting
result_folder_path = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/MVPA_RESULTS/'; % dell15R path
plots_folder_path  = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/plots_gen_results/';        % dell15R path

%% Session dealt with
session = 'expectation';

%% 1. Expectation
%% 1.1 Cue prediction

%% ... General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz/'];     % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

channelpools          = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool

%% ... Compute each channelpool (UNCORRECTED)
% Correction method
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% ... Ploting (UNCORRECTED)
% cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                     % ver/hor reference lines

% actual ploting
adam_plot_MVPA(cfg, [exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.ALL ...
                    exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.FRONTAL ...
                    exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.OCCIP]);
pause(2)
close(gcf)

%% ... Plot each channpool separately (UNCORRECTED)

folder_to_plot = '/cue_prediction/complete_trial';
str_to_loop = exp.cue_prediction.(cfg.mpcompcor_method).complete_trial;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/cue_prediction_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end

%% ... Compute each channelpool (CLUSTER_BASED)
% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% ... Ploting (CLUSTER_BASED)
cfg.referenceline = -2000;                     % ver/hor reference lines

% actual ploting
adam_plot_MVPA(cfg, [exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.ALL ...
                    exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.FRONTAL ...
                    exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.OCCIP]);
pause(2)
close(gcf)

%% ... Plot each channpool separately (CLUSTER_BASED)

folder_to_plot = '/cue_prediction/complete_trial/';
str_to_loop = exp.cue_prediction.(cfg.mpcompcor_method).complete_trial;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/cue_prediction_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end

%% ... Compute GAT for STIM time window
cfg.timelim           = [0 1000]; % constrain train/test time to stim time-window

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.cue_prediction.(cfg.mpcompcor_method).stim_time.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% ... Plot each channpool separately (CLUSTER_BASED)
cfg.referenceline = [];                     % ver/hor reference lines

folder_to_plot = '/cue_prediction/stim_time/';
str_to_loop = exp.cue_prediction.(cfg.mpcompcor_method).stim_time;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/cue_prediction_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end

%% ... Compute GAT for CUE time window
cfg.timelim           = [-1950 -500]; % constrain train/test time to stim time-window

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.cue_prediction.(cfg.mpcompcor_method).cue_time.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% ... Plot each channpool separately (CLUSTER_BASED)
cfg.referenceline = [];                     % ver/hor reference lines

folder_to_plot = '/cue_prediction/cue_time/';
str_to_loop = exp.cue_prediction.(cfg.mpcompcor_method).cue_time;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/cue_prediction_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


%% ... Train on constrained time windows (convert to loop so it can be feed with many time-windows
%  using this two different time-window to train the classifier show the
%  difference in what can be decoded by the classifier. The first 170 ms
%  are capable to decode the activity sustained for ~750 ms after the cue
%  is presented. Also, when the training window is extended to 650 ms the
%  classifier is capable to decode up until the presentation of the target
%  item.


cfg.timelim       = [];
cfg.referenceline = [];

% training limits, add new ones as new rows
trainlims = [-1950 -1780; ...
             -1950 -1300];

% average training and display testing
cfg.reduce_dims       = 'avtrain';

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)


for countTTime      = 1:size(trainlims, 1);
    cfg.trainlim    =  trainlims(countTTime ,:);
    trainlim_lab = strrep(strrep(num2str(cfg.trainlim), ' ', '_'), '-', 'm');
    
    
    for countChann = 1:numel(channelpools);
        currChann  = channelpools{countChann};          % channel pool
        
        cfg.channelpool = currChann;                    % set channel pool
        exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.(trainlim_lab).(currChann) = adam_compute_group_MVPA(cfg); % compute stats
        
    end
    
    if countTTime == size(trainlims,1)
        cfg.trainlim = [];
        cfg.reduce_dims = [];
    end
        
end

%%

folder_to_plot = '/cue_prediction/cue_trainlim/';

str_to_loop = exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime;

train_labs = fieldnames(str_to_loop);


for countTTime      = 1:numel(train_labs);
 
    
    for countChann = 1:numel(channelpools);
        currChann  = channelpools{countChann};          % channel pool
        
        cfg.channelpool = currChann;                    % set channel pool
              
        adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.(train_labs{countTTime}).(currChann))
        pause(2); % pause to allow the graphic to resize           
        
        mkdir([plots_folder_path session folder_to_plot]); % create dir if non-existent. if dir exists, it will warn
        saveas(gcf, [plots_folder_path session folder_to_plot '/cue_pred_' trainlim_lab '_' cfg.mpcompcor_method '.png']);
        close(gcf);
    
    
    end
    
    %%CLEANING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if countTTime == size(trainlims,1);
        cfg.trainlim = [];
        cfg.reduce_dims = [];
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%% BUG
cfg = rmfield(cfg, 'trainlim')

adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.ALL)
adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.FRONTAL)
adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.OCCIP)

adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.ALL)
adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.FRONTAL)
adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.OCCIP)


%%

short_train                  = adam_compute_group_MVPA(cfg); % compute stats
adam_plot_MVPA(cfg, short_train);
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/cue_trainlim/cue_pred_-1950to-1780_corr.png']);
    close(gcf);

cfg.trainlim           = [-1950 -1300];
cfg.channelpool        = 'ALL';
large_train                   = adam_compute_group_MVPA(cfg); % compute stats
adam_plot_MVPA(cfg, large_train);
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/cue_trainlim/cue_pred_-1950to-1300_corr.png']);
    close(gcf);

%% 1.2 Predicted stim
%% General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz/'];    % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

%% Uncorrected for mult comp
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_stim.uncorrected.predicted.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                     % ver/hor reference lines

% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [exp_stim.uncorrected.predicted.ALL ...
                     exp_stim.uncorrected.predicted.FRONTAL...
                     exp_stim.uncorrected.predicted.OCCIP]);

%% Plot separately to save as png (Convert to loop)

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.uncorrected.predicted.(currChann));
    title([strrep(exp_stim.uncorrected.predicted.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/pred_stim/pred_stim_' currChann '_uncorr.png']);
    close(gcf);
    
end

%% Cluster-based correction for mult comp
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_stim.corr.predicted.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [exp_stim.corr.predicted.ALL...
                     exp_stim.corr.predicted.FRONTAL...
                     exp_stim.corr.predicted.OCCIP])

%% Plot separately to save as png
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.corr.predicted.(currChann));
    title([strrep(exp_stim.corr.predicted.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/pred_stim/pred_stim_' currChann '_corr.png']);
    close(gcf);
    
end

%% Compute GAT for STIM time window

cfg.timelim           = [0 1000];
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_stim.corr.stim_timelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.corr.stim_timelim.(currChann));
%   title([strrep(exp.cue_prediction.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/pred_stim_timelim/pred_stim_' currChann '_corr.png']);
    close(gcf);
    
end

%% Compute GAT for cue time window

cfg.timelim           = [-1950 -500];
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_stim.corr.pred_stim_cuetimelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.corr.pred_stim_cuetimelim.(currChann));
%   title([strrep(exp.cue_prediction.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/pred_stim_cuetimelim/pred_stim_' currChann '_corr.png']);
    close(gcf);
    
end
   

%% 1.2 UNpredicted stim
%% General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz/'];    % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

%% Uncorrected for mult comp
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_stim.uncorrected.unpredicted.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                     % ver/hor reference lines

% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [exp_stim.uncorrected.unpredicted.ALL ...
                     exp_stim.uncorrected.unpredicted.FRONTAL...
                     exp_stim.uncorrected.unpredicted.OCCIP]);

%% Plot separately to save as png (Convert to loop)

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.uncorrected.unpredicted.(currChann));
    title([strrep(exp_stim.uncorrected.unpredicted.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/unpred_stim/unpred_stim_' currChann '_uncorr.png']);
    close(gcf);
    
end

%% Cluster-based correction for mult comp
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_stim.corr.unpredicted.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [exp_stim.corr.unpredicted.ALL...
                     exp_stim.corr.unpredicted.FRONTAL...
                     exp_stim.corr.unpredicted.OCCIP])

%% Plot separately to save as png
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.corr.unpredicted.(currChann));
    title([strrep(exp_stim.corr.unpredicted.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/unpred_stim/unpred_stim_' currChann '_corr.png']);
    close(gcf);
    
end

%% Compute GAT for STIM time window

cfg.timelim           = [0 1000];
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_stim.corr.unpred_stim_timelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.corr.unpred_stim_timelim.(currChann));
%   title([strrep(exp.cue_prediction.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/unpred_stim_timelim/unpred_stim_' currChann '_corr.png']);
    close(gcf);
    
end

%% Compute GAT for cue time window

cfg.timelim           = [-1950 -500];
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_stim.corr.unpred_stim_cuetimelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.corr.unpred_stim_cuetimelim.(currChann));
%   title([strrep(exp.cue_prediction.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/unpred_stim_cuetimelim/unpred_stim_' currChann '_corr.png']);
    close(gcf);
    
end
   