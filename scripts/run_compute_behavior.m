%% read behavior
% NOTE: the csv files for subject 4 and 5 were swapped in the task
% relevance session. The script below corrects for this.

clear;

master_working_folder = '/media/nicolas/Midgard/EEG_uva_fhr/';

logdatadir = [master_working_folder 'Predictive_EEG/RAW_logfiles_bdfs/logfiles'];

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

% counters for session loop
expcount = 0; % expectation 
relcount = 0; % relevance

conditions = {'face', 'house', 'letter'};

session = fieldnames(logstruct)';  % names to loop over

% for session = sessions
for cSes = 1:numel(session)
    ses = session{cSes};
    %% EXPECTATION (prediction) SESSION
    
    if ~isempty(strfind(ses,'expectation'))
        expcount = expcount+1;
        data = logstruct.(ses);
        
        % get the goodies
        alldata.exp.all.RT(expcount)                = mean(data.key_resp_2_rt(data.rotation == 180 & data.key_resp_2_rt > 0)) + .1; % add .1 for 100 ms delay on key onset
        alldata.exp.all.hits(expcount)              = sum(data.rotation == 180 & data.key_resp_2_rt > 0);  % hitrate
        alldata.exp.all.fa(expcount)                = sum(data.rotation == 0 & data.key_resp_2_rt > 0);    % falsealarm rate
        alldata.exp.all.Ntarget(expcount)           = sum(data.rotation == 180);                           % target trials
        alldata.exp.all.Nnontarget(expcount)        = sum(data.rotation == 0);                             % non-target trials
        
        % average hitrate
        alldata.exp.all.hr(expcount)                = alldata.exp.all.hits(expcount) / alldata.exp.all.Ntarget(expcount);
        % average falsealarm rate
        alldata.exp.all.far(expcount)               = alldata.exp.all.fa(expcount) / alldata.exp.all.Nnontarget(expcount);
        
        % get the goodies (per condition: face, house, letter)
        for condition = 1:numel(conditions)
            cond = conditions{condition};
            alldata.exp.(cond).RT(expcount)         = mean(data.key_resp_2_rt(data.rotation == 180 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond))) + .1; % add .1 for 100 ms delay on key onset
            alldata.exp.(cond).hits(expcount)       = sum(data.rotation == 180 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond)); % hitrate
            alldata.exp.(cond).fa(expcount)         = sum(data.rotation == 0 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond));   % falsealarm rate
            alldata.exp.(cond).Ntarget(expcount)    = sum(data.rotation == 180 & strcmp(data.stimulus, cond));                          % target trials
            alldata.exp.(cond).Nnontarget(expcount) = sum(data.rotation == 0 & strcmp(data.stimulus, cond));                            % non-target trials
            
            % average hr per condition
            alldata.exp.(cond).hr(expcount)         = alldata.exp.(cond).hits(expcount) / alldata.exp.(cond).Ntarget(expcount);
            % average far per condition
            alldata.exp.(cond).far(expcount)        = alldata.exp.(cond).fa(expcount) / alldata.exp.(cond).Nnontarget(expcount);
        
        end
        
        % and some extra info %% it doesnt have to be row 4
        alldata.exp.participant{expcount}           = data.participant{4};
        alldata.exp.session(expcount)               = data.session(4);
        alldata.exp.date{expcount}                  = data.date{4};       
        alldata.exp.age(expcount)                   = data.age(4);
        alldata.exp.handedness{expcount}            = data.handedness{4};
        alldata.exp.gender{expcount}                = data.gender{4};
        alldata.exp.vision_correction{expcount}     = data.vision_correction{4};
        alldata.exp.vision_strength{expcount}       = data.vision_strength(4);
    
    %% RELEVANCE SESSION
    
    elseif ~isempty(strfind(ses,'taskRelevance'))
        relcount = relcount+1;
        data = logstruct.(ses);
                     
        % get the goodies
        alldata.rel.all.RT(relcount)                = mean(data.key_resp_2_rt(strcmp(data.task_relevance_target, '1') & data.key_resp_2_rt > 0 )) + .1; % add .1 for 100 ms delay on key onset
        alldata.rel.all.hits(relcount)              = sum(strcmp(data.task_relevance_target,'1') & data.key_resp_2_rt > 0 );
        alldata.rel.all.fa(relcount)                = sum(data.rotation ~= 0 & strcmp(data.task_relevance_target, 'None') & data.key_resp_2_rt > 0);
        alldata.rel.all.Ntarget(relcount)           = sum(strcmp(data.task_relevance_target, '1'));
        alldata.rel.all.Nnontarget(relcount)        = sum(data.rotation ~= 0 & strcmp(data.task_relevance_target,'None'));
        
        % average hr
        alldata.rel.all.hr(relcount)                = alldata.rel.all.hits(relcount) / alldata.rel.all.Ntarget(relcount);
        % average far
        alldata.rel.all.far(relcount)               = alldata.rel.all.fa(relcount) / alldata.rel.all.Nnontarget(relcount);
        
        % get the goodies (per condition: face, house, letter)
        for condition = 1:numel(conditions)
            cond = conditions{condition};
            
            alldata.rel.(cond).RT(relcount)         = mean(data.key_resp_2_rt(strcmp(data.task_relevance_target,'1') & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond))) + .1; % add .1 for 100 ms delay on key onset
            alldata.rel.(cond).hits(relcount)       = sum(strcmp(data.task_relevance_target, '1') & data.key_resp_2_rt > 0 );
            alldata.rel.(cond).fa(relcount)         = sum(data.rotation ~= 0 & strcmp(data.task_relevance_target, 'None') & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond));
            alldata.rel.(cond).Ntarget(relcount)    = sum(strcmp(data.task_relevance_target, '1' & strcmp(data.stimulus, cond)));
            alldata.rel.(cond).Nnontarget(relcount) = sum(data.rotation ~= 0 & strcmp(data.task_relevance_target,'None') & strcmp(data.stimulus, cond));
            
            % average hr per condition
            alldata.rel.(cond).hr(relcount)         = alldata.rel.(cond).hits(relcount) / alldata.rel.(cond).Ntarget(relcount);
            % average far per condition
            alldata.rel.(cond).far(relcount)        = alldata.rel.(cond).fa(relcount) / alldata.rel.(cond).Nnontarget(relcount);
            
        end
        
        % participant number correction for s04 and s05 (see line 2-3)
        if relcount == 4; data.participant{4} = 'S05'; end; 
        if relcount == 5; data.participant{4} = 'S04'; end; 
               
        % and some extra info
        alldata.rel.participant{relcount}           = data.participant{4};       
        alldata.rel.session(relcount)               = data.session(4);
        alldata.rel.date{relcount}                  = data.date{4};       
        alldata.rel.age(relcount)                   = data.age(4);
        alldata.rel.handedness{relcount}            = data.handedness{4};
        alldata.rel.gender{relcount}                = data.gender{4};
        alldata.rel.vision_correction{relcount}     = data.vision_correction{4};
        alldata.rel.vision_strength{relcount}       = data.vision_strength(4);
        
    end
