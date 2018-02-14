%% file settings and trigger labels 
clear;

% file names
filenames= {'PP001_S01_Expectation_20150626_PredCoding.set'     'PP001_S02_TaskRelevance_20150701_PredCoding.set' ...
            'PP002_S01_Expectation_20150629_PredCoding.set'     'PP002_S02_TaskRelevance_20150707_PredCoding.set' ...
            'PP003_S01_Expectation_20150629_PredCoding.set'     'PP003_S02_TaskRelevance_20150701_PredCoding.set' ...
            'PP004_S01_TaskRelevance_20150703_PredCoding.set'   'PP004_S02_Expectation_20150706_PredCoding.set' ...
            'PP005_S01_TaskRelevance_20150703_PredCoding.set'   'PP005_S02_Expectation_20150706_PredCoding.set' ...
            'PP006_S01_TaskRelevance_20150707_PredCoding.set'   'PP006_S02_Expectation_20150709_PredCoding.set' ...
            'PP007_S01_Expectation_20151019_PredCoding.set'     'PP007_S02_TaskRelevance_20151021_PredCoding.set' ...
            'PP008_S01_TaskRelevance_20151019_PredCoding.set'   'PP008_S02_Expectation_20151112_PredCoding.set' ...
            'PP009_S01_Expectation_20151026_PredCoding.set'     'PP009_S02_TaskRelevance_20151105_PredCoding.set' ...
            'PP010_S01_TaskRelevance_20151027_PredCoding.set'   'PP010_S02_Expectation_20151119_PredCoding.set' ...
            'PP011_S01_Expectation_20151105_PredCoding.set'     'PP011_S02_TaskRelevance_20151105_PredCoding.set' ...
            'PP012_S01_TaskRelevance_20151106_PredCoding.set'   'PP012_S02_Expectation_20151120_PredCoding.set' ...
            'PP013_S01_Expectation_20151112_PredCoding.set'     'PP013_S02_TaskRelevance_20151113_PredCoding.set' ...
            'PP014_S01_TaskRelevance_20151119_PredCoding.set'   'PP014_S02_Expectation_20151120_PredCoding.set' ...
            'PP015_S01_TaskRelevance_20160310_PredCoding.set'   'PP015_S02_Expectation_20160414_PredCoding.set' ...
            'PP016_S01_TaskRelevance_20160310_PredCoding.set'   'PP016_S02_Expectation_20160324_PredCoding.set' ...
            'PP017_S01_Expectation_20160317_PredCoding.set'     'PP017_S02_TaskRelevance_20160406_PredCoding.set' ...
            'PP018_S01_Expectation_20160317_PredCoding.set'     'PP018_S02_TaskRelevance_20160324_PredCoding.set' ...
            'PP019_S01_Expectation_20160331_PredCoding.set'     'PP019_S02_TaskRelevance_20160407_PredCoding.set' ...
            'PP020_S01_TaskRelevance_20160407_PredCoding.set'   'PP020_S02_Expectation_20160414_PredCoding.set' };

files_expectation = file_list_restrict(filenames,'Expectation');
files_taskrelevance = file_list_restrict(filenames,'TaskRelevance');

% session type
prediction = [1:9 11:19];
task_relevance = [21:29 31:39];

% all cues
cue_face = [1:3 11:13 21:23 31:33];
cue_house = [4:6 14:16 24:26 34:36];
cue_letter = [7:9 17:19 27:29 37:39];

% all stimuli
stim_face = [1 4 7 11 14 17 21 24 27 31 34 37];
stim_house = [2 5 8 12 15 18 22 25 28 32 35 38];
stim_letter = [3 6 9 13 16 19 23 26 29 33 36 39];

% targets and non-targets in prediction session
upright = 1:9;                        % non-target (do not press)
upsidedown = 11:19;                   % target (press space bar)
predicted = [1 5 9 11 15 19];         % targets and non-targets (no relation to button press)
nonpredicted = [2:4 6:8 12:14 16:18]; % targets and non-targets (no relation to button press)

% targets and non-targets in task relevance session
category_incorrect = [22:24 26:28 32:34 36:38]; % non-target (do not press)
non_tilted = 21:29;                             % non-target (do not press)
category_correct = [21 25 29 31 35 39];         % targets and non-targets (only tilted ones are targets and require a button press)
tilted = 31:39;                                 % targets and non-targets (only correct categories are targets and require a button press)
category_correct_tilted = intersect(category_correct,tilted); % target (press space bar)

