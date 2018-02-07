%% read behavior
% NOTE: the csv files for subject 4 and 5 were swapped in the task
% relevance session. The script below corrects for this.

clear;
logdatadir = '/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/RAW_logfiles_bdfs/logfiles';

% logfiles = { 'S01_pred_coding_2015_Jun_26_1131' 'S01_pred_coding_2015_Jul_01_1133' 'S02_pred_coding_2015_Jun_29_1044' 'S02_pred_coding_2015_Jul_07_1400' 
%              'S03_pred_coding_2015_Jun_29_1415' 'S03_pred_coding_2015_Jul_01_1517' 'S04_pred_coding_2015_Jul_06_1416' 'S05_pred_coding_2015_Jul_03_1442' 'S05_pred_coding_2015_Jul_06_1101' 'S04_pred_coding_2015_Jul_03_1048' 'S06_pred_coding_2015_Jul_09_1047' 'S06_pred_coding_2015_Jul_07_1044'};
% ([0-9]{2}_[0-9]{4}) ... \\1'
logfiles = { 'S01_pred_coding_2015_Jul_01_1133' 'S01_pred_coding_2015_Jun_26_1131' 'S02_pred_coding_2015_Jul_07_1400' 'S02_pred_coding_2015_Jun_29_1044' ...
    'S03_pred_coding_2015_Jul_01_1517' 'S03_pred_coding_2015_Jun_29_1415' 'S04_pred_coding_2015_Jul_03_1048' 'S04_pred_coding_2015_Jul_06_1416' ...
     'S05_pred_coding_2015_Jul_03_1442' 'S05_pred_coding_2015_Jul_06_1101' 'S06_pred_coding_2015_Jul_07_1044' 'S06_pred_coding_2015_Jul_09_1047' ...
     'S07_pred_coding_2015_Oct_19_1017' 'S07_pred_coding_2015_Oct_21_1002' 'S08_pred_coding_2015_Nov_12_1002' 'S08_pred_coding_2015_Oct_19_1331' ...
     'S09_pred_coding_2015_Nov_05_1002' 'S09_pred_coding_2015_Oct_26_0959' 'S10_pred_coding_2015_Nov_19_1322' 'S10_pred_coding_2015_Oct_27_1006' ...
     'S11_pred_coding_2015_Nov_05_1350' 'S11_pred_coding_2015_Nov_06_1002' 'S12_pred_coding_2015_Nov_06_1335' 'S12_pred_coding_2015_Nov_20_1328' ...
     'S13_pred_coding_2015_Nov_12_1251' 'S13_pred_coding_2015_Nov_13_1315' 'S14_pred_coding_2015_Nov_19_1023' 'S14_pred_coding_2015_Nov_20_0959' ...
     'S15_pred_coding_2016_Apr_14_1418' 'S15_pred_coding_2016_Mar_10_1127' 'S16_pred_coding_2016_Mar_10_1447' 'S16_pred_coding_2016_Mar_24_1449' ...
     'S17_pred_coding_2016_Apr_06_1220' 'S17_pred_coding_2016_Mar_17_1058' 'S18_pred_coding_2016_Mar_17_1411' 'S18_pred_coding_2016_Mar_24_1114' ...
     'S19_pred_coding_2016_Apr_07_1407' 'S19_pred_coding_2016_Mar_31_1414' 'S20_pred_coding_2016_Apr_07_1044' 'S20_pred_coding_2016_Apr_14_1039'};

