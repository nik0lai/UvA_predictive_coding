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
        alldata.exp.all.fa(expcount)                = sum(data.rotation == 0   & data.key_resp_2_rt > 0);  % falsealarm rate
        alldata.exp.all.Ntarget(expcount)           = sum(data.rotation == 180);                           % target trials
        alldata.exp.all.Nnontarget(expcount)        = sum(data.rotation == 0);                             % non-target trials
        alldata.exp.all.Ntrials                     = sum(~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, ''));
        
         %%%%%%%%%% not same ammount of cued and noncued target trials
        % % %         % check proportion of cued and noncued target trials. 
        % % %         % check proportion of cued and noncued nontarget trials.
        % % %          
        % % %         alldata.exp.all.Ntarget                                                                                       % target trials 187 (.2011)
        % % %         alldata.exp.all.Nnontarget                                                                                    % nontarget trials 743 (.7989) 
        % % %         alldata.exp.all.Ntarget+alldata.exp.all.Nnontarget                                                            % all trials 930
        % % %          
        % % %         sum(strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, ''))           % cued trials    620
        % % %         sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, ''))          % noncued trials 310
        %%%%%%%%%%        
        
        % cued/noncued target trials
        alldata.exp.all.NcuedTarget(expcount)       = sum( strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ...
                                                          ~strcmp(data.prob_cue, '')            & data.rotation == 180); % cued target
        alldata.exp.all.NnoncuedTarget(expcount)    = sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ...
                                                          ~strcmp(data.prob_cue, '')            & data.rotation == 180); % noncued target
        
        % cued/noncued nontarget trials
        alldata.exp.all.NcuedNontarget(expcount)    = sum( strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                           data.rotation == 0); % cued target
        alldata.exp.all.NnoncuedNontarget(expcount) = sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                           data.rotation == 0); % noncued target
        
        % cued/noncued hitrates
        alldata.exp.all.NcuedHits(expcount)         = sum( strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                           data.rotation == 180 & data.key_resp_2_rt > 0);
        alldata.exp.all.NnoncuedHits(expcount)      = sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                           data.rotation == 180 & data.key_resp_2_rt > 0);
        % cued/noncued falsealarms
        alldata.exp.all.NcuedFa(expcount)           = sum( strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                           data.rotation == 0 & data.key_resp_2_rt > 0);  
        alldata.exp.all.NnoncuedFa(expcount)        = sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                           data.rotation == 0 & data.key_resp_2_rt > 0); 
        
        % average Cued hitrate
        alldata.exp.all.cuedHr(expcount)            = alldata.exp.all.NcuedHits(expcount)    / alldata.exp.all.NcuedTarget(expcount);
        % average nonCued hitrate
        alldata.exp.all.noncuedHr(expcount)         = alldata.exp.all.NnoncuedHits(expcount) / alldata.exp.all.NnoncuedTarget(expcount);
        % average Cued falsealarm rate
        alldata.exp.all.cuedFar(expcount)           = alldata.exp.all.NcuedFa(expcount)    / alldata.exp.all.NcuedNontarget(expcount);
        % average nonCued falsealarm rate
        alldata.exp.all.noncuedFar(expcount)        = alldata.exp.all.NnoncuedFa(expcount) / alldata.exp.all.NnoncuedNontarget(expcount);
                
        % average hitrate
        alldata.exp.all.hr(expcount)                = alldata.exp.all.hits(expcount) / alldata.exp.all.Ntarget(expcount);
        % average falsealarm rate
        alldata.exp.all.far(expcount)               = alldata.exp.all.fa(expcount)   / alldata.exp.all.Nnontarget(expcount);
        
        % by stimuli: face, house, letter
        for condition = 1:numel(conditions)
            cond = conditions{condition};
            alldata.exp.(cond).RT(expcount)             = mean(data.key_resp_2_rt(data.rotation == 180 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond))) + .1; % add .1 for 100 ms delay on key onset
            alldata.exp.(cond).hits(expcount)           = sum(data.rotation == 180 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond)); % hitrate
            alldata.exp.(cond).fa(expcount)             = sum(data.rotation == 0 & data.key_resp_2_rt > 0   & strcmp(data.stimulus, cond)); % falsealarm rate
            alldata.exp.(cond).Ntarget(expcount)        = sum(data.rotation == 180                          & strcmp(data.stimulus, cond)); % target trials
            alldata.exp.(cond).Nnontarget(expcount)     = sum(data.rotation == 0                            & strcmp(data.stimulus, cond)); % non-target trials
            alldata.exp.(cond).Ntrials                  = sum(~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & strcmp(data.stimulus, cond)); % ALL trials
  
            %%%%%%%%%%%%%%%%%%%%%%%%%
            % cued/noncued target trials
            alldata.exp.(cond).NcuedTarget(expcount)       = sum( strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                                  data.rotation == 180 & strcmp(data.stimulus, cond)); % cued target
            alldata.exp.(cond).NnoncuedTarget(expcount)    = sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                                  data.rotation == 180 & strcmp(data.stimulus, cond)); % noncued target
            % cued/noncued nontarget trials
            alldata.exp.(cond).NcuedNontarget(expcount)    = sum( strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                                  data.rotation == 0 & strcmp(data.stimulus, cond)); % cued target
            alldata.exp.(cond).NnoncuedNontarget(expcount) = sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                                  data.rotation == 0 & strcmp(data.stimulus, cond));% noncued target
            
            % cued/noncued hitrates
            alldata.exp.(cond).NcuedHits(expcount)      = sum( strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                               data.rotation == 180 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond));
            alldata.exp.(cond).NnoncuedHits(expcount)   = sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                               data.rotation == 180 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond));
            
            % cued/noncued falsealarms
            alldata.exp.(cond).NcuedFa(expcount)        = sum( strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                               data.rotation == 0 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond));
            alldata.exp.(cond).NnoncuedFa(expcount)     = sum(~strcmp(data.stimulus, data.prob_cue) & ~strcmp(data.stimulus, '') & ~strcmp(data.prob_cue, '') & ...
                                                               data.rotation == 0 & data.key_resp_2_rt > 0 & strcmp(data.stimulus, cond));
            
            % average Cued hitrate
            alldata.exp.(cond).cuedHr(expcount)            = alldata.exp.(cond).NcuedHits(expcount)    / alldata.exp.(cond).NcuedTarget(expcount);
            % average nonCued hitrate
            alldata.exp.(cond).noncuedHr(expcount)         = alldata.exp.(cond).NnoncuedHits(expcount) / alldata.exp.(cond).NnoncuedTarget(expcount);
            
            % average Cued falsealarm rate
            if alldata.exp.(cond).NcuedFa(expcount) == 0 && alldata.exp.(cond).fa(expcount) == 0;
                alldata.exp.(cond).cuedFar(expcount) = 0;
            else 
                alldata.exp.(cond).cuedFar(expcount) = alldata.exp.(cond).NcuedFa(expcount)    / alldata.exp.(cond).NcuedNontarget(expcount);
            end
            
            % average nonCued falsealarm rate
            if alldata.exp.(cond).NnoncuedFa(expcount) == 0 && alldata.exp.(cond).fa(expcount) == 0;
                alldata.exp.(cond).noncuedFar(expcount) = 0;
            else
                alldata.exp.(cond).noncuedFar(expcount) = alldata.exp.(cond).NnoncuedFa(expcount) / alldata.exp.(cond).NnoncuedNontarget(expcount);
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%   
                        
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
        alldata.rel.all.Ntrials                     = sum(~strcmp(data.stimulus, '') & ~strcmp(data.task_cue, ''));

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
            alldata.rel.(cond).Ntrials              = sum(~strcmp(data.stimulus, '') & ~strcmp(data.task_cue, '') & strcmp(data.stimulus, cond)); % ALL trials
                                 
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
    ylim([0 85]);
    
    set(gca,'YTick',[0:20:90]);
    set(gca,'XTick',[0 500 1000 1500]);
    set(gca,'XTickLabel',{'0 ms','500 ms', '1000 ms', '1500 ms'});
    set(gca,'FontSize',6);
    