end

%% clean trash and keep logfile structure (trial info) and alldata structure

clearvars -EXCEPT logstruct alldata master_working_folder
save([master_working_folder  'Predictive_EEG/BEHAVIOR/ALLDATA_new.mat']);

%% plot RTs per subject and session

subjects    = fields(logstruct); % get session names
nSubj       = numel(subjects);   % number of sessions
RThist      = figure;            % create canvas to plot RTs

for cSubj = 1:nSubj;
    
    figure(RThist);
    subplot(floor(sqrt(nSubj)), ceil(sqrt(nSubj)), cSubj); % create a grid for plots
    
    % detects taskRelevance or expecation session
    if ~isempty(strfind(subjects{cSubj}, 'taskRelevance'))
        index   = strcmp(logstruct.(subjects{cSubj}).task_relevance_target,'1') & logstruct.(subjects{cSubj}).key_resp_2_rt > 0; % get index of target trials for TR
    else
        index   = logstruct.(subjects{cSubj}).rotation == 180 & logstruct.(subjects{cSubj}).key_resp_2_rt > 0; % get index of target trials for EX
    end
    
    %disp(numel(find(index)));
    hist((logstruct.(subjects{cSubj}).key_resp_2_rt(index)*1000)+100, [0:50:1500]);
    
    ind_und = strfind(subjects{cSubj},'_'); % separators index
    title([subjects{cSubj}(1:ind_und(1)-1) ' ' subjects{cSubj}(ind_und(2)+1:15)]); % create tittle of hist. 
    xlim([0 1500]);
    % ylim([0 200]);
    
    set(gca,'XTick',[0 500 1000 1500]);
    set(gca,'XTickLabel',{'0 ms','500 ms', '1000 ms', '1500 ms'});
    set(gca,'FontSize',6);
    
