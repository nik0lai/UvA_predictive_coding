%% trigger labels and epoch settings
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
predicted = [1 5 9 11 16 19];         % targets and non-targets (no relation to button press)
nonpredicted = [2:4 6:8 12:14 16:18]; % targets and non-targets (no relation to button press)

% targets and non-targets in task relevance session
category_incorrect = [22:24 26:28 32:34 36:38]; % non-target (do not press)
non_tilted = 21:29;                             % non-target (do not press)
category_correct = [21 25 29 31 35 39];         % targets and non-targets (only tilted ones are targets and require a button press)
tilted = 31:39;                                 % targets and non-targets (only correct categories are targets and require a button press)
category_correct_tilted = intersect(category_correct,tilted); % target (press space bar)

% epoch time period
eeglab_epochtime = [-2.5 1];

%% pipeline to follow:
% - import into EEGLAB
% - highpass filter of .1 Hz
% - epoch (-2.5 1) ms
% - remove blinks using ICA
%
% During analysis:
% - reject trials with muscle artifacts in a window from 0-500 ms (large deviating power in the 110-140 Hz range)
% - baseline correction on (-2300,-2000) ms -> the fixation period 
% - lots of decoding on lots of stuff

%% read data into eeg lab
files2do = {};
basedir = '/Volumes/backup/Predictive_EEG/RAW_logfiles_bdfs/BDFs';
save2dir = '/Volumes/backup/Predictive_EEG/EEGLAB_DATA/unfiltered_unepoched';
filz=dir([basedir filesep '*.bdf']); % find all set files for each subject
for cFiles=29:numel(filz)
    filename = [basedir filesep filz(cFiles).name];
    if sum(strncmp(filz(cFiles).name,files2do,numel(filz(cFiles).name)-4))>0 || isempty(files2do)
        EEG = readbdf_into_eeglab_vu(filename);
        % downsample a bit, 512 is really not necessary
        EEG = pop_resample(EEG, 256);
        % get the name
        [~, fname, ~ ] = fileparts(filename);
        EEG = pop_saveset(EEG, 'filename',strrep(fname,'.','_'),'filepath',save2dir);
        events = [EEG.event(:).type];
        pred_events = sum(ismember(events, prediction));
        taskrelevance_events = sum(ismember(events, task_relevance));
        % session type according to file
        if strfind(fname,'Expectation')
            ftype = 'expectation';
        elseif strfind(fname,'TaskRelevance')
            ftype = 'taskrelevance';
        else
            error(['cannot find filetype ' fname]);
        end
        % session type according to triggers
        if pred_events > taskrelevance_events
            ttype = 'expectation';
            nEvents_prediction.(fname) = pred_events;
        elseif taskrelevance_events > pred_events
            ttype = 'taskrelevance';
            nEvents_taskrelevance.(fname) = taskrelevance_events;
        else
            error(['cannot find session type using triggers in ' fname]);
        end
%         % check if triggers agree about session type
%         if pred_events>0 && taskrelevance_events>0
%             error(['triggers disagree on session type  in file ' fname]);
%         end
        % check if file name and triggers agree about session type
        if ~strcmpi(ttype,ftype)
            error(['triggers and file name disagree on session type  in file ' fname]);
        end
    end
end

%% filter and epoch data on server
sourcedir =  '$HOME/predictive/EEGLAB_DATA/unfiltered_unepoched';
targetdir =  '$HOME/predictive/EEGLAB_DATA/highpass_.1';
function_path = '$HOME/ADAM/eeg_preprocessing';
qsub = [];
qsub.walltime = '00:14:59';
qsub.maxcores = 10;
qsub.cores = 16;
qsub.mem = '64gb';
qsub.qsubdir = '/Users/VU-MBP/lisa_remote';
qsub.use_scratch = false;

files =  files_expectation;
triglabels = prediction;
create_qsub_files(function_path,'filter_eeg_and_epoch',qsub,sourcedir,files,targetdir,0.1,0,eeglab_epochtime(1),eeglab_epochtime(2),cond_string(triglabels));

files =  files_taskrelevance;
triglabels = task_relevance;
create_qsub_files(function_path,'filter_eeg_and_epoch',qsub,sourcedir,files,targetdir,0.1,0,eeglab_epochtime(1),eeglab_epochtime(2),cond_string(triglabels));

%% run ICA on Lisa
functionpath = '$HOME/ADAM/eeg_preprocessing';
qsub = [];
qsub.walltime = '23:59:00';
qsub.mem = '64gb';
qsub.maxcores = 8;
qsub.qsubdir = '/Users/VU-MBP/lisa_remote';
filepath = '$HOME/predictive/EEGLAB_DATA/highpass_.1';
outpath = '$HOME/predictive/EEGLAB_DATA/ICA';
create_qsub_files(functionpath,'compute_ICs',qsub,filepath,filenames,outpath,'no','no','no','yes');

