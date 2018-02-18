%% CORRECTED
% TODO: ALL GRAPHS
% All comparisons were ran separately with ALL, OCCIP and FRONTAL channels.
% Plot each comparison (1.1, 1.2, …, 2.4) in a three graph set (ALL, OCCIP and FRONTAL).
% plot reference lines to each graphs (either on stim or cue)
%% path to result folder 

result_folder_path = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/MVPA_RESULTS/'; % dell path

%% 1. EXPECTATION
%% 1.1 cue prediction (unbalanced)
% 1.1.1 COMPUTE THE GAT MATRIX
cfg                   = [];                                                      % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/CUE_PRED_unbal_64hz/']; % path to first level results 
cfg.mpcompcor_method  = 'uncorrected';                                           % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations        = 250;                                                     % reduce the number of iterations to save time
cfg.channelpool       = 'ALL';
mvpa_eeg_stats_exp_cue_pred_unbal_ALL     = adam_compute_group_MVPA(cfg);        % select "ALL" folder
cfg.channelpool       = 'FRONTAL';
mvpa_eeg_stats_exp_cue_pred_unbal_FRONTAL = adam_compute_group_MVPA(cfg);        % select "FRONTAL" folder
cfg.channelpool       = 'OCCIP';
mvpa_eeg_stats_exp_cue_pred_unbal_OCCIP   = adam_compute_group_MVPA(cfg);        % select "OCCIP" folder