end

figure(RThist);
suptitle('histograms of RTs:');

saveas(RThist, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_01_sub_sess.png'])
close(gcf)

%% plot RTs per subject separating by session

% EXPECTATION
subjects            = fields(logstruct); % get session names
nSubj               = numel(subjects);   % number of sessions
RThistExpectat      = figure;            % create canvas to plot RTs

index_expectat      = find(~cellfun(@isempty,strfind(fields(logstruct), 'expectation'))); % get expectation sessions index

for cSubjExp = 1:nSubj/2;
    
    figure(RThistExpectat);
    subplot(4, 5, cSubjExp); % create a grid for plots
        
    % detects expecation session
    if ~isempty(strfind(subjects{index_expectat(cSubjExp)}, 'expectation'))
        index = logstruct.(subjects{index_expectat(cSubjExp)}).rotation == 180 & logstruct.(subjects{index_expectat(cSubjExp)}).key_resp_2_rt > 0; % get index of target trials for EX
    else
        continue
    end
    
    %disp(numel(find(index)));
    hist((logstruct.(subjects{index_expectat(cSubjExp)}).key_resp_2_rt(index)*1000)+100, [0:50:1500]);
    
    ind_und = strfind(subjects{index_expectat(cSubjExp)},'_'); % separators index
    
    title([subjects{index_expectat(cSubjExp)}(1:ind_und(1)-1) ' ' subjects{index_expectat(cSubjExp)}(ind_und(2)+1:15)]); % create tittle of hist.
    xlim([0 1500]);
%     ylim([0 20]);
    
    set(gca,'XTick',[0 500 1000 1500]);
    set(gca,'XTickLabel',{'0 ms','500 ms', '1000 ms', '1500 ms'});
    set(gca,'FontSize',6);
    
end

figure(RThistExpectat);
suptitle('histograms of RTs (expectation sessions):');
saveas(RThistExpectat, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_02_sub_expectat.png'])
close(gcf)

% taskRelevance

RThisttaskRel       = figure;  % create canvas to plot RTs
index_taskRel       = find(~cellfun(@isempty,strfind(fields(logstruct), 'taskRelevance'))); % get expectation sessions index

for cSubjTas = 1:nSubj/2;
    
    figure(RThisttaskRel);
    subplot(4, 5, cSubjTas); % create a grid for plots
        
    % detects expecation session
    if ~isempty(strfind(subjects{index_taskRel(cSubjTas)}, 'taskRelevance'))
        index = strcmp(logstruct.(subjects{index_taskRel(cSubjTas)}).task_relevance_target,'1') & logstruct.(subjects{index_taskRel(cSubjTas)}).key_resp_2_rt > 0; % get index of target trials for TR
    else
        continue
    end
    
    %disp(numel(find(index)));
    hist((logstruct.(subjects{index_taskRel(cSubjTas)}).key_resp_2_rt(index)*1000)+100, [0:50:1500]);
    
    ind_und = strfind(subjects{index_taskRel(cSubjTas)},'_'); % separators index
    
    title([subjects{index_taskRel(cSubjTas)}(1:ind_und(1)-1) ' ' subjects{index_taskRel(cSubjTas)}(ind_und(2)+1:15)]); % create tittle of hist.
    xlim([0 1500]);
    % ylim([0 200]);
    
    set(gca,'XTick',[0 500 1000 1500]);
    set(gca,'XTickLabel',{'0 ms','500 ms', '1000 ms', '1500 ms'});
    set(gca,'FontSize',6);
    
end

figure(RThisttaskRel);
suptitle('histograms of RTs (taskRelevance sessions):');
saveas(RThisttaskRel, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_03_sub_taskRel.png'])
close(gcf)


%% plot averaga RTs per session 

averRThist = figure;
figure(averRThist)

sessionsNms = {'expectation', 'relevance'};

for cSess = 1:numel(sessionsNms)
currSession = char(sessionsNms(cSess));
    
currSession(1:3)

subplot(1,2,cSess)
hist(alldata.(currSession(1:3)).all.RT*1000, [0:50:1000])
set(gca,'XTick', [300 500 800]);
set(gca,'XTickLabel',{'300 ms','500 ms', '800 ms'});
set(gca,'FontSize',12);

title(currSession); % create tittle of hist. 
    xlim([300 800])
    ylim([0 10])
          
end

suptitle('histograms of average RTs by session:');

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_04_aver_session.png'])
close(gcf)

%% plot HRs and FARs

% expectation and taskRelevance togheter

mycolor = [0 0 0;0 0 1;1 0 0;0 1 0];
colormap(mycolor);
bar([alldata.exp.all.hr; alldata.exp.all.far; alldata.rel.all.hr; alldata.rel.all.far]');
set(gca,'FontSize',6);
xlim([0 21])
set(gca,'XTick',[1:20]);
h = legend('prediction HR', 'prediction FAR', 'task relevance HR', 'task relevance FAR');
set(h,'FontSize',9);

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/hr_far_01_sub_sess.png'])
close(gcf)

% EXPECTATION

mycolor = [0 0 0;0 0 1;1 0 0;0 1 0];
colormap(mycolor);
bar([alldata.exp.all.hr; alldata.exp.all.far]');
set(gca,'FontSize',6);
xlim([0 21])
set(gca,'XTick',[1:20]);
h = legend('prediction HR', 'prediction FAR');
set(h,'FontSize',9);

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/hr_far_02_sub_expectat.png'])
close(gcf)

% TASK RELEVANCE

mycolor = [0 0 0;0 0 1;1 0 0;0 1 0];
colormap(mycolor);
bar([alldata.rel.all.hr; alldata.rel.all.far]');
set(gca,'FontSize',6);
xlim([0 21])
set(gca,'XTick',[1:20]);
h = legend('task relevance HR', 'task relevance FAR');
set(h,'FontSize',9);

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/hr_far_03_sub_taskRel.png'])
close(gcf)


%% plot average HRs and FARs per session
colormap(summer(1))

avrg_hr_far = [mean(alldata.exp.all.hr) ...
    mean(alldata.exp.all.far) ...
    mean(alldata.rel.all.hr) ...
    mean(alldata.rel.all.far)]'*100

bar(avrg_hr_far )
xlab_nms = {'prediction HR', 'prediction FAR', 'taskRelevance HR', 'taskRelevance FAR'}
set(gca,'xticklabel',xlab_nms)
set(gca,'YTick', [0:5:100]);
set(gca,'FontSize',8);
xlim([0 5])
suptitle('average HR and FAR by session:');

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/hr_far_04_aver_sess.png'])
close(gcf)

%%
% % % % % %% compute cue duration, retention interval duration and target duration
% % % % % % accuracy of cue duration and retention interval seem excellent
% % % % % subjects = fields(logstruct);
% % % % % nSubj = numel(subjects);
% % % % % for cSubj = 1:nSubj;
% % % % %     durations.(subjects{cSubj}).cue_duration       = tabulate(-(round(1000*(logstruct.(subjects{cSubj}).cue_stop(4:end) - logstruct.(subjects{cSubj}).cue_start(4:end)))));
% % % % %     durations.(subjects{cSubj}).retention_duration = tabulate(-(round(1000*(logstruct.(subjects{cSubj}).stim_image_start(4:end) - logstruct.(subjects{cSubj}).cue_stop(4:end)))));
% % % % %     durations.(subjects{cSubj}).target_duration    = tabulate(-(round(1000*(logstruct.(subjects{cSubj}).stim_image_stop(4:end) - logstruct.(subjects{cSubj}).stim_image_start(4:end)))));
% % % % %     %durations.(subjects{cSubj}).cue_duration
% % % % % end
%%



