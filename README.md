# brainstorm_BCT

beforeRemove.m -> afterRemove.m


## beforeRemove.m
### 用意するパラメータ
-  subjectname
  -  
-  bad channels
  - bad channelsを記載 
### 処理の中身
- bad channelsのセッティング
- ２５０Hzでローパスフィルタを適用
- ５００Hzにリサンプリング
- 60Hz 120Hz 180Hzのそれぞれにノッチフィルタを適用
- 0.5Hz-100Hzにバンドパスフィルタを適用
- infomax法によるICA
  - https://neuroimage.usc.edu/brainstorm/Tutorials/Epilepsy#Artifact_cleaning_with_ICA
- 保存

## afterRemove.m
### 用意するパラメータ
-  mode
  - PLIかDBWPLIか
  -  DBWPLIの詳細：
-  subjectname
-  sitindent  = [n,m]  
  - ファイル名の識別子（詳細を聞く）
  - n,mには数字が入る
- bands 
  - delta, theta, alpha, beta, gammaとするそれぞれの帯域の周波数を記載する
  - 'mean'は何を表していますか？ 
- espan
  - 切り取るエポックの

### 処理の中身



% Ver2.0 (01-Dec-2021)
mode = 'PLI'  % or 'DBWPLI'
SubjectNames = {'01','02'};   % replace 01,02, ... to proper subject names
sitindent = [n,m]             % identifier in file name ( from n-th character to m-th character, replace n and m to the number ). Not file type.
bands = {'delta', '2, 4', 'mean'; 'theta', '4, 8', 'mean'; 'alpha', '8, 13', 'mean'; 'beta', '13, 30', 'mean'; 'gamma', '30, 60', 'mean'};
espan = 5      % epoch time
scoutfunc = 3  % 1:mean 3:PCA
isnorm = 1     % 0:constrained 1:unconstrained
