%% GAT matrices computation and ploting
% GAT matrices computation and ploting to elaborate general results
% presentation.
% EVERY parameter defined in the cfg structure is going to feed the ADAM
% toolbox directly. EVERY parameter defined in cfg_darks structure is going
% to feed my wrapping functions.

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
%% limits of every GAT matrix plot
minLim_gat = .30;
maxLim_gat = .70;

%% 1. Expectation
%% 1.1 CUE PREDICTION

%% ... GS: Unbalanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];


%% ... C&P
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.cue_prediction.unbalanced.uncorrected.compTrial = tmp.cue_prediction.unbalanced.uncorrected.compTrial;

%% ... GS: Unbalanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];


%% ... C&P
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.cue_prediction.unbalanced.cluster_based.compTrial = tmp.cue_prediction.unbalanced.cluster_based.compTrial;

%% ... GS: Balanced, complete trial, uncorrected

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%% ... C&P
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.cue_prediction.balanced.uncorrected.compTrial = tmp.cue_prediction.balanced.uncorrected.compTrial;
%% ... GS: Balanced, complete trial, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.cue_prediction.balanced.cluster_based.compTrial = tmp.cue_prediction.balanced.cluster_based.compTrial;
%% ... GS: Balanced, stim window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/stim_time'];

%% ... C&P
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.cue_prediction.balanced.cluster_based.timelim.stim_time = tmp.cue_prediction.balanced.cluster_based.timelim;
%% ... GS: Balanced, cue window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_prediction';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/cue_time'];

%% ... C&P
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.cue_prediction.balanced.cluster_based.timelim.cue_time = tmp.cue_prediction.balanced.cluster_based.timelim;

%%
% %% ... Train on constrained time windows (convert to loop so it can be feed with many time-windows
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
%% ... GS: Balanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'corr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = [];
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.corr_predicted_stim.balanced.uncorrected.compTrial = tmp.corr_predicted_stim.balanced.uncorrected.compTrial;

%% ... GS: Balanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'corr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = [];
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.corr_predicted_stim.balanced.cluster_based.compTrial = tmp.corr_predicted_stim.balanced.cluster_based.compTrial;

%% ... GS: Balanced, stim window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'corr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = [];
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.corr_predicted_stim.balanced.cluster_based.timelim.stim_time = tmp.corr_predicted_stim.balanced.cluster_based.timelim;

%% ... GS: Balanced, cue window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/PRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'corr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = [];
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.corr_predicted_stim.balanced.cluster_based.timelim.cue_time = tmp.corr_predicted_stim.balanced.cluster_based.timelim;

%% 1.2 INCORRECTLY PREDICTED STIM
%% ... GS: Balanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'incorr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = [];
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.incorr_predicted_stim.balanced.uncorrected.compTrial = tmp.incorr_predicted_stim.balanced.uncorrected.compTrial;

%% ... GS: Balanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'incorr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = [];
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.incorr_predicted_stim.balanced.cluster_based.compTrial = tmp.incorr_predicted_stim.balanced.cluster_based.compTrial;

%% ... GS: Balanced, stim window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'incorr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = [];
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.incorr_predicted_stim.balanced.cluster_based.timelim.stim_time = tmp.incorr_predicted_stim.balanced.cluster_based.timelim;

%% ... GS: Balanced, cue window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'EXPECTATION/UNPRED_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'incorr_predicted_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
tmp = [];
tmp = compute_plot_GAT(cfg, cfg_darks);

exp.incorr_predicted_stim.balanced.cluster_based.timelim.cue_time = tmp.incorr_predicted_stim.balanced.cluster_based.timelim;