% sessions = { 'PP001_S01_Expectation_20150626_PredCoding' 'PP001_S02_TaskRelevance_20150701_PredCoding' 'PP002_S01_Expectation_20150629_PredCoding' 'PP002_S02_TaskRelevance_20150707_PredCoding'  'PP003_S01_Expectation_20150629_PredCoding' 'PP003_S02_TaskRelevance_20150701_PredCoding'  'PP004_S02_Expectation_20150706_PredCoding' 'PP004_S01_TaskRelevance_20150703_PredCoding'  'PP005_S02_Expectation_20150706_PredCoding' 'PP005_S01_TaskRelevance_20150703_PredCoding' 'PP006_S02_Expectation_20150709_PredCoding' 'PP006_S01_TaskRelevance_20150707_PredCoding' } ;
% sessions = {'PP001_S01_Expectation_20150626_PredCoding' 'PP001_S02_TaskRelevance_20150701_PredCoding' 'PP002_S01_Expectation_20150629_PredCoding' ...
%      'PP002_S02_TaskRelevance_20150707_PredCoding' 'PP003_S01_Expectation_20150629_PredCoding' 'PP003_S02_TaskRelevance_20150701_PredCoding' ...
%      'PP004_S01_TaskRelevance_20150703_PredCoding' 'PP004_S02_Expectation_20150706_PredCoding' 'PP005_S01_TaskRelevance_20150703_PredCoding' ...
%      'PP005_S02_Expectation_20150706_PredCoding' 'PP006_S01_TaskRelevance_20150707_PredCoding' 'PP006_S02_Expectation_20150709_PredCoding' ...
%      'PP007_S01_Expectation_20151019_PredCoding' 'PP007_S02_TaskRelevance_20151021_PredCoding' 'PP008_S01_TaskRelevance_20151019_PredCoding' ...
%      'PP008_S02_Expectation_20151112_PredCoding' 'PP009_S01_Expectation_20151026_PredCoding' 'PP009_S02_TaskRelevance_20151105_PredCoding' ...
%      'PP010_S01_TaskRelevance_20151027_PredCoding' 'PP010_S02_Expectation_20151119_PredCoding' 'PP011_S01_Expectation_20151105_PredCoding' ...
%      'PP011_S02_TaskRelevance_20151105_PredCoding' 'PP012_S01_TaskRelevance_20151106_PredCoding' 'PP012_S02_Expectation_20151120_PredCoding' ...
%      'PP013_S01_Expectation_20151112_PredCoding' 'PP013_S02_TaskRelevance_20151113_PredCoding' 'PP014_S01_TaskRelevance_20151119_PredCoding' ...
%      'PP014_S02_Expectation_20151120_PredCoding' 'PP015_S01_TaskRelevance_20160310_PredCoding' 'PP015_S02_Expectation_20160414_PredCoding' ...
%      'PP016_S01_TaskRelevance_20160310_PredCoding' 'PP016_S02_Expectation_20160324_PredCoding' 'PP017_S01_Expectation_20160317_PredCoding' ...
%      'PP017_S02_TaskRelevance_20160406_PredCoding' 'PP018_S01_Expectation_20160317_PredCoding' 'PP018_S02_TaskRelevance_20160324_PredCoding' ...
%      'PP019_S01_Expectation_20160331_PredCoding' 'PP019_S02_TaskRelevance_20160407_PredCoding' 'PP020_S01_TaskRelevance_20160407_PredCoding' ...
%      'PP020_S02_Expectation_20160414_PredCoding'};
%  

 % not very efficient way to get file names
% xxx = [dir([logdatadir '/*.csv'])]
% yyy = {xxx.name}
% char(yyy)
% 
% xxx = [dir(['/media/nicolas/Midgard/EEG_uva_fhr/Predictive_EEG/EEGLAB_DATA/highpass_.1/' '/*.set'])]
% yyy = {xxx.name}
% char(yyy)


% read data
% % logstruct = readPsychoPy(logdatadir,logfiles,sessions);
logstruct = readPsychoPy_predcod_jf(logdatadir,logfiles);

% get relevant info out
% for each session type, we want to know (per subject)
% - RT for each condition (cue type)
% - Number of hits for each condition:
%       button press to oriented target / button press to upside-down image)
% - Number of false alarms for each condition:
%       button pressed to oriented non-target / button press to upright image)
% - Number of total occurrences of targets
% - Number of total occurences of non-targets

expcount = 0; % expectation 
relcount = 0; % relevance

conditions = {'face', 'house', 'letter'};

fieldnames(logstruct)' % names to loop over *****************

session = fieldnames(logstruct)'

