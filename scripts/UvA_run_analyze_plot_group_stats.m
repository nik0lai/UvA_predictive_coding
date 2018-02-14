%% 
% Better to reorder result folders in one folder?

%% COMPUTE THE GAT MATRIX OF ALL EEG AND MEG COMPARISONS
cfg = [];                                    % clear the config variable
cfg.startdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/';  % path to first level results 
cfg.mpcompcor_method = 'cluster_based';      % multiple comparison correction method
cfg.iterations = 250;                        % reduce the number of iterations to save time
mvpa_eeg_stats = adam_compute_group_MVPA(cfg);  % select RAW_EEG when dialog pops up

%% PLOT THE GAT MATRIX OF ALL EEG AND MEG COMPARISONs
cfg = [];                                    % clear the config variable
cfg.plot_order = {'EEG_FAM_VS_SCRAMBLED' 'EEG_NONFAM_VS_SCRAMBLED' 'EEG_FAM_VS_NONFAMOUS' ... % 
                  'MEG_FAM_VS_SCRAMBLED' 'MEG_NONFAM_VS_SCRAMBLED' 'MEG_FAM_VS_NONFAMOUS' }; 
adam_plot_MVPA(cfg, [mvpa_eeg_stats]);  % actual plotting, combine EEG/MEG results




%% Cue in EXPECTATION
%% COMPUTE RAW GROUP ERPs
cfg = [];                                    % clear the config variable
cfg.startdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/PRED_CUE'; % path to first level results 
cfg.mpcompcor_method = 'cluster_based';      % multiple comparison correction method
cfg.electrode_def = {'P10'};                 % electrode to plot
erp_stats = adam_compute_group_ERP(cfg);     % select EEG_NONFAM_VS_SCRAMBLED when dialog pops up

%% COMPUTE THE DIFFERENCE BETWEEN THE ERPs FROM THE  FIRST LEVEL ANALYSIS
cfg = [];                                    % clear the config variable
cfg.startdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/PRED_CUE'; % path to first level results 
cfg.mpcompcor_method = 'cluster_based';      % multiple comparison correction method
cfg.electrode_def = {'P10'};                 % electrode to plot
cfg.condition_method = 'subtract';           % compute subtraction of ERP 
erp_stats_dif = adam_compute_group_ERP(cfg); % select EEG_NONFAM_VS_SCRAMBLED when dialog pops up

%% PLOT THE ERPs AND THEIR DIFFERENCE IN A SINGLE PLOT
cfg = [];                                    % clear the config variable
cfg.singleplot = true;                       % all graphs in a single plot
cfg.line_colors = {[0 0 0] [.5 .5 .5] [0 .5 0]}; % change the colors
adam_plot_MVPA(cfg, [erp_stats erp_stats_dif]);  % actual plotting

%%%%