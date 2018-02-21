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
cfg.startdir          = [result_folder_path  'TASKRELEVANCE/CAT_PRED_bal_64hz/'];   % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

%% Uncorrected for mult comp
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    rel_cat_pred.uncorr.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                     % ver/hor reference lines

% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [rel_cat_pred.uncorr.ALL...
                     rel_cat_pred.uncorr.FRONTAL...
                     rel_cat_pred.uncorr.OCCIP]);

%% Plot separately to save as png (Convert to loop)
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_cat_pred.uncorr.(currChann));
    title([strrep(rel_cat_pred.uncorr.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/cat_pred_' currChann '_uncorr.png']);
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
    rel_cat_pred.uncorr.cat_stimtimelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_cat_pred.uncorr.cat_stimtimelim.(currChann));
%   title([strrep(rel_cat_pred.corr.cat_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/cat_stimtimelim/cat_pred_' currChann '_uncorr.png']);
    close(gcf);
    
end

%% Cluster-based correction for mult comp
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    rel_cat_pred.corr.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
cfg.referenceline = -2000;
adam_plot_MVPA(cfg, [rel_cat_pred.corr.ALL...
                     rel_cat_pred.corr.FRONTAL...
                     rel_cat_pred.corr.OCCIP])

%% Plot separately to save as png
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_cat_pred.corr.(currChann));
    title([strrep(rel_cat_pred.corr.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/cat_pred_' currChann '_corr.png']);
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
    rel_cat_pred.corr.cat_timelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_cat_pred.corr.cat_timelim.(currChann));
%   title([strrep(rel_cat_pred.corr.cat_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/cat_timelim/cat_pred_' currChann '_corr.png']);
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
    rel_cat_pred.corr.cat_stimtimelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_cat_pred.corr.cat_stimtimelim.(currChann));
%   title([strrep(rel_cat_pred.corr.cat_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/cat_stimtimelim/cat_pred_' currChann '_corr.png']);
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
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.reduce_dims       = 'avtrain';

cfg.trainlim          = [-1950 -1780];
cfg.channelpool       = 'ALL';
short_train                  = adam_compute_group_MVPA(cfg); % compute stats
adam_plot_MVPA(cfg, short_train);
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/cat_trainlim/cat_pred_-1950to-1780_corr.png']);
    close(gcf);

cfg.trainlim           = [-1950 -1300];
cfg.channelpool        = 'ALL';
large_train                   = adam_compute_group_MVPA(cfg); % compute stats
adam_plot_MVPA(cfg, large_train);
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/cat_trainlim/cat_pred_-1950to-1300_corr.png']);
    close(gcf);

%% 1.2 Cat correct stim
%% General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
cfg.startdir          = [result_folder_path  'TASKRELEVANCE/CATCORR_STIM_bal_64hz/'];    % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

%% Uncorrected for mult comp
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    rel_stim.uncorr.catcorr.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                     % ver/hor reference lines

% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [rel_stim.uncorr.catcorr.ALL ...
                     rel_stim.uncorr.catcorr.FRONTAL...
                     rel_stim.uncorr.catcorr.OCCIP]);

%% Plot separately to save as png (Convert to loop)

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_stim.uncorr.catcorr.(currChann));
    title([strrep(rel_stim.uncorr.catcorr.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/catcorr_stim/catcorr_stim_' currChann '_uncorr.png']);
    close(gcf);
    
end

%% Cluster-based correction for mult comp
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    rel_stim.corr.catcorr.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [rel_stim.corr.catcorr.ALL...
                     rel_stim.corr.catcorr.FRONTAL...
                     rel_stim.corr.catcorr.OCCIP])

%% Plot separately to save as png
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_stim.corr.catcorr.(currChann));
    title([strrep(rel_stim.corr.catcorr.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/catcorr_stim/catcorr_stim_' currChann '_corr.png']);
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
    rel_stim.corr.stim_timelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_stim.corr.stim_timelim.(currChann));
%   title([strrep(rel_cat_pred.corr.cat_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/catcorr_stim_timelim/catcorr_stim_' currChann '_corr.png']);
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
    rel_stim.corr.catcorr_stim_cuetimelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg.referenceline = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_stim.corr.catcorr_stim_cuetimelim.(currChann));
%   title([strrep(rel_cat_pred.corr.cat_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/catcorr_stim_cuetimelim/catcorr_stim_' currChann '_corr.png']);
    close(gcf);
    
end
   

%% 1.2 catincorr stim
%% General settings for compute GAT matrix
cfg                   = [];                                                         % clear the config variable
cfg.startdir          = [result_folder_path  'TASKRELEVANCE/CATINCORR_STIM_bal_64hz/'];    % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

%% Uncorrected for mult comp
cfg.mpcompcor_method  = 'uncorrected';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    rel_stim.uncorr.catincorr.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                     % ver/hor reference lines

% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [rel_stim.uncorr.catincorr.ALL ...
                     rel_stim.uncorr.catincorr.FRONTAL...
                     rel_stim.uncorr.catincorr.OCCIP]);

%% Plot separately to save as png (Convert to loop)

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_stim.uncorr.catcorr.(currChann));
    title([strrep(rel_stim.uncorr.catincorr.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/catincorr_stim/catincorr_stim_' currChann '_uncorr.png']);
    close(gcf);
    
end

%% Cluster-based correction for mult comp
cfg.mpcompcor_method  = 'cluster_based';                                        % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% Compute each channelpool
channelpools = {'ALL', 'FRONTAL', 'OCCIP'};

for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool
    
    cfg.channelpool = currChann;                                    % set channel pool
    rel_stim.corr.catincorr.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Ploting
% all three channelpools togheter (ALL, FRONTAL, OCCIP; in that order)
adam_plot_MVPA(cfg, [rel_stim.corr.catincorr.ALL...
                     rel_stim.corr.catincorr.FRONTAL...
                     rel_stim.corr.catincorr.OCCIP])

%% Plot separately to save as png
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_stim.corr.catincorr.(currChann));
    title([strrep(rel_stim.corr.catincorr.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/catincorr_stim/catincorr_stim_' currChann '_corr.png']);
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
    rel_stim.corr.catincorr_stim_timelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg.referenceline = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_stim.corr.catincorr_stim_timelim.(currChann));
%   title([strrep(rel_cat_pred.corr.cat_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/catincorr_stim_timelim/catincorr_stim_' currChann '_corr.png']);
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
    rel_stim.corr.catincorr_stim_cuetimelim.(currChann) = adam_compute_group_MVPA(cfg); % compute stats
    
end

%% Plot separately to save as png
cfg = [];
for countChann = 1:numel(channelpools);
    currChann = channelpools{countChann};                           % channel pool

    adam_plot_MVPA(cfg, rel_stim.corr.catincorr_stim_cuetimelim.(currChann));
%   title([strrep(rel_cat_pred.corr.cat_timelim.(currChann).condname, '_', ' ') ' ' currChann ' channs']);
    title('');
%     ylabel('')
%     xlabel('')
%     colorbar('off')
    
    pause(1); % pause to allow the graphic to resize                 
    saveas(gcf, [plots_folder_path 'taskrelevance/catincorr_stim_cuetimelim/catincorr_stim_' currChann '_corr.png']);
    close(gcf);
    
end
   