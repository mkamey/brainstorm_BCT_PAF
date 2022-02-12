% Ver2.0 (01-Dec-2021)
mode = 'PLI'  % or 'DBWPLI'
SubjectNames = {'01','02'};   % replace 01,02, ... to proper subject names
sitindent = [n,m]             % identifier in file name ( from n-th character to m-th character, replace n and m to the number ). Not file type.
bands = {'delta', '2, 4', 'mean'; 'theta', '4, 8', 'mean'; 'alpha', '8, 13', 'mean'; 'beta', '13, 30', 'mean'; 'gamma', '30, 60', 'mean'};
espan = 5      % epoch time
scoutfunc = 3  % 1:mean 3:PCA
isnorm = 1     % 0:constrained 1:unconstrained

% Process: Scouts time series: [28 scouts] scouts = {'Brodmann', {'BA1_exvivo L', 'BA1_exvivo R', 'BA2_exvivo L', 'BA2_exvivo R', 'BA3a_exvivo L', 'BA3a_exvivo R', 'BA3b_exvivo L', 'BA3b_exvivo R', 'BA44_exvivo L', 'BA44_exvivo R', 'BA45_exvivo L', 'BA45_exvivo R', 'BA4a_exvivo L', 'BA4a_exvivo R', 'BA4p_exvivo L', 'BA4p_exvivo R', 'BA6_exvivo L', 'BA6_exvivo R', 'MT_exvivo L', 'MT_exvivo R', 'V1_exvivo L', 'V1_exvivo R', 'V2_exvivo L', 'V2_exvivo R', 'entorhinal_exvivo L', 'entorhinal_exvivo R', 'perirhinal_exvivo L', 'perirhinal_exvivo R'}}
% Process: Scouts time series: [62 scouts] scouts = {'Mindboggle6', {'caudalanteriorcingulate L', 'caudalanteriorcingulate R', 'caudalmiddlefrontal L', 'caudalmiddlefrontal R', 'cuneus L', 'cuneus R', 'entorhinal L', 'entorhinal R', 'fusiform L', 'fusiform R', 'inferiorparietal L', 'inferiorparietal R', 'inferiortemporal L', 'inferiortemporal R', 'insula L', 'insula R', 'isthmuscingulate L', 'isthmuscingulate R', 'lateraloccipital L', 'lateraloccipital R', 'lateralorbitofrontal L', 'lateralorbitofrontal R', 'lingual L', 'lingual R', 'medialorbitofrontal L', 'medialorbitofrontal R', 'middletemporal L', 'middletemporal R', 'paracentral L', 'paracentral R', 'parahippocampal L', 'parahippocampal R', 'parsopercularis L', 'parsopercularis R', 'parsorbitalis L', 'parsorbitalis R', 'parstriangularis L', 'parstriangularis R', 'pericalcarine L', 'pericalcarine R', 'postcentral L', 'postcentral R', 'posteriorcingulate L', 'posteriorcingulate R', 'precentral L', 'precentral R', 'precuneus L', 'precuneus R', 'rostralanteriorcingulate L', 'rostralanteriorcingulate R', 'rostralmiddlefrontal L', 'rostralmiddlefrontal R', 'superiorfrontal L', 'superiorfrontal R', 'superiorparietal L', 'superiorparietal R', 'superiortemporal L', 'superiortemporal R', 'supramarginal L', 'supramarginal R', 'transversetemporal L', 'transversetemporal R'}}
% Process: Scouts time series: [68 scouts]
scouts = {'Desikan-Killiany', {'bankssts L', 'bankssts R', 'caudalanteriorcingulate L', 'caudalanteriorcingulate R', 'caudalmiddlefrontal L', 'caudalmiddlefrontal R', 'cuneus L', 'cuneus R', 'entorhinal L', 'entorhinal R', 'frontalpole L', 'frontalpole R', 'fusiform L', 'fusiform R', 'inferiorparietal L', 'inferiorparietal R', 'inferiortemporal L', 'inferiortemporal R', 'insula L', 'insula R', 'isthmuscingulate L', 'isthmuscingulate R', 'lateraloccipital L', 'lateraloccipital R', 'lateralorbitofrontal L', 'lateralorbitofrontal R', 'lingual L', 'lingual R', 'medialorbitofrontal L', 'medialorbitofrontal R', 'middletemporal L', 'middletemporal R', 'paracentral L', 'paracentral R', 'parahippocampal L', 'parahippocampal R', 'parsopercularis L', 'parsopercularis R', 'parsorbitalis L', 'parsorbitalis R', 'parstriangularis L', 'parstriangularis R', 'pericalcarine L', 'pericalcarine R', 'postcentral L', 'postcentral R', 'posteriorcingulate L', 'posteriorcingulate R', 'precentral L', 'precentral R', 'precuneus L', 'precuneus R', 'rostralanteriorcingulate L', 'rostralanteriorcingulate R', 'rostralmiddlefrontal L', 'rostralmiddlefrontal R', 'superiorfrontal L', 'superiorfrontal R', 'superiorparietal L', 'superiorparietal R', 'superiortemporal L', 'superiortemporal R', 'supramarginal L', 'supramarginal R', 'temporalpole L', 'temporalpole R', 'transversetemporal L', 'transversetemporal R'}}
% Process: Scouts time series: [148 scouts] scouts = {'Destrieux', {'G&S_cingul-Ant L', 'G&S_cingul-Ant R', 'G&S_cingul-Mid-Ant L', 'G&S_cingul-Mid-Ant R', 'G&S_cingul-Mid-Post L', 'G&S_cingul-Mid-Post R', 'G&S_frontomargin L', 'G&S_frontomargin R', 'G&S_occipital_inf L', 'G&S_occipital_inf R', 'G&S_paracentral L', 'G&S_paracentral R', 'G&S_subcentral L', 'G&S_subcentral R', 'G&S_transv_frontopol L', 'G&S_transv_frontopol R', 'G_Ins_lg&S_cent_ins L', 'G_Ins_lg&S_cent_ins R', 'G_cingul-Post-dorsal L', 'G_cingul-Post-dorsal R', 'G_cingul-Post-ventral L', 'G_cingul-Post-ventral R', 'G_cuneus L', 'G_cuneus R', 'G_front_inf-Opercular L', 'G_front_inf-Opercular R', 'G_front_inf-Orbital L', 'G_front_inf-Orbital R', 'G_front_inf-Triangul L', 'G_front_inf-Triangul R', 'G_front_middle L', 'G_front_middle R', 'G_front_sup L', 'G_front_sup R', 'G_insular_short L', 'G_insular_short R', 'G_oc-temp_lat-fusifor L', 'G_oc-temp_lat-fusifor R', 'G_oc-temp_med-Lingual L', 'G_oc-temp_med-Lingual R', 'G_oc-temp_med-Parahip L', 'G_oc-temp_med-Parahip R', 'G_occipital_middle L', 'G_occipital_middle R', 'G_occipital_sup L', 'G_occipital_sup R', 'G_orbital L', 'G_orbital R', 'G_pariet_inf-Angular L', 'G_pariet_inf-Angular R', 'G_pariet_inf-Supramar L', 'G_pariet_inf-Supramar R', 'G_parietal_sup L', 'G_parietal_sup R', 'G_postcentral L', 'G_postcentral R', 'G_precentral L', 'G_precentral R', 'G_precuneus L', 'G_precuneus R', 'G_rectus L', 'G_rectus R', 'G_subcallosal L', 'G_subcallosal R', 'G_temp_sup-G_T_transv L', 'G_temp_sup-G_T_transv R', 'G_temp_sup-Lateral L', 'G_temp_sup-Lateral R', 'G_temp_sup-Plan_polar L', 'G_temp_sup-Plan_polar R', 'G_temp_sup-Plan_tempo L', 'G_temp_sup-Plan_tempo R', 'G_temporal_inf L', 'G_temporal_inf R', 'G_temporal_middle L', 'G_temporal_middle R', 'Lat_Fis-ant-Horizont L', 'Lat_Fis-ant-Horizont R', 'Lat_Fis-ant-Vertical L', 'Lat_Fis-ant-Vertical R', 'Lat_Fis-post L', 'Lat_Fis-post R', 'Pole_occipital L', 'Pole_occipital R', 'Pole_temporal L', 'Pole_temporal R', 'S_calcarine L', 'S_calcarine R', 'S_central L', 'S_central R', 'S_cingul-Marginalis L', 'S_cingul-Marginalis R', 'S_circular_insula_ant L', 'S_circular_insula_ant R', 'S_circular_insula_inf L', 'S_circular_insula_inf R', 'S_circular_insula_sup L', 'S_circular_insula_sup R', 'S_collat_transv_ant L', 'S_collat_transv_ant R', 'S_collat_transv_post L', 'S_collat_transv_post R', 'S_front_inf L', 'S_front_inf R', 'S_front_middle L', 'S_front_middle R', 'S_front_sup L', 'S_front_sup R', 'S_interm_prim-Jensen L', 'S_interm_prim-Jensen R', 'S_intrapariet&P_trans L', 'S_intrapariet&P_trans R', 'S_oc-temp_lat L', 'S_oc-temp_lat R', 'S_oc-temp_med&Lingual L', 'S_oc-temp_med&Lingual R', 'S_oc_middle&Lunatus L', 'S_oc_middle&Lunatus R', 'S_oc_sup&transversal L', 'S_oc_sup&transversal R', 'S_occipital_ant L', 'S_occipital_ant R', 'S_orbital-H_Shaped L', 'S_orbital-H_Shaped R', 'S_orbital_lateral L', 'S_orbital_lateral R', 'S_orbital_med-olfact L', 'S_orbital_med-olfact R', 'S_parieto_occipital L', 'S_parieto_occipital R', 'S_pericallosal L', 'S_pericallosal R', 'S_postcentral L', 'S_postcentral R', 'S_precentral-inf-part L', 'S_precentral-inf-part R', 'S_precentral-sup-part L', 'S_precentral-sup-part R', 'S_suborbital L', 'S_suborbital R', 'S_subparietal L', 'S_subparietal R', 'S_temporal_inf L', 'S_temporal_inf R', 'S_temporal_sup L', 'S_temporal_sup R', 'S_temporal_transverse L', 'S_temporal_transverse R'}}