% for session = sessions
for cSes = 1:numel(session)
    ses = session{cSes};
    %% EXPECTATION (prediction) SESSION
    
    if ~isempty(strfind(ses,'expectation')) % without ~ ?
        expcount = expcount+1;
        data = logstruct.(ses);
        
        % get the goodies
        alldata.exp.all.RT(expcount) = mean(data.key_resp_2_rt(data.rotation == 180 & data.key_resp_2_rt>0 )) + .1; % add .1 for 100 ms delay on key onset
        alldata.exp.all.hits(expcount) = sum(data.rotation == 180 & data.key_resp_2_rt>0);
        alldata.exp.all.fa(expcount) = sum(data.rotation == 0 & data.key_resp_2_rt>0);
        alldata.exp.all.Ntarget(expcount) = sum(data.rotation == 180);
        alldata.exp.all.Nnontarget(expcount) = sum(data.rotation == 0);
            % average hr
            alldata.exp.all.hr(expcount) = alldata.exp.all.hits(expcount) / alldata.exp.all.Ntarget(expcount);
            % average far
            alldata.exp.all.far(expcount) = alldata.exp.all.fa(expcount) / alldata.exp.all.Nnontarget(expcount);
        
        % get the goodies (per condition: face, house, letter)
        for condition = conditions
            cond = condition{1};
            alldata.exp.(cond).RT(expcount) = mean(data.key_resp_2_rt(data.rotation == 180 & data.key_resp_2_rt>0 & strcmp(data.stimulus,condition))) + .1; % add .1 for 100 ms delay on key onset
            alldata.exp.(cond).hits(expcount) = sum(data.rotation == 180 & data.key_resp_2_rt>0 & strcmp(data.stimulus,condition));
            alldata.exp.(cond).fa(expcount) = sum(data.rotation == 0 & data.key_resp_2_rt>0 & strcmp(data.stimulus,condition));
            alldata.exp.(cond).Ntarget(expcount) = sum(data.rotation == 180 & strcmp(data.stimulus,condition));
            alldata.exp.(cond).Nnontarget(expcount) = sum(data.rotation == 0 & strcmp(data.stimulus,condition));
                % average hr per condition
                alldata.exp.(cond).hr(expcount) = alldata.exp.(cond).hits(expcount) / alldata.exp.(cond).Ntarget(expcount);
                % average far per condition
                alldata.exp.(cond).far(expcount) = alldata.exp.(cond).fa(expcount) / alldata.exp.(cond).Nnontarget(expcount);
        
        end
        % and some extra info
        alldata.exp.participant{expcount} = data.participant{4};
        alldata.exp.session(expcount) = data.session(4);
        alldata.exp.date{expcount} = data.date{4};       
        alldata.exp.age(expcount) = data.age(4);
        alldata.exp.handedness{expcount} = data.handedness{4};
        alldata.exp.gender{expcount} = data.gender{4};
        alldata.exp.vision_correction{expcount} = data.vision_correction{4};
        alldata.exp.vision_strength{expcount} = data.vision_strength(4);
    
    %% RELEVANCE SESSION
    
    elseif ~isempty(strfind(ses,'task_relevance'))
        relcount = relcount+1;
        data = logstruct.(ses);
        % get the goodies
        alldata.rel.all.RT(relcount) = mean(data.key_resp_2_rt(strcmp(data.task_relevance_target,'1') & data.key_resp_2_rt>0 )) + .1; % add .1 for 100 ms delay on key onset
        alldata.rel.all.hits(relcount) = sum(strcmp(data.task_relevance_target,'1') & data.key_resp_2_rt>0 );
        alldata.rel.all.fa(relcount) = sum(data.rotation ~= 0 & strcmp(data.task_relevance_target,'None') & data.key_resp_2_rt>0);
        alldata.rel.all.Ntarget(relcount) = sum(strcmp(data.task_relevance_target,'1'));
        alldata.rel.all.Nnontarget(relcount) = sum(data.rotation ~= 0 & strcmp(data.task_relevance_target,'None'));
            % average hr
            alldata.rel.all.hr(relcount) = alldata.rel.all.hits(relcount) / alldata.rel.all.Ntarget(relcount);
            % average far
            alldata.rel.all.far(relcount) = alldata.rel.all.fa(relcount) / alldata.rel.all.Nnontarget(relcount);
        
        % get the goodies (per condition: face, house, letter)
        for condition = conditions
            cond = condition{1};
            alldata.rel.(cond).RT(relcount) = mean(data.key_resp_2_rt(strcmp(data.task_relevance_target,'1') & data.key_resp_2_rt>0 & strcmp(data.stimulus,condition))) + .1; % add .1 for 100 ms delay on key onset
            alldata.rel.(cond).hits(relcount) = sum(strcmp(data.task_relevance_target,'1') & data.key_resp_2_rt>0 );
            alldata.rel.(cond).fa(relcount) = sum(data.rotation ~= 0 & strcmp(data.task_relevance_target,'None') & data.key_resp_2_rt>0 & strcmp(data.stimulus,condition));
            alldata.rel.(cond).Ntarget(relcount) = sum(strcmp(data.task_relevance_target,'1' & strcmp(data.stimulus,condition)));
            alldata.rel.(cond).Nnontarget(relcount) = sum(data.rotation ~= 0 & strcmp(data.task_relevance_target,'None') & strcmp(data.stimulus,condition));
                % average hr per condition
                alldata.rel.(cond).hr(relcount) = alldata.rel.(cond).hits(relcount) / alldata.rel.(cond).Ntarget(relcount);
                % average far per condition
                alldata.rel.(cond).far(relcount) = alldata.rel.(cond).fa(relcount) / alldata.rel.(cond).Nnontarget(relcount);
        end
        
        % and some extra info
        if relcount == 4; data.participant{4} = 'S05'; end; % to correct s04 and s05 swapping (see line 2-3)
        if relcount == 5; data.participant{4} = 'S04'; end; % to correct s04 and s05 swapping (see line 2-3)
        alldata.rel.participant{relcount} = data.participant{4};       
        alldata.rel.session(relcount) = data.session(4);
        alldata.rel.date{relcount} = data.date{4};       
        alldata.rel.age(relcount) = data.age(4);
        alldata.rel.handedness{relcount} = data.handedness{4};
        alldata.rel.gender{relcount} = data.gender{4};
        alldata.rel.vision_correction{relcount} = data.vision_correction{4};
        alldata.rel.vision_strength{relcount} = data.vision_strength(4);
    end
