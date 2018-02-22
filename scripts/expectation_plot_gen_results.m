%% GAT matrices computation and ploting
% GAT matrices computation and ploting to elaborate general results
% presentation.

clear all
clc


%% Paths setting
result_folder_path = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/MVPA_RESULTS/'; % dell15R path
plots_folder_path  = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/plots_gen_results/';        % dell15R path

%% Session dealt with
session = 'expectation';

%% 1. Expectation
%% 1.1 CUE PREDICTION

%% ... General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
folder_name           = [result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

channelpools          = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool

%% ... Compute each channelpool (UNCORRECTED)
% Correction method
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
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
    
    pause(1)
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf); 
%% ... Compute each channelpool (CLUSTER_BASED)
% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.cue_prediction.(cfg.mpcompcor_method).complete_trial.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
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


close(gcf); 
%% ... Compute GAT for STIM time window
cfg.timelim           = [0 1000]; % constrain train/test time to stim time-window

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.cue_prediction.(cfg.mpcompcor_method).stim_time.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
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


close(gcf); 
%% ... Compute GAT for CUE time window
cfg.timelim           = [-1950 -500]; % constrain train/test time to stim time-window

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.cue_prediction.(cfg.mpcompcor_method).cue_time.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
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


close(gcf); 
%% ... Train on constrained time windows (convert to loop so it can be feed with many time-windows
%  using this two different time-window to train the classifier show the
%  difference in what can be decoded by the classifier. The first 170 ms
%  are capable to decode the activity sustained for ~750 ms after the cue
%  is presented. Also, when the training window is extended to 650 ms the
%  classifier is capable to decode up until the presentation of the target
%  item.


% % % cfg.timelim       = [];
% % % cfg.referenceline = [];
% % % 
% % % % training limits, add new ones as new rows
% % % trainlims = [-1950 -1780; ...
% % %              -1950 -1300];
% % % 
% % % % average training and display testing
% % % cfg.reduce_dims       = 'avtrain';
% % % 
% % % % Correction method
% % % cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)
% % % 
% % % 
% % % for countTTime      = 1:size(trainlims, 1);
% % %     cfg.trainlim    =  trainlims(countTTime ,:);
% % %     trainlim_lab = strrep(strrep(num2str(cfg.trainlim), ' ', '_'), '-', 'm');
% % %     
% % %     
% % %     for countChann = 1:numel(channelpools);
% % %         currChann  = channelpools{countChann};          % channel pool
% % %         
% % %         cfg.channelpool = currChann;                    % set channel pool
% % %         exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.(trainlim_lab).(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
% % %         
% % %     end
% % %     
% % %     if countTTime == size(trainlims,1)
% % %         cfg.trainlim = [];
% % %         cfg.reduce_dims = [];
% % %     end
% % %         
% % % end

%%

% % % folder_to_plot = '/cue_prediction/cue_trainlim/';
% % % 
% % % str_to_loop = exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime;
% % % 
% % % train_labs = fieldnames(str_to_loop);
% % % 
% % % 
% % % for countTTime      = 1:numel(train_labs);
% % %  
% % %     
% % %     for countChann = 1:numel(channelpools);
% % %         currChann  = channelpools{countChann};          % channel pool
% % %         
% % %         cfg.channelpool = currChann;                    % set channel pool
% % %               
% % %         adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.(train_labs{countTTime}).(currChann))
% % %         pause(2); % pause to allow the graphic to resize           
% % %         
% % %         mkdir([plots_folder_path session folder_to_plot]); % create dir if non-existent. if dir exists, it will warn
% % %         saveas(gcf, [plots_folder_path session folder_to_plot '/cue_pred_' trainlim_lab '_' cfg.mpcompcor_method '.png']);
% % %         close(gcf);
% % %     
% % %     
% % %     end
% % %     
% % %     %%CLEANING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %     if countTTime == size(trainlims,1);
% % %         cfg.trainlim = [];
% % %         cfg.reduce_dims = [];
% % %     end
% % %     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %         
% % % end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%% BUG
% % % cfg = rmfield(cfg, 'trainlim')
% % % 
% % % adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.ALL)
% % % adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.FRONTAL)
% % % adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.OCCIP)
% % % 
% % % adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.ALL)
% % % adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.FRONTAL)
% % % adam_plot_MVPA(cfg, exp.cue_prediction.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.OCCIP)


%%

% % % short_train                  = adam_compute_group_MVPA(cfg, folder_name); % compute stats
% % % adam_plot_MVPA(cfg, short_train);
% % %     pause(1); % pause to allow the graphic to resize                 
% % %     saveas(gcf, [plots_folder_path 'expectation/cue_trainlim/cue_pred_-1950to-1780_corr.png']);
% % %     close(gcf);
% % % 
% % % cfg.trainlim           = [-1950 -1300];
% % % cfg.channelpool        = 'ALL';
% % % large_train                   = adam_compute_group_MVPA(cfg, folder_name); % compute stats
% % % adam_plot_MVPA(cfg, large_train);
% % %     pause(1); % pause to allow the graphic to resize                 
% % %     saveas(gcf, [plots_folder_path 'expectation/cue_trainlim/cue_pred_-1950to-1300_corr.png']);
% % %     close(gcf);


%% 1.2 CORRECTLY PREDICTED STIM
%% General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
folder_name          = [result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];    % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

channelpools          = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool

%% ... Compute each channelpool (UNCORRECTED)
% Correction method
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
end

%% ... Ploting (UNCORRECTED)
% cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                     % ver/hor reference lines

