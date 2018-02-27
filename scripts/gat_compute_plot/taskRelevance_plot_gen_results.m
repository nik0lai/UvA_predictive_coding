%% GAT matrices computation and ploting
% GAT matrices computation and ploting to elaborate general results
% presentation.
% EVERY parameter defined in the cfg structure is going to feed the ADAM
% toolbox directly. EVERY parameter defined in cfg_darks structure is going
% to feed my wrapping function.

% % % TODO
% Use diagonal plots for weird things (e.g. below chance decoding, near
% above chance, ... etc.)


% cue_category
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

%% Session dealt with (taskRelevance or taskrelevance)
cfg_darks.session = 'taskRelevance';

%% Limits of ALL GAT matrix plot
minLim_gat = .30;
maxLim_gat = .70;

%% 1. Expectation
%% 1.1 CUE CATEGORY

%% ... GS: Unbalanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CAT_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];


%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cue_category.unbalanced.uncorrected.compTrial = tmp.cue_category.unbalanced.uncorrected.compTrial;

%% ... GS: Unbalanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CAT_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];


%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cue_category.unbalanced.cluster_based.compTrial = tmp.cue_category.unbalanced.cluster_based.compTrial;

%% ... GS: Unbalanced, stim window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CAT_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.trialtime           = 'stim_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cue_category.unbalanced.cluster_based.timelim.stim_time = tmp.cue_category.unbalanced.cluster_based.timelim.stim_time;
%% ... GS: Unbalanced, cue window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CAT_PRED_unbal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cue_category.unbalanced.cluster_based.timelim.cue_time = tmp.cue_category.unbalanced.cluster_based.timelim.cue_time;

%% ... GS: Balanced, complete trial, uncorrected

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CAT_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cue_category.balanced.uncorrected.compTrial = tmp.cue_category.balanced.uncorrected.compTrial;
%% ... GS: Balanced, complete trial, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = -2000;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CAT_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cue_category.balanced.cluster_based.compTrial = tmp.cue_category.balanced.cluster_based.compTrial;
%% ... GS: Balanced, stim window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CAT_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.trialtime           = 'stim_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cue_category.balanced.cluster_based.timelim.stim_time = tmp.cue_category.balanced.cluster_based.timelim.stim_time;
%% ... GS: Balanced, cue window, cluster_based

% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CAT_PRED_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cue_category';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cue_category.balanced.cluster_based.timelim.cue_time = tmp.cue_category.balanced.cluster_based.timelim.cue_time;

%%
% %% ... Train on constrained time windows (convert to loop so it can be feed with many time-windows
%  using this two different time-window to train the classifier show the
%  difference in what can be decoded by the classifier. The first 170 ms
%  are capable to decode the activity sustained for ~750 ms after the cue
%  is presented. Also, when the training window is extended to 650 ms the
%  classifier is capable to decode up until the presentation of the target
%  item.

% % % %% ... GS: Balanced, cue window, cluster_based
% % % 
% % % % ADAM parameters
% % % cfg                     = [];            % clear the config variable
% % % cfg.iterations          = 250;           % reduce the number of iterations to save time
% % % cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
% % % cfg.acclim3D            = [minLim_gat maxLim_gat];
% % % cfg.trainlim             = [-1950 -1780];
% % % %
% % % cfg.reduce_dims = 'avtrain';
% % % 
% % % % EVE parameters
% % % cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CUE_PRED_bal_64hz'];     % path to first level results 
% % % cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
% % % cfg_darks.frst_level_analysis = 'cue_category';
% % % cfg_darks.trialtime           = 'cue_shortTrain';
% % % cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];
% % % 
% % % %% ... C&P
% % % clear tmp
% % % tmp = compute_plot_GAT(cfg, cfg_darks);
% % % 
% % % rel.cue_category.balanced.cluster_based.timelim.cue_time = tmp.cue_category.balanced.cluster_based.timelim.cue_time;

% % % % cfg.timelim       = [];
% % % % cfg.referenceline = [];
% % % 
% % % % training limits, add new ones as new rows
% % % % trainlims = [-1950 -1780; ...
% % %              -1950 -1300];
% % % 
% % % % average training and display testing
% % % % cfg.reduce_dims       = 'avtrain';
% % % 
% % % % Correction method
% % % % cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)
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
% % %         rel.cue_category.(cfg.mpcompcor_method).cue_traintime.(trainlim_lab).(currChann) = adam_compute_group_MVPA(cfg, folder_name); % compute stats
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

