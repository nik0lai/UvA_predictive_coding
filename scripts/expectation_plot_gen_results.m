%% GAT matrices computation and ploting
% GAT matrices computation and ploting to elaborate general results
% presentation.

% Outline:
% 1. Expectation session
% 1.1 Cue prediction


%% Paths setting
result_folder_path = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/MVPA_RESULTS/'; % dell15R path
plots_folder_path  = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/plots_gen_results/';        % dell15R path

%% 1. Expectation
%% 1.1 Cue prediction

%% General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz/'];   % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

%% Uncorrected for mult comp
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_cue_pred.uncorr.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                     % ver/hor reference lines

% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [...
                     ...
                     ]);

%% Plot separately to save as png (Convert to loop)
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_cue_pred.uncorr.(currChann));
    title([strrep(exp_cue_pred.uncorr.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/cue_pred_' currChann '_uncorr.png']);
    close(gcf);
    
end

%% Compute GAT for STIM time window

cfg.timelim           = [0 1000];
cfg.mpcompcor_method  = 'uncorrected';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_cue_pred.uncorr.cue_stimtimelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_cue_pred.uncorr.cue_stimtimelim.(currChann));
%   title([strrep(exp_cue_pred.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/cue_stimtimelim/cue_pred_' currChann '_uncorr.png']);
    close(gcf);
    
end

%% Cluster-based correction for mult comp
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_cue_pred.corr.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [...
                     ...
                     ])

%% Plot separately to save as png
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_cue_pred.corr.(currChann));
    title([strrep(exp_cue_pred.corr.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/cue_pred_' currChann '_corr.png']);
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
    exp_cue_pred.corr.cue_timelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_cue_pred.corr.cue_timelim.(currChann));
%   title([strrep(exp_cue_pred.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/cue_timelim/cue_pred_' currChann '_corr.png']);
    close(gcf);
    
end
cfg.referenceline = -1300;

%% Compute GAT for STIM time window

cfg.timelim           = [0 1000];
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    exp_cue_pred.corr.cue_stimtimelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_cue_pred.corr.cue_stimtimelim.(currChann));
%   title([strrep(exp_cue_pred.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/cue_stimtimelim/cue_pred_' currChann '_corr.png']);
    close(gcf);
    
end

%% Train on constrained time windows
%  using this two different time-window to train the classifier show the
%  difference in what can be decoded by the classifier. The first 170 ms
%  are capable to decode the activity sustained for ~750 ms after the cue
%  is presented. Also, when the training window is extended to 650 ms the
%  classifier is capable to decode up until the presentation of the target
%  item.
cfg.timelim       = [];
cfg.referenceline = [];
cfg.reduce_dims       = 'avtrain';

cfg.trainlim          = [-1950 -1780];
cfg.channelpool       = 'ALL';
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
    exp_stim.uncorr.predicted.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                     % ver/hor reference lines

% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [exp_stim.uncorr.predicted.ALL ...
                     exp_stim.uncorr.predicted.FRONTAL...
                     exp_stim.uncorr.predicted.OCCIP]);

%% Plot separately to save as png (Convert to loop)

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.uncorr.predicted.(currChann));
    title([strrep(exp_stim.uncorr.predicted.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
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
%   title([strrep(exp_cue_pred.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
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
%   title([strrep(exp_cue_pred.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
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
    exp_stim.uncorr.unpredicted.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                     % ver/hor reference lines

% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [exp_stim.uncorr.unpredicted.ALL ...
                     exp_stim.uncorr.unpredicted.FRONTAL...
                     exp_stim.uncorr.unpredicted.OCCIP]);

%% Plot separately to save as png (Convert to loop)

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, exp_stim.uncorr.unpredicted.(currChann));
    title([strrep(exp_stim.uncorr.unpredicted.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
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
%   title([strrep(exp_cue_pred.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
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
%   title([strrep(exp_cue_pred.corr.cue_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'expectation/unpred_stim_cuetimelim/unpred_stim_' currChann '_corr.png']);
    close(gcf);
    
end
   