% 1.1.2 PLOT THE GAT MATRIX
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_cue_pred_unbal_ALL);     % "ALL"
title([strrep(mvpa_eeg_stats_exp_cue_pred_unbal_ALL.condname, '_', ' ') ' ALL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_cue_pred_unbal_FRONTAL); % "FRONTAL"
title([strrep(mvpa_eeg_stats_exp_cue_pred_unbal_FRONTAL.condname, '_', ' ') ' FRONTAL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_cue_pred_unbal_OCCIP);   % "OCCIP"
title([strrep(mvpa_eeg_stats_exp_cue_pred_unbal_OCCIP.condname, '_', ' ') ' OCCIP']);

%% 1.2 cue prediction
% 1.2.1 COMPUTE THE GAT MATRIX
cfg                   = [];                                                      % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz/']; % path to first level results 
cfg.mpcompcor_method  = 'uncorrected';                                           % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations        = 250;                                                     % reduce the number of iterations to save time
cfg.channelpool       = 'ALL';
mvpa_eeg_stats_exp_cue_pred_ALL     = adam_compute_group_MVPA(cfg);        % select "ALL" folder
cfg.channelpool       = 'FRONTAL';
mvpa_eeg_stats_exp_cue_pred_FRONTAL = adam_compute_group_MVPA(cfg);        % select "FRONTAL" folder
cfg.channelpool       = 'OCCIP';
mvpa_eeg_stats_exp_cue_pred_OCCIP   = adam_compute_group_MVPA(cfg);        % select "OCCIP" folder

% 1.2.2 PLOT THE GAT MATRIX
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_cue_pred_ALL);     % "ALL"
title([strrep(mvpa_eeg_stats_exp_cue_pred_ALL.condname, '_', ' ') ' ALL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_cue_pred_FRONTAL); % "FRONTAL"
title([strrep(mvpa_eeg_stats_exp_cue_pred_FRONTAL.condname, '_', ' ') ' FRONTAL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_cue_pred_OCCIP);   % "OCCIP"
title([strrep(mvpa_eeg_stats_exp_cue_pred_OCCIP.condname, '_', ' ') ' OCCIP']);
%% 1.3 predicted stim
% 1.3.1 COMPUTE THE GAT MATRIX
cfg                   = [];                                                      % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz']; % path to first level results 
cfg.mpcompcor_method  = 'uncorrected';                                           % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations        = 250;                                                     % reduce the number of iterations to save time
cfg.channelpool       = 'ALL';
mvpa_eeg_stats_exp_pred_stim_ALL     = adam_compute_group_MVPA(cfg);        % select "ALL" folder
cfg.channelpool       = 'FRONTAL';
mvpa_eeg_stats_exp_pred_stim_FRONTAL = adam_compute_group_MVPA(cfg);        % select "FRONTAL" folder
cfg.channelpool       = 'OCCIP';
mvpa_eeg_stats_exp_pred_stim_OCCIP   = adam_compute_group_MVPA(cfg);        % select "OCCIP" folder

% 1.3.2 PLOT THE GAT MATRIX
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                       % ver/hor reference lines

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_pred_stim_ALL);     % "ALL"
title([strrep(mvpa_eeg_stats_exp_pred_stim_ALL.condname, '_', ' ') ' ALL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_pred_stim_FRONTAL); % "FRONTAL"
title([strrep(mvpa_eeg_stats_exp_pred_stim_FRONTAL.condname, '_', ' ') ' FRONTAL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_pred_stim_OCCIP);   % "OCCIP"
title([strrep(mvpa_eeg_stats_exp_pred_stim_OCCIP.condname, '_', ' ') ' OCCIP']);

%% 1.4 unpredicted stim
% 1.4.1 COMPUTE THE GAT MATRIX
cfg                   = [];                                                      % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz']; % path to first level results 
cfg.mpcompcor_method  = 'uncorrected';                                           % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations        = 250;                                                     % reduce the number of iterations to save time
cfg.channelpool       = 'ALL';
mvpa_eeg_stats_exp_unpred_stim_ALL     = adam_compute_group_MVPA(cfg);        % select "ALL" folder
cfg.channelpool       = 'FRONTAL';
mvpa_eeg_stats_exp_unpred_stim_FRONTAL = adam_compute_group_MVPA(cfg);        % select "FRONTAL" folder
cfg.channelpool       = 'OCCIP';
mvpa_eeg_stats_exp_unpred_stim_OCCIP   = adam_compute_group_MVPA(cfg);        % select "OCCIP" folder

% 1.3.2 PLOT THE GAT MATRIX
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                       % ver/hor reference lines

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_unpred_stim_ALL);     % "ALL"
title([strrep(mvpa_eeg_stats_exp_unpred_stim_ALL.condname, '_', ' ') ' ALL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_unpred_stim_FRONTAL); % "FRONTAL"
title([strrep(mvpa_eeg_stats_exp_pred_unstim_FRONTAL.condname, '_', ' ') ' FRONTAL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_exp_pred_stim_OCCIP);   % "OCCIP"
title([strrep(mvpa_eeg_stats_exp_pred_stim_OCCIP.condname, '_', ' ') ' OCCIP']);

%% 2. TASK RELEVANCE
%% 2.1 cat prediction (unbalanced)
% 2.1.1 COMPUTE THE GAT MATRIX
cfg                   = [];                                                      % clear the config variable
cfg.startdir          = [result_folder_path  'TASKRELEVANCE/CAT_PRED_unbal_64hz']; % path to first level results 
cfg.mpcompcor_method  = 'uncorrected';                                           % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations        = 250;                                                     % reduce the number of iterations to save time
cfg.channelpool       = 'ALL';
mvpa_eeg_stats_rel_cat_pred_unbal_ALL     = adam_compute_group_MVPA(cfg);        % select "ALL" folder
cfg.channelpool       = 'FRONTAL';
mvpa_eeg_stats_rel_cat_pred_unbal_FRONTAL = adam_compute_group_MVPA(cfg);        % select "FRONTAL" folder
cfg.channelpool       = 'OCCIP';
mvpa_eeg_stats_rel_cat_pred_unbal_OCCIP   = adam_compute_group_MVPA(cfg);        % select "OCCIP" folder

% 2.1.2 PLOT THE GAT MATRIX
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_cat_pred_unbal_ALL);     % "ALL"
title([strrep(mvpa_eeg_stats_rel_cat_pred_unbal_ALL.condname, '_', ' ') ' ALL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_cat_pred_unbal_FRONTAL); % "FRONTAL"
title([strrep(mvpa_eeg_stats_rel_cat_pred_unbal_FRONTAL.condname, '_', ' ') ' FRONTAL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_cat_pred_unbal_OCCIP);   % "OCCIP"
title([strrep(mvpa_eeg_stats_rel_cat_pred_unbal_OCCIP.condname, '_', ' ') ' OCCIP']);

%% 2.2. category prediction
% 2.2.1 COMPUTE THE GAT MATRIX
cfg                   = [];                                                      % clear the config variable
cfg.startdir          = [result_folder_path  'TASKRELEVANCE/CAT_PRED_bal_64hz']; % path to first level results 
cfg.mpcompcor_method  = 'uncorrected';                                           % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations        = 250;                                                     % reduce the number of iterations to save time
cfg.channelpool       = 'ALL';
mvpa_eeg_stats_rel_cat_pred_ALL     = adam_compute_group_MVPA(cfg);        % select "ALL" folder
cfg.channelpool       = 'FRONTAL';
mvpa_eeg_stats_rel_cat_pred_FRONTAL = adam_compute_group_MVPA(cfg);        % select "FRONTAL" folder
cfg.channelpool       = 'OCCIP';
mvpa_eeg_stats_rel_cat_pred_OCCIP   = adam_compute_group_MVPA(cfg);        % select "OCCIP" folder

% 2.3.2 PLOT THE GAT MATRIX
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_cat_pred_ALL);     % "ALL"
title([strrep(mvpa_eeg_stats_rel_cat_pred_ALL.condname, '_', ' ') ' ALL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_cat_pred_FRONTAL); % "FRONTAL"
title([strrep(mvpa_eeg_stats_rel_cat_pred_FRONTAL.condname, '_', ' ') ' FRONTAL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_cat_pred_OCCIP);   % "OCCIP"
title([strrep(mvpa_eeg_stats_rel_cat_pred_OCCIP.condname, '_', ' ') ' OCCIP']);

%% 2.3. category correct stim
% 2.3.1 COMPUTE THE GAT MATRIX
cfg                   = [];                                                      % clear the config variable
cfg.startdir          = [result_folder_path  'TASKRELEVANCE/CATCORR_STIM_bal_64hz']; % path to first level results 
cfg.mpcompcor_method  = 'uncorrected';                                           % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations        = 250;                                                     % reduce the number of iterations to save time
cfg.channelpool       = 'ALL';
mvpa_eeg_stats_rel_catcorr_stim_ALL     = adam_compute_group_MVPA(cfg);        % select "ALL" folder
cfg.channelpool       = 'FRONTAL';
mvpa_eeg_stats_rel_catcorr_stim_FRONTAL = adam_compute_group_MVPA(cfg);        % select "FRONTAL" folder
cfg.channelpool       = 'OCCIP';
mvpa_eeg_stats_rel_catcorr_stim_OCCIP   = adam_compute_group_MVPA(cfg);        % select "OCCIP" folder

% 2.3.2 PLOT THE GAT MATRIX
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_catcorr_stim_ALL);     % "ALL"
title([strrep(mvpa_eeg_stats_rel_catcorr_stim_ALL.condname, '_', ' ') ' ALL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_catcorr_stim_FRONTAL); % "FRONTAL"
title([strrep(mvpa_eeg_stats_rel_catcorr_stim_FRONTAL.condname, '_', ' ') ' FRONTAL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_catcorr_stim_OCCIP);   % "OCCIP"
title([strrep(mvpa_eeg_stats_rel_catcorr_stim_OCCIP.condname, '_', ' ') ' OCCIP']);

%% 2.4. category incorrect stim 
% 2.4.1 COMPUTE THE GAT MATRIX
cfg                   = [];                                                      % clear the config variable
cfg.startdir          = [result_folder_path  'TASKRELEVANCE/CATINCORR_STIM_bal_64hz']; % path to first level results 
cfg.mpcompcor_method  = 'uncorrected';                                           % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations        = 250;                                                     % reduce the number of iterations to save time
cfg.channelpool       = 'ALL';
mvpa_eeg_stats_rel_catincorr_stim_ALL     = adam_compute_group_MVPA(cfg);        % select "ALL" folder
cfg.channelpool       = 'FRONTAL';
mvpa_eeg_stats_rel_catincorr_stim_FRONTAL = adam_compute_group_MVPA(cfg);        % select "FRONTAL" folder
cfg.channelpool       = 'OCCIP';
mvpa_eeg_stats_rel_catincorr_stim_OCCIP   = adam_compute_group_MVPA(cfg);        % select "OCCIP" folder

% 2.4.2 PLOT THE GAT MATRIX
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_catincorr_stim_ALL);     % "ALL"
title([strrep(mvpa_eeg_stats_rel_catincorr_stim_ALL.condname, '_', ' ') ' ALL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_catincorr_stim_FRONTAL); % "FRONTAL"
title([strrep(mvpa_eeg_stats_rel_catincorr_stim_FRONTAL.condname, '_', ' ') ' FRONTAL']);

adam_plot_MVPA(cfg, mvpa_eeg_stats_rel_catincorr_stim_OCCIP);   % "OCCIP"
title([strrep(mvpa_eeg_stats_rel_catincorr_stim_OCCIP.condname, '_', ' ') ' OCCIP']);