%%
cfg = [];
cfg.datadir = 'C:\Prediction_exp\EEGLAB_DATA'; % put the actual source directory here
cfg.filenames = filenames;
cfg.class_type = 'linear';
cfg.class_method = 'AUC';
cfg.crossclass = 'yes';
cfg.resample = 128;
cfg.nfolds = 10;
cfg.raw_or_tfr = 'raw';
cfg.channels = 'ALL'; % ALL, OCCIP and OCCIPARIETAL
cfg.clean_window = [.3 2.8];  % wait-interval + test item
cfg.erp_baseline = [-2.25,0]; % 250 ms of the fixation period

%% 01. Classify cue in EXPECTATION condition (no response was given) (DONE)
cfg.class_spec{1} = cond_string(prediction,cue_face,upright);
cfg.class_spec{2} = cond_string(prediction,cue_house,upright);
cfg.class_spec{3} = cond_string(prediction,cue_letter,upright);
cfg.filenames = files_expectation;
cfg.outputdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/PRED_CUE';
adam_MVPA_firstlevel(cfg);

%% 02. Classify cue in RELEVANCE TASK condition (no response was given) (re-DO)
cfg.class_spec{1} = cond_string(task_relevance,cue_face,non_tilted);
cfg.class_spec{2} = cond_string(task_relevance,cue_house,non_tilted);
cfg.class_spec{3} = cond_string(task_relevance,cue_letter,non_tilted);
cfg.filenames = files_taskrelevance;
cfg.outputdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_REL/PRED_CUE';
adam_MVPA_firstlevel(cfg);

%% 03. Classify predicted stim in EXPECTATION condition (being done)
cfg.class_spec{1} = cond_string(prediction,stim_face,upright,predicted);
cfg.class_spec{2} = cond_string(prediction,stim_house,upright,predicted);
cfg.class_spec{3} = cond_string(prediction,stim_letter,upright,predicted);
cfg.filenames = files_expectation;
cfg.outputdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/PRED_STIM';
adam_MVPA_firstlevel(cfg);

%% 04. Classify nonpredicted stim in EXPECTATION cond (being done)
cfg.class_spec{1} = cond_string(prediction,stim_face,upright,nonpredicted);
cfg.class_spec{2} = cond_string(prediction,stim_house,upright,nonpredicted);
cfg.class_spec{3} = cond_string(prediction,stim_letter,upright,nonpredicted);
cfg.filenames = files_expectation;
cfg.outputdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/NONPRED_STIM';
adam_MVPA_firstlevel(cfg);

%% 05. Classify category-correct stim in RELEVANCE cond (being done)
cfg.class_spec{1} = cond_string(task_relevance,stim_face,non_tilted, category_correct);
cfg.class_spec{2} = cond_string(task_relevance,stim_house,non_tilted, category_correct);
cfg.class_spec{3} = cond_string(task_relevance,stim_letter,non_tilted, category_correct);
cfg.filenames = files_taskrelevance;
cfg.outputdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_REL/CATCORR_STIM';
adam_MVPA_firstlevel(cfg);

%% 06. Classify category-incorrect stim in RELEVANCE cond (being done)
cfg.class_spec{1} = cond_string(task_relevance,stim_face,non_tilted, category_incorrect);
cfg.class_spec{2} = cond_string(task_relevance,stim_house,non_tilted, category_incorrect);
cfg.class_spec{3} = cond_string(task_relevance,stim_letter,non_tilted, category_incorrect);
cfg.filenames = files_taskrelevance;
cfg.outputdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_REL/CATINCORR_STIM';
adam_MVPA_firstlevel(cfg);

%%  RUN THIS TWO
% how to group two sets of stim?
% this seems right
%% Classify FACE VS. NONFACE cue in EXPECTATION condition (no response was given)
cfg.class_spec{1} = cond_string(prediction,cue_face,upright);
cfg.class_spec{2} = [cond_string(prediction,cue_house,upright) ',' cond_string(prediction,cue_letter,upright)];
cfg.filenames = files_expectation;
cfg.outputdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_EXP/PRED_CUE_FACENONFACE';
adam_MVPA_firstlevel(cfg);

%% Classify cue in RELEVANCE TASK condition (no response was given)
cfg.class_spec{1} = cond_string(task_relevance,cue_face,non_tilted);
cfg.class_spec{2} = [cond_string(task_relevance,cue_house,non_tilted) ',' cond_string(task_relevance,cue_letter,non_tilted)];
cfg.filenames = files_taskrelevance;
cfg.outputdir = '/home/nicolas1/Documents/predictive_eeg/MVPA_RESULTS_REL/PRED_CUE_FACENONFACE';
adam_MVPA_firstlevel(cfg);

strcat(cond_string(prediction,cue_house,upright), ',', cond_string(prediction,cue_letter,upright))