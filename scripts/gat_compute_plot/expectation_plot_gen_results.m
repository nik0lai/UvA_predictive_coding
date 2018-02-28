%% GAT matrices computation and ploting
% GAT matrices computation and ploting to elaborate general results
% presentation.
% EVERY parameter defined in the cfg structure is going to feed the ADAM
% toolbox directly. EVERY parameter defined in cfg_darks structure is going
% to feed my wrapping function.

% % % TODO
% Use diagonal plots for weird things (e.g. below chance decoding, near
% above chance, ... etc.)


% cue_prediction
    % balanced
        % uncorrected
            % complete trial
        % cluster_based
            % complete trial
            % stim window
            % cue window
    % unbalanced
        % uncorrected
            % complete trial
        % cluster_based
            % complete trial
        
% corr_pred_stim
% incorr_pred_stim

%% CLEAN THE PLACE! 
clear;
clc;

%% Paths setting (these are not changed)
main_path = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/';

cfg_darks.result_folder_path = [main_path 'RESULTS/MVPA_RESULTS/'];       % dell15R path
cfg_darks.plots_folder_path  = [main_path 'RESULTS/plots_gen_results/'];  % dell15R path

%% Session dealt with (expectation or taskrelevance)
cfg_darks.session = 'expectation';

%% Limits of ALL GAT matrix plot
minLim_gat3d = .30;
maxLim_gat3d = .70;

minLim_gat2d = .49;
maxLim_gat2d = .60;

%% Fields of cfg_darks that have to be reset on every analysis
fields_to_remove = {'folder_name', 'channelpools', 'frst_level_analysis', 'trialtime', 'folder_to_plot', ...
                    'special_anal', 'balancing', 'trial_time_label'};

%% 1. Expectation
%% 1.1 CUE PREDICTION

%% ... GS: Unbalanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);
%% ... GS: Unbalanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];


%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);
%% ... GS: Unbalanced, stim window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.trialtime           = 'stim_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%% ... GS: Unbalanced, cue window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%% ... GS: Balanced, complete trial, uncorrected

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);
%% ... GS: Balanced, complete trial, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);
%% ... GS: Balanced, stim window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.trialtime           = 'stim_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%% ... GS: Balanced, cue window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%%
% %% ... Train on constrained time windows (convert to loop so it can be feed with many time-windows
%  using this two different time-window to train the classifier show the
%  difference in what can be decoded by the classifier. The first 170 ms
%  are capable to decode the activity sustained for ~750 ms after the cue
%  is presented. Also, when the training window is extended to 650 ms the
%  classifier is capable to decode up until the presentation of the target
%  item.

%% ... GS: Balanced, cue window, cluster_based (CUE TRAINING)

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim2D            = [minLim_gat2d maxLim_gat2d];
%
cfg.trainlim             = [-1950 -1780];
cfg.reduce_dims = 'avtrain';

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.trialtime           = 'cue_shortTrain';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%% ... GS: Balanced, cue window, cluster_based (CUE TRAINING)

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim2D            = [minLim_gat2d maxLim_gat2d];
%
cfg.trainlim             = [-1950 -1300];
cfg.reduce_dims = 'avtrain';

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.trialtime           = 'cue_longTrain';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);

%% 1.2 CORRECTLY PREDICTED STIM
%% ... GS: Balanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'corr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);
%% ... GS: Balanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'corr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);
%% ... GS: Balanced, stim window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'corr_predicted_stim';
cfg_darks.trialtime           = 'stim_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%% ... GS: Balanced, cue window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'corr_predicted_stim';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%% 1.2 INCORRECTLY PREDICTED STIM
%% ... GS: Balanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'incorr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);
%% ... GS: Balanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'incorr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label);
%% ... GS: Balanced, stim window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'incorr_predicted_stim';
cfg_darks.trialtime           = 'stim_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%% ... GS: Balanced, cue window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat3d maxLim_gat3d];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks = remove_fields(cfg_darks, fields_to_remove);
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'incorr_predicted_stim';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
[tmp, cfg_darks] = compute_plot_GAT(cfg, cfg_darks);

exp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime) = ...
tmp.(cfg_darks.frst_level_analysis).(cfg_darks.balancing).(cfg.mpcompcor_method).(cfg_darks.trial_time_label).(cfg_darks.trialtime);
%% 4. Save GAT computed
save('/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/plots_gen_results/expectation/expectation_GAT.mat', 'exp')