%% Remove ICs using qsub
sourcedir = '$HOME/N2pc_Eimer2/EEGLAB_DATA/ICA';
targetdir = '$HOME/N2pc_Eimer2/EEGLAB_DATA/noblinks';
files = dir('/Users/VU-MBP/lisa_remote/N2pc_Eimer2/EEGLAB_DATA/ICA/*.set');
files = {files(:).name};
function_path = '$HOME/ADAM/eeg_preprocessing';
qsub = [];
qsub.walltime = '0:04:59';
qsub.cores = 16;
qsub.mem = '64gb';
qsub.maxcores = 10;
qsub.qsubdir = '/Users/VU-MBP/lisa_remote';
qsub.use_scratch = false;
create_qsub_files(function_path,'remove_ICs',qsub,sourcedir,files,targetdir,'0,0,1,0');

%% Remove eyeblinks RUN IN MATLAB ON LISA
clear;
sourcedir = '/home/johannes/N2pc_Eimer2/EEGLAB_DATA/noblinks';
targetdir = '/home/johannes/N2pc_Eimer2/EEGLAB_DATA/noblinks_noeye';
filz=dir([sourcedir filesep '*.set']); % find all set files
for cFiles=1:numel(filz)
    filename = filz(cFiles).name;
    fullfile = [sourcedir filesep filename];
    EEG = pop_loadset('filename',filename,'filepath',sourcedir);
    events = pop_exportepoch(EEG);
    % make sure you get the labels for the ocular channels right
    channelnames = {EEG.chanlocs(:).labels};
    timewindow = [0 500]; % time window to look at
    % compute pure horizontal eye movement channel
    EEG2 = EEG;
    EEG2.data(ismember(channelnames,{'HEOG_R'}),:,:) = EEG2.data(ismember(channelnames,{'HEOG_R'}),:,:) - EEG2.data(ismember(channelnames,{'HEOG_L'}),:,:);
    % find eye-movements
    rejected_trials = pop_artstepX(EEG2,'channel',find(ismember(channelnames,{'HEOG_R'})),'flag',1,'threshold',30,'Twindow', timewindow, 'Windowsize',  100, 'Windowstep',  50 );
    clear EEG2;
    rejected_trials = logical(rejected_trials);
    EEG.reject.rejmanual = rejected_trials;
    % add 10000
    events(rejected_trials) = events(rejected_trials) + 10000;
    EEG = pop_importepoch(EEG,events,{'eventtype'},'typefield','eventtype');
    % save
    pop_saveset(EEG, 'filename',filename,'filepath',targetdir);
    filenames{cFiles,1} = filename;
    percentage_eye_movements(cFiles,1) = sum(rejected_trials)/numel(rejected_trials);
end

%% EXAMPLE Recode incorrect responses by adding 1000 for missed and incorrect trials
sourcedir = '/Users/VU-MBP/Dropbox/Work/Experimenten/N2pc_Eimer2/EEGLAB_DATA/highpass_.1';
targetdir = '/Users/VU-MBP/Dropbox/Work/Experimenten/N2pc_Eimer2/EEGLAB_DATA/recoded';
filz = dir([sourcedir filesep '*.set']);
clear percentage;
for cFiles = 1:numel(filz)
    fname = filz(cFiles).name;
    disp(fname);
    EEG = pop_loadset('filename',fname,'filepath',sourcedir);
    n = 0;
    for cEpoch= 1 : numel(EEG.epoch)
        % then recode incorrect response trials by adding 1000
        if sum(strcmp(EEG.epoch(cEpoch).eventtype,'100')) == 0 % 100 are the correct responses, so this identifies incorrect or absent responses
            %disp(['recoding event ' num2str(cEpoch)]);
            indxoftrig = cell2mat(EEG.epoch(cEpoch).eventlatency) == 0;
            if ~isempty(indxoftrig)
                n = n + 1;
                eventcode = string2double(EEG.event(EEG.epoch(cEpoch).event(indxoftrig)).type);
                EEG.event(EEG.epoch(cEpoch).event(indxoftrig)).type = num2str(eventcode+1000);
            end
        end
    end
    disp(['recoded ' num2str(n) ' events.']);
    percentage(cFiles) = n/numel(EEG.epoch);
    EEG = eeg_checkset(EEG,'eventconsistency');
    EEG = pop_saveset(EEG, 'filename',fname,'filepath',targetdir);
end

%% EXAMPLE count events for check
for cEpoch = 1 : numel(EEG.epoch)
    indxoftrig = cell2mat(EEG.epoch(cEpoch).eventlatency) == 0;
    event_val(cEpoch) = string2double(EEG.event(EEG.epoch(cEpoch).event(indxoftrig)).type);
end