end

figure(RThist);
suptitle('histograms of RTs:');

saveas(RThist, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_01_all.png'])
close(gcf)

%%
clearvars -EXCEPT logstruct alldata master_working_folder

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
    ylim([0 85]);
    
    set(gca,'XTick',[0 500 1000 1500]);
    set(gca,'XTickLabel',{'0 ms','500 ms', '1000 ms', '1500 ms'});
    set(gca,'FontSize',6);
    
end

figure(RThistExpectat);
suptitle('histograms of RTs (expectation sessions):');
saveas(RThistExpectat, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_02_expectation.png'])
close(gcf)

%%
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
    ylim([0 85]);
    
    set(gca,'XTick',[0 500 1000 1500]);
    set(gca,'XTickLabel',{'0 ms','500 ms', '1000 ms', '1500 ms'});
    set(gca,'FontSize',6);
    
end

figure(RThisttaskRel);
suptitle('histograms of RTs (taskRelevance sessions):');
saveas(RThisttaskRel, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_03_taskRelevance.png'])
close(gcf)

%%
% Expectation cued/noncued TARGET trials

subjects            = fields(logstruct); % get session names
nSubj               = numel(subjects);   % number of sessions
RThistExpectatCues  = figure;            % create canvas to plot RTs

index_expectat      = find(~cellfun(@isempty,strfind(fields(logstruct), 'expectation'))); % get expectation sessions index

% first loop in uneven numbers from 1 to 20
uneven = 1:2:40;

for cSubjExp = 1:nSubj/2;
    
    % get cued and noncued target trials index
    cuedTarget_index        = strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, logstruct.(subjects{index_expectat(cSubjExp)}).prob_cue) & ... % cued trials
        ~strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, '') & logstruct.(subjects{index_expectat(cSubjExp)}).rotation == 180; % target trials
    
    nonCuedTarget_index     = ~strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, logstruct.(subjects{index_expectat(cSubjExp)}).prob_cue) & ... % non cued trials
        ~strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, '') & logstruct.(subjects{index_expectat(cSubjExp)}).rotation == 180; % target trials

    ind_und = strfind(subjects{index_expectat(cSubjExp)},'_'); % separators index
    
    % fig again
    figure(RThistExpectatCues);
    
    % plot cued
    subplot(floor(sqrt(nSubj)), ceil(sqrt(nSubj)), uneven(cSubjExp)); % create a grid for plots
    % plot cued target trials RTs
    hist((logstruct.(subjects{index_expectat(cSubjExp)}).key_resp_2_rt(cuedTarget_index)*1000)+100, [0:50:1500]);
    title([subjects{index_expectat(cSubjExp)}(1:ind_und(1)-1) ' cued'])
    xlim([0 1500]);
    ylim([0 55]);
    set(gca,'YTick',[0 10 20 30 40 50]);
    set(gca,'XTickLabel',{'0ms','500ms', '1000ms', '1500ms'});
    set(gca,'FontSize',5);
    
    figure(RThistExpectatCues);
    
    % plot non cued
    subplot(floor(sqrt(nSubj)), ceil(sqrt(nSubj)), uneven(cSubjExp)+1); % create a grid for plots
    % plot cued target trials RTs
    hist((logstruct.(subjects{index_expectat(cSubjExp)}).key_resp_2_rt(nonCuedTarget_index)*1000)+100, [0:50:1500]);
    title([subjects{index_expectat(cSubjExp)}(1:ind_und(1)-1) ' nonCued'])
    xlim([0 1500]);
    ylim([0 55]);
    set(gca,'YTick',[0 10 20 30 40 50]);
    set(gca,'XTickLabel',{'0ms','500ms', '1000ms', '1500ms'});
    set(gca,'FontSize',5);
        