end

clearvars -EXCEPT logstruct alldata
save('/Volumes/backup/Predictive_EEG/BEHAVIOR/ALLDATA.mat');

%% plot RTs 

subjects = fields(logstruct);
nSubj = numel(subjects);
RThist = figure;
for cSubj = 1:nSubj;
    figure(RThist);
    subplot(floor(sqrt(nSubj)),ceil(sqrt(nSubj)),cSubj);
    if ~isempty(strfind(subjects{cSubj},'task_relevance'))
        index = strcmp(logstruct.(subjects{cSubj}).task_relevance_target,'1') & logstruct.(subjects{cSubj}).key_resp_2_rt>0;
    else
        index = logstruct.(subjects{cSubj}).rotation == 180 & logstruct.(subjects{cSubj}).key_resp_2_rt>0;
    end
    
    %disp(numel(find(index)));
    hist((logstruct.(subjects{cSubj}).key_resp_2_rt(index)*1000)+100,[0:50:1500]);
    ind_und = strfind(subjects{cSubj},'
    _');
    
    title(strrep(subjects{cSubj}(1:ind_und(3)),'_',' ')); %%% SALTA ERROR AQUI *************
    
    xlim([0 1500]);
    % ylim([0 200]);
    set(gca,'XTick',[0 500 1000 1500]);
    set(gca,'XTickLabel',{'0 ms','500 ms', '1000 ms', '1500 ms'});
    set(gca,'FontSize',20);
end

figure(RThist);
suptitle('histograms of RTs:');


%% plot HRs and FARs

mycolor=[0 0 0;0 0 1;1 0 0;0 1 0];
colormap(mycolor);
bar([alldata.exp.all.hr; alldata.exp.all.far; alldata.rel.all.hr; alldata.rel.all.far]');
set(gca,'FontSize',20);
h = legend('prediction HR', 'prediction FAR', 'task relevance HR', 'task relevance FAR');
set(h,'FontSize',20);

%% compute cue duration, retention interval duration and target duration
% accuracy of cue duration and retention interval seem excellent
subjects = fields(logstruct);
nSubj = numel(subjects);
for cSubj = 1:nSubj;
    
    durations.(subjects{cSubj}).cue_duration = tabulate(-(round(1000*(logstruct.(subjects{cSubj}).cue_stop(4:end) - logstruct.(subjects{cSubj}).cue_start(4:end)))));
    durations.(subjects{cSubj}).retention_duration = tabulate(-(round(1000*(logstruct.(subjects{cSubj}).stim_image_start(4:end) - logstruct.(subjects{cSubj}).cue_stop(4:end)))));
    durations.(subjects{cSubj}).target_duration = tabulate(-(round(1000*(logstruct.(subjects{cSubj}).stim_image_stop(4:end) - logstruct.(subjects{cSubj}).stim_image_start(4:end)))));
    %durations.(subjects{cSubj}).cue_duration
end