% ----------------------- modify above variables ---------------------------

if exist('matrix','dir'); rmdir 'matrix' s; end;
if ~exist('matrix','dir'); mkdir('matrix'); end;

% Start a new report
sFiles = {};
bst_report('Start', sFiles);
N = numel(SubjectNames);
for I = 1:N
    % Process: Select data files in: SubjectNames[] % select band tag
    sFiles = bst_process('CallProcess', 'process_select_files_data', sFiles, [], ...
        'subjectname',   SubjectNames{I}, ...
        'condition',     '', ...
        'tag',           'band', ...
        'includebad',    0, ...
        'includeintra',  0, ...
        'includecommon', 0);

    % Process: Import MEG/EEG: Time　% epoching with espan second
    sFiles = bst_process('CallProcess', 'process_import_data_time', sFiles, [], ...
        'subjectname', SubjectNames{I}, ...
        'condition',   '', ...
        'timewindow',  [], ...
        'split',       espan, ...
        'ignoreshort', 1, ...
        'usectfcomp',  1, ...
        'usessp',      1, ...
        'freq',        [], ...
        'baseline',    []);

    % Process: Add tag: epochs
    sFiles = bst_process('CallProcess', 'process_add_tag', sFiles, [], ...
        'tag',           'epoch', ...
        'output',        1);  % Add to comment

    % Process: Compute head model
    sFiles = bst_process('CallProcess', 'process_headmodel', sFiles, [], ...
        'Comment',     '', ...
        'sourcespace', 1, ...  % Cortex surface
        'volumegrid',  struct(...
             'Method',        'isotropic', ...
             'nLayers',       17, ...
             'Reduction',     3, ...
             'nVerticesInit', 4000, ...
             'Resolution',    0.005, ...
             'FileName',      ''), ...
        'meg',         3, ...  % Overlapping spheres
        'eeg',         3, ...  % OpenMEEG BEM
        'ecog',        2, ...  % OpenMEEG BEM
        'seeg',        2, ...  % OpenMEEG BEM
        'openmeeg',    struct(...
             'BemFiles',     {{}}, ...
             'BemNames',     {{'Scalp', 'Skull', 'Brain'}}, ...
             'BemCond',      [1, 0.0125, 1], ...
             'BemSelect',    [1, 1, 1], ...
             'isAdjoint',    0, ...
             'isAdaptative', 1, ...
             'isSplit',      0, ...
             'SplitLength',  4000));

    % Process: Compute covariance (noise or data)
    sFiles = bst_process('CallProcess', 'process_noisecov', sFiles, [], ...
        'baseline',       [0, 189.998], ...
        'datatimewindow', [0, 189.998], ...
        'sensortypes',    'MEG, EEG, SEEG, ECOG', ...
        'target',         1, ...  % Noise covariance     (covariance over baseline time window)
        'dcoffset',       1, ...  % Block by block, to avoid effects of slow shifts in data
        'identity',       1, ...
        'copycond',       0, ...
        'copysubj',       0, ...
        'copymatch',      0, ...
        'replacefile',    1);  % Replace


    % Process: Compute sources [2018]
    sFiles = bst_process('CallProcess', 'process_inverse_2018', sFiles, [], ...
        'output',  1, ...  % Kernel only: shared
        'inverse', struct(...
             'Comment',        'MN: MEG+MEG ALL', ...
             'InverseMethod',  'minnorm', ...
             'InverseMeasure', 'amplitude', ...
             'SourceOrient',   {{'fixed'}}, ...
             'Loose',          0.2, ...
             'UseDepth',       1, ...
             'WeightExp',      0.5, ...
             'WeightLimit',    10, ...
             'NoiseMethod',    'reg', ...
             'NoiseReg',       0.1, ...
             'SnrMethod',      'fixed', ...
             'SnrRms',         1e-06, ...
             'SnrFixed',       3, ...
             'ComputeKernel',  1, ...
             'DataTypes',      {{'MEG', 'MEG GRAD', 'MEG MAG'}}));

    % Scout
    sFiles = bst_process('CallProcess', 'process_extract_scout', sFiles, [], ...
        'timewindow',     [], ...
        'scouts',         scouts, ...
        'scoutfunc',      scoutfunc, ...  % 1:mean 3:PCA
        'isflip',         1, ...
        'isnorm',         isnorm, ...  % 0:constrained 1:unconstrained
        'concatenate',    0, ...
        'save',           1, ...
        'addrowcomment',  1, ...
        'addfilecomment', 1);

    if strcmp(mode,'PLI')
        for b = 1:5
        % Process: Phase locking value NxN
        output = bst_process('CallProcess', 'process_plv1n', sFiles, [], ...
            'timewindow', [], ...
            'freqbands',  bands(b,1:3), ...
            'mirror',     0, ...
            'keeptime',   0, ...
            'plvmeasure', 2, ...  % Magnitude
            'outputmode', 1);  % Save individual results (one file per input file)
        n = size(output,2)
        j = 0
        for i = 1:n
            file = output(i).FileName
            load(file,'TF')
            if i==n | output(i).iStudy~=output(i+1).iStudy
                j = j + 1
                data(:,output(i).iItem) = TF
                grarr(:,j) = mean(data')'
                reparr(j) = i
                clearvars data
            else
                data(:,output(i).iItem) = TF
            end
        end
        for i = 1:j
            scnum = -1/2+sqrt(1+8*size(grarr(:,i),1))/2
            for r = 1:scnum
                mat(r,1:r) = grarr(r^2 / 2 - r / 2 +1:(r+1)^2 / 2 - (r+1) / 2 ,i)
            end
            mat = max(mat,mat')

            situation = extractBetween(output(reparr(i)).Condition,sitindent(1),sitindent(2))
            foldersitu = strcat('matrix/',situation)
            if ~exist(foldersitu{1},'dir'); mkdir(foldersitu{1}); end;
            folderband = strcat('matrix/',situation,'/',bands(b,1))
            if ~exist(folderband{1},'dir'); mkdir(folderband{1}); end;
            savename = strcat(folderband{1},'/', output(reparr(i)).Condition , '_' , bands(b,1))
            save(savename{1},'mat')
            clearvars mat
        end
        clearvars grarr
        end
        epochnumbers(I,:) = {output(1).SubjectName,reparr(i)}
    elseif strcmp(mode,'DBWPLI')
        % Process: Coherence NxN [Deprecated]
        
        iStudy = [sFiles.iStudy]
        uniS = unique(iStudy)
        n = size(uniS,2)
        for i = 1:n
            temp = sFiles(find(iStudy == uniS(i)))
            situation = extractBetween(temp(1).Condition,sitindent(1),sitindent(2))
            output = bst_process('CallProcess', 'process_cohere1n', temp, [], ...
                'timewindow',   [], ...
                'removeevoked', 0, ...
                'cohmeasure',   'icohere2019', ...  % Imaginary Coherence (2019)IC    = |imag(C)|
                'overlap',      50, ...
                'maxfreqres',   2, ...
                'maxfreq',      60, ...
                'outputmode',   3);  % Save average connectivity matrix (one file)
            file = output.FileName
            load(file,'TF')
            data = mean(TF(:,:,15:25),3)

            scnum = -1/2+sqrt(1+8*size(data(:,1),1))/2
            for r = 1:scnum
                mat(r,1:r) = data(r^2 / 2 - r / 2 +1:(r+1)^2 / 2 - (r+1) / 2 ,1)
            end
            mat = mat+mat'
            mat(isnan(mat))=0
            foldersitu = strcat('matrix/',situation)
            if ~exist(foldersitu{1},'dir'); mkdir(foldersitu{1}); end;
            savename = strcat(foldersitu{1},'/', temp(1).Condition,'_',mode)
            save(savename,'mat')
            clearvars mat
        end
    end
end
if strcmp(mode,'PLI'); save('matrix/epochnumbers','epochnumbers'); end;

% Process: Snapshot: Sensors/MRI registration
sFiles = bst_process('CallProcess', 'process_snapshot', sFiles, [], ...
    'target',         1, ...  % Sensors/MRI registration
    'modality',       1, ...  % MEG (All)
    'orient',         1, ...  % left
    'time',           0, ...
    'contact_time',   [0, 0.1], ...
    'contact_nimage', 12, ...
    'threshold',      30, ...
    'Comment',        '');

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);

clearvars