end

figure(RThistExpectatCues);
suptitle('histograms of RTs, cued and non cued Target trials:');
saveas(RThistExpectatCues, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_05_exptatCuesTarget.png'])
close(gcf)

%% 
% expectation cued/noncued TARGET trials by stimuli (face, house, letter)

subjects            = fields(logstruct); % get session names
nSubj               = numel(subjects);   % number of sessions
index_expectat      = find(~cellfun(@isempty,strfind(fields(logstruct), 'expectation'))); % get expectation sessions index

uneven              = 1:2:40; % first loop in uneven numbers from 1 to 20

stimuli = {'face' 'house' 'letter'};

for cStim = 1:numel(stimuli)
    
    figure; % canvas
    
    for cSubjExp = 1:nSubj/2;
        
        % get cued and noncued target trials index
        cuedTarget_index    = strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, logstruct.(subjects{index_expectat(cSubjExp)}).prob_cue) & ... % cued trials
            ~strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, '') & logstruct.(subjects{index_expectat(cSubjExp)}).rotation == 180 & ... % target trials
             strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, stimuli{cStim}); % stimuli trial
        
        nonCuedTarget_index = ~strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, logstruct.(subjects{index_expectat(cSubjExp)}).prob_cue) & ... % non cued trials
            ~strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, '') & logstruct.(subjects{index_expectat(cSubjExp)}).rotation == 180 & ... % target trials
             strcmp(logstruct.(subjects{index_expectat(cSubjExp)}).stimulus, stimuli{cStim}); % stimuli trial
                
        ind_und = strfind(subjects{index_expectat(cSubjExp)},'_'); % separators index
        
        % fig again