% actual ploting
adam_plot_MVPA(cfg, [exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial.ALL ...
                    exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial.FRONTAL ...
                    exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial.OCCIP]);
pause(2)
close(gcf)

%% ... Plot each channpool separately (UNCORRECTED)

folder_to_plot = '/corr_pred_stim/complete_trial';
str_to_loop = exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/corr_pred_stim_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf); 
%% ... Compute each channelpool (CLUSTER_BASED)
% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
end

%% ... Ploting (CLUSTER_BASED)
cfg.referenceline = -2000;                     % ver/hor reference lines

% actual ploting
adam_plot_MVPA(cfg, [exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial.ALL ...
                    exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial.FRONTAL ...
                    exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial.OCCIP]);
pause(2)
close(gcf)

%% ... Plot each channpool separately (CLUSTER_BASED)

folder_to_plot = '/corr_pred_stim/complete_trial/';
str_to_loop = exp.corr_pred_stim.(cfg.mpcompcor_method).complete_trial;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/corr_pred_stim_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf); 
%% ... Compute GAT for STIM time window
cfg.timelim           = [0 1000]; % constrain train/test time to stim time-window

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.corr_pred_stim.(cfg.mpcompcor_method).stim_time.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
end

%% ... Plot each channpool separately (CLUSTER_BASED)
cfg.referenceline = [];                     % ver/hor reference lines

folder_to_plot = '/corr_pred_stim/stim_time/';
str_to_loop = exp.corr_pred_stim.(cfg.mpcompcor_method).stim_time;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/corr_pred_stim_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf); 
%% ... Compute GAT for CUE time window
cfg.timelim           = [-1950 -500]; % constrain train/test time to stim time-window

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.corr_pred_stim.(cfg.mpcompcor_method).cue_time.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
end

%% ... Plot each channpool separately (CLUSTER_BASED)
cfg.referenceline = [];                     % ver/hor reference lines

folder_to_plot = '/corr_pred_stim/cue_time/';
str_to_loop = exp.corr_pred_stim.(cfg.mpcompcor_method).cue_time;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/corr_pred_stim_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf); 
%% 1.2 INCORRECTLY PREDICTED STIM
%% General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
folder_name          = [result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];    % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

channelpools          = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool

%% ... Compute each channelpool (UNCORRECTED)
% Correction method
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
end

%% ... Ploting (UNCORRECTED)
% cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                     % ver/hor reference lines

% actual ploting
adam_plot_MVPA(cfg, [exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial.ALL ...
                    exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial.FRONTAL ...
                    exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial.OCCIP]);
pause(2)
close(gcf)

%% ... Plot each channpool separately (UNCORRECTED)

folder_to_plot = '/incorr_pred_stim/complete_trial';
str_to_loop = exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/incorr_pred_stim_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf);
%% ... Compute each channelpool (CLUSTER_BASED)
% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
end

%% ... Ploting (CLUSTER_BASED)
cfg.referenceline = -2000;                     % ver/hor reference lines

% actual ploting
adam_plot_MVPA(cfg, [exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial.ALL ...
                    exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial.FRONTAL ...
                    exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial.OCCIP]);
pause(2)
close(gcf)

%% ... Plot each channpool separately (CLUSTER_BASED)

folder_to_plot = '/incorr_pred_stim/complete_trial/';
str_to_loop = exp.incorr_pred_stim.(cfg.mpcompcor_method).complete_trial;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/incorr_pred_stim_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf); 
%% ... Compute GAT for STIM time window
cfg.timelim           = [0 1000]; % constrain train/test time to stim time-window

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.incorr_pred_stim.(cfg.mpcompcor_method).stim_time.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
end

%% ... Plot each channpool separately (CLUSTER_BASED)
cfg.referenceline = [];                     % ver/hor reference lines

folder_to_plot = '/incorr_pred_stim/stim_time/';
str_to_loop = exp.incorr_pred_stim.(cfg.mpcompcor_method).stim_time;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/incorr_pred_stim_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf); 
%% ... Compute GAT for CUE time window
cfg.timelim           = [-1950 -500]; % constrain train/test time to stim time-window

% Correction method
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

for countChann = 1:numel(channelpools);
    currChann  = channelpools{countChann};                          % channel pool
    
    cfg.channelpool = currChann;                    % set channel pool
    exp.incorr_pred_stim.(cfg.mpcompcor_method).cue_time.(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
    
end

%% ... Plot each channpool separately (CLUSTER_BASED)
cfg.referenceline = [];                     % ver/hor reference lines

folder_to_plot = '/incorr_pred_stim/cue_time/';
str_to_loop = exp.incorr_pred_stim.(cfg.mpcompcor_method).cue_time;

for countChann = 1:numel(channelpools);     % counter
    currChann  = channelpools{countChann};  % current channel pool

    adam_plot_MVPA(cfg, str_to_loop.(currChann));                                              % plot
          title([strrep(str_to_loop.(currChann).condname, '_', ' ') ' ' currChann ' channs']); % change title (get rid of underscores)
    
    pause(1); % pause to allow graphic to resize                 
    
    mkdir([plots_folder_path session folder_to_plot]) % create dir if non-existent. if dir exists, it will warn
    
    saveas(gcf, [plots_folder_path session folder_to_plot '/incorr_pred_stim_' currChann '_' cfg.mpcompcor_method '.png']); % save graph
    close(gcf); 
    
    if countChann == size(channelpools, 2); %detele var with struct
        clear str_to_loop
    end
        
end


close(gcf); 