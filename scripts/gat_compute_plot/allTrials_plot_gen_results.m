%% GAT matrices computation and ploting
% GAT matrices computation and ploting to elaborate general results
% presentation.
% EVERY parameter defined in the cfg structure is going to feed the ADAM
% toolbox directly. EVERY parameter defined in cfg_darks structure is going
% to feed my wrapping function.

% % % TODO
% Use diagonal plots for weird things (e.g. below chance decoding, near
% above chance, ... etc.)

%% CLEAN THE PLACE! 
clear;
clc;

%% Paths setting (these are not changed)
main_path = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/';

cfg_darks.result_folder_path = [main_path 'RESULTS/MVPA_RESULTS/'];       % dell15R path
cfg_darks.plots_folder_path  = [main_path 'RESULTS/plots_gen_results/'];  % dell15R path

%% Limits of ALL GAT matrix plot
minLim_gat3d = .30;
maxLim_gat3d = .70;

minLim_gat2d = .49;
maxLim_gat2d = .60;

%% Fields of cfg_darks that have to be reset on every analysis
fields_to_remove = {'folder_name', 'channelpools', 'frst_level_analysis', 'trialtime', 'folder_to_plot', ...
                    'special_anal', 'balancing', 'trial_time_label'};

%% Particular analysis dealt with here
anal = 'allTrials';

%% 1. Expectation
% Session dealt with (expectation or taskrelevance)
cfg_darks.session = 'expectation';
%% 1.1 CUE PREDICTION

%% ... GS: ALL TRIALS, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_64hz_allTrials'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%
cfg_darks.special_anal        = anal;
cfg_darks.balancing           = 'balanced';
%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(anal).(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);

%% ... GS: ALL TRIALS, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_64hz_allTrials'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%
cfg_darks.special_anal        = anal;
cfg_darks.balancing           = 'balanced';

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(anal).(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);

%% ... GS: ALL TRIALS, cue window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_64hz_allTrials'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%
cfg_darks.special_anal        = anal;
cfg_darks.balancing           = 'balanced';

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(anal).(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);

%% 2. Task relevance
%% Session dealt with (expectation or taskrelevance)
cfg_darks.session = 'taskRelevance';

%% 1.1 CUE CATEGORY

%% ... GS: ALL TRIALS, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CUE_CAT_64hz_allTrials'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%
cfg_darks.special_anal        = anal;
cfg_darks.balancing           = 'balanced';

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

rel.(anal).(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);

%% ... GS: ALL TRIALS, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CUE_CAT_64hz_allTrials'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%
cfg_darks.special_anal        = anal;
cfg_darks.balancing           = 'balanced';

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

rel.(anal).(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);

%% ... GS: ALL TRIALS, cue window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CUE_CAT_64hz_allTrials'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%
cfg_darks.special_anal        = anal;
cfg_darks.balancing           = 'balanced';

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

rel.(anal).(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);