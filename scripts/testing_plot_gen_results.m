% compute again with constrained time window.
cfg                   = [];                                                         % clear the config variable
cfg.startdir          = [result_folder_path  'EXPECTATION/CUE_PRED_bal_64hz/'];   % path to first level results 
cfg.iterations        = 250;                                                        % reduce the number of iterations to save time

% Uncorrected for mult comp
cfg.mpcompcor_method  = 'cluster_based';                                            % multiple comparison correction method ('uncorrected' for uncorrected ploting)

% cfg.timelim           = [-1900 -1700];
% cfg.trainlim           = [-1950 -500];
% cfg.reduce_dims       = 'avtrain';
% cfg.testlim           = [-1950 -500];
% cfg.reduce_dims       = 'diag';

% cfg.referenceline = [-1780];
% cfg.referenceline = -1860;

% cfg.channelpool = 'ALL';cfg.trainlim           = [-1950 -500];
% cfg.channelpool        = 'ALL';
% test                   = adam_compute_group_MVPA(cfg); % compute stats
% adam_plot_MVPA(cfg, test);
% test = adam_compute_group_MVPA(cfg); % compute stats
% adam_plot_MVPA(cfg, test);

% compare training between (-1860 -1780) with training in -1950 -500
% cfg.trainlim           = [-1860 -1780];
% cfg.trainlim           = [-1860 -500];
% cfg.trainlim           = [-1950 -1780];
% cfg.trainlim           = [-1950 -500];
% cfg.trainlim           = [-1950 -1820];

cfg.reduce_dims       = 'avtrain';

%  using this two different time-window to train the classifier show the
%  difference in what can be decoded by the classifier. The first 170 ms
%  are capable to decode the activity sustained for ~750 ms after the cue
%  is presented. Also, when the training window is extended to 650 ms the
%  classifier is capable to decode up until the presentation of the target
%  item.

cfg.trainlim          = [-1950 -1780];
cfg.channelpool       = 'ALL';
test                  = adam_compute_group_MVPA(cfg); % compute stats
adam_plot_MVPA(cfg, test);

cfg.trainlim           = [-1950 -1300];
cfg.channelpool        = 'ALL';
test2                   = adam_compute_group_MVPA(cfg); % compute stats
adam_plot_MVPA(cfg, test2);