%         figure(RThistExpectatCues);
        
        % plot cued
        subplot(floor(sqrt(nSubj)), ceil(sqrt(nSubj)), uneven(cSubjExp)); % create a grid for plots
        % plot cued target trials RTs
        hist((logstruct.(subjects{index_expectat(cSubjExp)}).key_resp_2_rt(cuedTarget_index)*1000)+100, [0:50:1500]);
        title([subjects{index_expectat(cSubjExp)}(1:ind_und(1)-1) ' cued'])
        xlim([0 1500]);
        ylim([0 25]);
        set(gca,'YTick',[0:5:20]);
        set(gca,'XTickLabel',{'0ms','500ms', '1000ms', '1500ms'});
        set(gca,'FontSize',5);
        
%         figure(RThistExpectatCues);
        
        % plot non cued
        subplot(floor(sqrt(nSubj)), ceil(sqrt(nSubj)), uneven(cSubjExp)+1); % create a grid for plots
        % plot cued target trials RTs
        hist((logstruct.(subjects{index_expectat(cSubjExp)}).key_resp_2_rt(nonCuedTarget_index)*1000)+100, [0:50:1500]);
        title([subjects{index_expectat(cSubjExp)}(1:ind_und(1)-1) ' nonCued'])
        xlim([0 1500]);
        ylim([0 25]);
        set(gca,'YTick',[0:5:20]);
        set(gca,'XTickLabel',{'0ms','500ms', '1000ms', '1500ms'});
        set(gca,'FontSize',5);
        
    end
       
    suptitle(['RTs hist, cued and non cued Target trials (' stimuli{cStim} '):']);
    
    fileName = [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_06_0' num2str(cStim) '_' stimuli{cStim} '_exptatCuesTarget.png'];
    
    saveas(gcf, fileName);
    close(gcf)
    
end

%%
clearvars -EXCEPT logstruct alldata master_working_folder

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
    ylabel('Number of participants')
          
end

suptitle('histograms of average RTs by session:');

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/RTs_04_aver_session.png'])
close(gcf)

%%
clearvars -EXCEPT logstruct alldata master_working_folder

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
suptitle('hit rate and false alarm rate by session type:');

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/HR_FAR_01_all.png'])
close(gcf)

%%
% EXPECTATION

mycolor = [0 0 0;0 0 1;1 0 0;0 1 0];
colormap(mycolor);
bar([alldata.exp.all.hr; alldata.exp.all.far]');
set(gca,'FontSize',6);
xlim([0 21])
set(gca,'XTick',[1:20]);
h = legend('prediction HR', 'prediction FAR');
set(h,'FontSize',9);
suptitle('hit rate and false alarm rate in expectation task:');

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/HR_FAR_02_expectation.png'])
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
suptitle('hit rate and false alarm rate in task relevance:');

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/HR_FAR_03_taskRelevance.png'])
close(gcf)

%%
clearvars -EXCEPT logstruct alldata master_working_folder

%% plot average HRs and FARs per session

colormap(summer(1))

avrg_hr_far = [mean(alldata.exp.all.hr) ...
    mean(alldata.exp.all.far) ...
    mean(alldata.rel.all.hr) ...
    mean(alldata.rel.all.far)]'*100;

bar(avrg_hr_far )
xlab_nms = {'prediction HR', 'prediction FAR', 'taskRelevance HR', 'taskRelevance FAR'}
set(gca,'xticklabel',xlab_nms)
set(gca,'YTick', [0:5:100]);
set(gca,'FontSize',8);
xlim([0 5])
suptitle('average HR and FAR by session:');

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/HR_FAR_04_avrg_allSessions.png'])
close(gcf)

%% average HRs and FARs in prediction task by cued/not-cued trial

% number of cued/noncued target and nonTarget trials
cuesTargetsFig = figure;
figure(cuesTargetsFig);

colormap(lines(4))
% cued and noncued target trials
bar([alldata.exp.all.NcuedTarget; alldata.exp.all.NnoncuedTarget; alldata.exp.all.NcuedNontarget; alldata.exp.all.NnoncuedNontarget]')
% set(gca,'YTick', [0:5:100]);
set(gca,'FontSize',12);
xlim([0 21])
suptitle('Cued and non-cued target and non-target trials:');
h = legend('cuedTarget', 'noncuedTarget', 'cuedNontarget', 'noncuedNontarget');
set(h,'FontSize',8);

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/cuesTargets_all.png'])
close(gcf)

%%
% avrg cued and noncued HR and Far
cuesHrFarFig = figure;
figure(cuesHrFarFig)

bar([mean(alldata.exp.all.cuedHr) ...
                    mean(alldata.exp.all.noncuedHr) ...
                    mean(alldata.exp.all.cuedFar) ...
                    mean(alldata.exp.all.noncuedFar)]'*100)
xlim([0 5]);
ylim([0 100]);
xlab_nms = {'cued HR', 'noncued HR', 'cued FAR', 'noncued FAR'};
set(gca,'xticklabel',xlab_nms)
set(gca,'YTick', [0:5:100]);
set(gca,'FontSize',10);
suptitle('average HR and FAR by cue presence in Expectation session:');

saveas(gcf, [master_working_folder 'Predictive_EEG/BEHAVIOR/HR_FAR_05_cuedNoncued_exp.png'])
close(gcf)

%% avrg cued and noncued HR and FAR by stimuli (face, house, letter)

stimuli = {'face' 'house' 'letter'};

for cStim = 1:numel(stimuli)

figure; % canvas

% avrgs
stimAvrgs = [mean(alldata.exp.(stimuli{cStim}).cuedHr) ...
    mean(alldata.exp.(stimuli{cStim}).noncuedHr) ...
    mean(alldata.exp.(stimuli{cStim}).cuedFar) ...
    mean(alldata.exp.(stimuli{cStim}).noncuedFar)]'*100;

bar(stimAvrgs) % plot avrgs
xlim([0 5]);
ylim([0 100]);

xlab_nms = {'cued HR', 'noncued HR', 'cued FAR', 'noncued FAR'};
set(gca,'xticklabel',xlab_nms)
set(gca,'YTick', [0:5:100]);
set(gca,'FontSize',10);
suptitle(['avrg HR and FAR by cue presence, Expectation session (' stimuli{cStim} '):']);

file_name = [master_working_folder 'Predictive_EEG/BEHAVIOR/HR_FAR_06_0' num2str(cStim) '_' stimuli{cStim} '_cuedNoncued_exp.png'];
saveas(gcf, file_name)
close(gcf)

end

%%
clearvars -EXCEPT logstruct alldata master_working_folder

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
%% CHECK COUNT OF TRIALS PER STIMULI, TARGET/NONTARGET, CUE

total_face = sum(alldata.exp.face.Ntarget + alldata.exp.face.Nnontarget) % 6186
total_house = sum(alldata.exp.house.Ntarget + alldata.exp.house.Nnontarget) % 6214
total_letter = sum(alldata.exp.letter.Ntarget + alldata.exp.letter.Nnontarget) % 6200

sum(total_face + total_house + total_letter) == sum(alldata.exp.all.Ntarget + alldata.exp.all.Nnontarget)

% index of target and nontarget items
targetItemIndex = strcmp(logstruct.S01_01_expectation.expectation_target, '1') & logstruct.S01_01_expectation.rotation == 180
nontargetItemIndex = strcmp(logstruct.S01_01_expectation.expectation_target, 'None') & logstruct.S01_01_expectation.rotation == 0

% contingency tables of target and nontarget items (outputs do not have the same order)
% % % [~, ~, ~, labels] = crosstab(logstruct.S01_01_expectation.stimulus, logstruct.S01_01_expectation.prob_cue)
% % % [~, ~, ~, labels] = crosstab(logstruct.S01_01_expectation.stimulus(targetItemIndex), logstruct.S01_01_expectation.prob_cue(targetItemIndex))
% % % [~, ~, ~, labels] = crosstab(logstruct.S01_01_expectation.stimulus(nontargetItemIndex), logstruct.S01_01_expectation.prob_cue(nontargetItemIndex))

stimuli = {'face' 'house' 'letter'};
cues = {'face' 'house' 'letter'};
nTrials = zeros(numel(stimuli), numel(cues));
% participant_session loop
% target nontarget loop
subjects    = fields(logstruct); % get session names
nSubj       = numel(subjects);   % number of sessions


for cSubj = 1:nSubj;
    
    for cStim = 1:numel(stimuli)
        for cCue = 1:numel(cues)
            nTrials(cStim,cCue) = sum(strcmp(logstruct.S01_01_expectation.stimulus, stimuli{cStim}) & strcmp(logstruct.S01_01_expectation.prob_cue, cues{cCue}));
        end
    end
end
% % % % % face_face       = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'face') & strcmp(logstruct.S01_01_expectation.prob_cue, 'face'))
% % % % % face_house      = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'face') & strcmp(logstruct.S01_01_expectation.prob_cue, 'house'))
% % % % % face_letter     = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'face') & strcmp(logstruct.S01_01_expectation.prob_cue, 'letter'))
% % % % % 
% % % % % house_house     = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'house') & strcmp(logstruct.S01_01_expectation.prob_cue, 'house'))
% % % % % house_face      = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'house') & strcmp(logstruct.S01_01_expectation.prob_cue, 'face'))
% % % % % house_letter    = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'house') & strcmp(logstruct.S01_01_expectation.prob_cue, 'letter'))
% % % % % 
% % % % % letter_letter   = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'letter') & strcmp(logstruct.S01_01_expectation.prob_cue, 'letter'))
% % % % % letter_face     = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'letter') & strcmp(logstruct.S01_01_expectation.prob_cue, 'face'))
% % % % % letter_house    = sum(strcmp(logstruct.S01_01_expectation.stimulus, 'letter') & strcmp(logstruct.S01_01_expectation.prob_cue, 'house'))

% target and nontarget trials
[face_face face_house face_letter; house_face house_house house_letter; letter_face letter_house letter_letter]

