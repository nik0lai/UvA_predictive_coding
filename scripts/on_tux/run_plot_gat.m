%% CORRECTED
% Better to reorder result folders in one folder?

% TODO: ALL GRAPHS
% separate graphs; plot reference lines to each graphs (either on stim or cue)

%% COMPUTE THE GAT MATRIX OF ALL EEG AND MEG COMPARISONS
cfg = [];                                    % clear the config variable
cfg.startdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/';  % path to first level results 
cfg.mpcompcor_method = 'cluster_based';      % multiple comparison correction method
cfg.iterations = 250;                        % reduce the number of iterations to save time
mvpa_eeg_stats_exp = adam_compute_group_MVPA(cfg);  % select RAW_EEG when dialog pops up

%% PLOT THE GAT MATRIX OF ALL EEG AND MEG COMPARISONs
cfg = [];                                    % clear the config variable
cfg.plot_order = {'PRED_CUE' 'NONPRED_STIM' 'PRED_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_exp]);  % actual plotting, combine EEG/MEG results


%% UNCORRECTED

%% COMPUTE THE GAT MATRIX OF ALL EEG AND MEG COMPARISONS
cfg = [];                                    % clear the config variable
cfg.startdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/';  % path to first level results 
cfg.mpcompcor_method = 'uncorrected';      % multiple comparison correction method
cfg.iterations = 250;                        % reduce the number of iterations to save time
mvpa_eeg_stats_UNCORRECTED = adam_compute_group_MVPA(cfg);  % select RAW_EEG when dialog pops up

%% PLOT THE GAT MATRIX OF ALL EEG AND MEG COMPARISONs
cfg = [];                                    % clear the config variable
cfg.plot_order = {'PRED_CUE' 'NONPRED_STIM' 'PRED_STIM'};
cfg.referenceline = -2000;
adam_plot_MVPA(cfg, [mvpa_eeg_stats_UNCORRECTED]);  % actual plotting, combine EEG/MEG results

%%
%% COMPUTE THE GAT MATRIX OF ALL EEG AND MEG COMPARISONS
cfg = [];                                    % clear the config variable
cfg.startdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_REL';  % path to first level results 
cfg.mpcompcor_method = 'cluster_based';      % multiple comparison correction method
cfg.iterations = 250;                        % reduce the number of iterations to save time
mvpa_eeg_stats_rel = adam_compute_group_MVPA(cfg);  % select RAW_EEG when dialog pops up

%% PLOT THE GAT MATRIX OF ALL EEG AND MEG COMPARISONs
cfg = [];                                    % clear the config variable
cfg.plot_order = {'PRED_CUE' 'NONPRED_STIM' 'PRED_STIM'};
adam_plot_MVPA(cfg, [mvpa_eeg_stats_rel]);  % actual plotting, combine EEG/MEG results


