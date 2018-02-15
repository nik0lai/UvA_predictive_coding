%% CORRECTED
% Better to reorder result folders in one folder?

% TODO: ALL GRAPHS
% separate graphs; plot reference lines to each graphs (either on stim or cue)
%% path to result folder 
result_folder_path = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/MVPA_RESULTS/';

%% EXPECTATION
%% COMPUTE THE GAT MATRIX EXPECTATION
cfg                  = [];                                                           % clear the config variable
cfg.startdir         = [result_folder_path  'MVPA_RESULTS_EXP'];  % path to first level results 
cfg.mpcompcor_method = 'cluster_based';                                              % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations       = 250;                                                          % reduce the number of iterations to save time
mvpa_eeg_stats_exp   = adam_compute_group_MVPA(cfg);                                 % select RAW_EEG when dialog pops up

%% PLOT THE GAT MATRIX EXPECTATION
%% CUE prediction
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines
cfg.plot_order    = {'PRED_CUE'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_exp]);  % actual plotting, combine EEG/MEG results
%% non-predicted stimuli
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                       % ver/hor reference lines
cfg.plot_order    = {'NONPRED_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_exp]);  % actual plotting, combine EEG/MEG results
%% predicted stimuli
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                       % ver/hor reference lines
cfg.plot_order    = {'PRED_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_exp]);  % actual plotting, combine EEG/MEG results

%% UNCORRECTED expected comparisons
%% COMPUTE THE GAT MATRIX EXPECTATION
cfg = [];                                    % clear the config variable
cfg.startdir         = [result_folder_path  'MVPA_RESULTS_EXP'];  % path to first level results 
cfg.mpcompcor_method = 'uncorrected';      % multiple comparison correction method
cfg.iterations       = 250;                        % reduce the number of iterations to save time
mvpa_eeg_stats_exp_UNCORRECTED = adam_compute_group_MVPA(cfg);  % select RAW_EEG when dialog pops up

%% PLOT THE GAT MATRIX EXPECTATION
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines
cfg.plot_order    = {'PRED_CUE'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_exp_UNCORRECTED]);  % actual plotting, combine EEG/MEG results
%% PLOT THE GAT MATRIX EXPECTATION
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                   % ver/hor reference lines
cfg.plot_order    = {'NONPRED_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_exp_UNCORRECTED]);  % actual plotting, combine EEG/MEG results
%% PLOT THE GAT MATRIX EXPECTATION
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                   % ver/hor reference lines
cfg.plot_order    = {'PRED_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_exp_UNCORRECTED]);  % actual plotting, combine EEG/MEG results

%% TASK RELEVANCE
%% COMPUTE THE GAT MATRIX TASK RELEVANCE
cfg                  = [];                                                           % clear the config variable
cfg.startdir         = [result_folder_path '/MVPA_RESULTS_REL'];  % path to first level results 
cfg.mpcompcor_method = 'cluster_based';                                              % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations       = 250;                                                          % reduce the number of iterations to save time
mvpa_eeg_stats_rel   = adam_compute_group_MVPA(cfg);                                 % select RAW_EEG when dialog pops up

%% PLOT THE GAT MATRIX TASK RELEVANCE
%% CUE prediction
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines
cfg.plot_order    = {'PRED_CUE'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_rel]);  % actual plotting, combine EEG/MEG results
%% non-predicted stimuli
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                       % ver/hor reference lines
cfg.plot_order    = {'CATINCORR_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_rel]);  % actual plotting, combine EEG/MEG results
%% predicted stimuli
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                       % ver/hor reference lines
cfg.plot_order    = {'CATCORR_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_rel]);   % actual plotting, combine EEG/MEG results

%% UNCORRECTED TASK RELEVANCE comparisons
%% COMPUTE THE GAT MATRIX TASK RELEVANCE
cfg                  = [];                                          % clear the config variable
cfg.startdir         = [result_folder_path '/MVPA_RESULTS_REL'];  % path to first level results 
cfg.mpcompcor_method = 'fdr';                                       % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.iterations       = 250;                                         % reduce the number of iterations to save time
mvpa_eeg_stats_rel_UNCORRECTED   = adam_compute_group_MVPA(cfg);    % select RAW_EEG when dialog pops up

%% PLOT THE GAT MATRIX TASK RELEVANCE
%% CUE prediction
cfg = [];                                    % clear the config variable
cfg.referenceline = -2000;                   % ver/hor reference lines
cfg.plot_order    = {'PRED_CUE'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_rel_UNCORRECTED]);  % actual plotting, combine EEG/MEG results
%% non-predicted stimuli
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                       % ver/hor reference lines
cfg.plot_order    = {'CATINCORR_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_rel_UNCORRECTED]);  % actual plotting, combine EEG/MEG results
%% predicted stimuli
cfg = [];                                    % clear the config variable
cfg.referenceline = 0;                       % ver/hor reference lines
cfg.plot_order    = {'CATCORR_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_rel_UNCORRECTED]);  % actual plotting, combine EEG/MEG results