% % % folder_to_plot = '/cue_category/cue_trainlim/';
% % % 
% % % str_to_loop = rel.cue_category.(cfg.mpcompcor_method).cue_traintime;
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
% % %         adam_plot_MVPA(cfg, rel.cue_category.(cfg.mpcompcor_method).cue_traintime.(train_labs{countTTime}).(currChann))
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
% % % adam_plot_MVPA(cfg, rel.cue_category.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.ALL)
% % % adam_plot_MVPA(cfg, rel.cue_category.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.FRONTAL)
% % % adam_plot_MVPA(cfg, rel.cue_category.(cfg.mpcompcor_method).cue_traintime.m1950_m1300.OCCIP)
% % % 
% % % adam_plot_MVPA(cfg, rel.cue_category.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.ALL)
% % % adam_plot_MVPA(cfg, rel.cue_category.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.FRONTAL)
% % % adam_plot_MVPA(cfg, rel.cue_category.(cfg.mpcompcor_method).cue_traintime.m1950_m1780.OCCIP)


%%

% % % short_train                  = adam_compute_group_MVPA(cfg, folder_name); % compute stats
% % % adam_plot_MVPA(cfg, short_train);
% % %     pause(1); % pause to allow the graphic to resize                 
% % %     saveas(gcf, [plots_folder_path 'taskRelevance/cue_trainlim/cue_pred_-1950to-1780_corr.png']);
% % %     close(gcf);
% % % 
% % % cfg.trainlim           = [-1950 -1300];
% % % cfg.channelpool        = 'ALL';
% % % large_train                   = adam_compute_group_MVPA(cfg, folder_name); % compute stats
% % % adam_plot_MVPA(cfg, large_train);
% % %     pause(1); % pause to allow the graphic to resize                 
% % %     saveas(gcf, [plots_folder_path 'taskRelevance/cue_trainlim/cue_pred_-1950to-1300_corr.png']);
% % %     close(gcf);


%% 1.2 CATEGORY CORRECT STIM
%% ... GS: Balanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CATCORR_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cat_corr_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cat_corr_stim.balanced.uncorrected.compTrial = tmp.cat_corr_stim.balanced.uncorrected.compTrial;

%% ... GS: Balanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CATCORR_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cat_corr_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cat_corr_stim.balanced.cluster_based.compTrial = tmp.cat_corr_stim.balanced.cluster_based.compTrial;

%% ... GS: Balanced, stim window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CATCORR_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cat_corr_stim';
cfg_darks.trialtime           = 'stim_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cat_corr_stim.balanced.cluster_based.timelim.stim_time = tmp.cat_corr_stim.balanced.cluster_based.timelim.stim_time;

%% ... GS: Balanced, cue window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CATCORR_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cat_corr_stim';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cat_corr_stim.balanced.cluster_based.timelim.cue_time = tmp.cat_corr_stim.balanced.cluster_based.timelim.cue_time;

%% 1.2 CATEGORY INCORRECT STIM
%% ... GS: Balanced, complete trial, uncorrected
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'uncorrected'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CATINCORR_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cat_incorr_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cat_incorr_stim.balanced.uncorrected.compTrial = tmp.cat_incorr_stim.balanced.uncorrected.compTrial;

%% ... GS: Balanced, complete trial, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.referenceline       = 0;
cfg.acclim3D            = [minLim_gat maxLim_gat];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CATINCORR_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cat_incorr_stim';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cat_incorr_stim.balanced.cluster_based.compTrial = tmp.cat_incorr_stim.balanced.cluster_based.compTrial;

%% ... GS: Balanced, stim window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [0 1000];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CATINCORR_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cat_incorr_stim';
cfg_darks.trialtime           = 'stim_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cat_incorr_stim.balanced.cluster_based.timelim.stim_time = tmp.cat_incorr_stim.balanced.cluster_based.timelim.stim_time;

%% ... GS: Balanced, cue window, cluster_based
% ADAM parameters
cfg                     = [];            % clear the config variable
cfg.iterations          = 250;           % reduce the number of iterations to save time
cfg.mpcompcor_method    = 'cluster_based'; % multiple comparison correction method ('uncorrected' for uncorrected ploting)
cfg.acclim3D            = [minLim_gat maxLim_gat];
cfg.timelim             = [-1950 -500];

% EVE parameters
cfg_darks.folder_name         = [cfg_darks.result_folder_path  'TASKRELEVANCE/CATINCORR_STIM_bal_64hz'];     % path to first level results 
cfg_darks.channelpools        = {'ALL', 'FRONTAL', 'OCCIP'};                                % all comparisons are computed for each channelpool
cfg_darks.frst_level_analysis = 'cat_incorr_stim';
cfg_darks.trialtime           = 'cue_time';
cfg_darks.folder_to_plot      = ['/' cfg_darks.frst_level_analysis '/'];

%% ... C&P
clear tmp
tmp = compute_plot_GAT(cfg, cfg_darks);

rel.cat_incorr_stim.balanced.cluster_based.timelim.cue_time = tmp.cat_incorr_stim.balanced.cluster_based.timelim.cue_time;

%% 4. Save GAT computed
save('/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RESULTS/plots_gen_results/taskRelevance/taskRelevance_GAT.mat', 'rel');
