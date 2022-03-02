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
  - 切り取るエポックの秒数を記載
- scoutfunc 
  - https://neuroimage.usc.edu/brainstorm/Tutorials/Scouts#:~:text=Scout-,function,-We%20have%20extended
  - scoutごとに複数の電流源がまとめられるが、そのまとめ方を指定する
  - 1はmean, 3はPCA
- isnorm
  - minimum norm current amplitudesはダイポールの向きで正負がつく
  - そのため、絶対値を返すかそのままソース値を返すかを選ぶ必要がある
  - 0の場合、ファイルに保存されているソース値を返す
  - 1の場合、絶対値（制約付き）または3つの方向のノルム（制約なし）を返す
    - おそらく絶対値を返す？ 
- scouts = 
  - 使用する標本を選ぶ
  - 'Desikan-Killiany'を当研究室では用いる
### 処理の中身
1. matrixフォルダを作成する
  - すでにあるmatrixフォルダは削除される
2. 各subjectNameに以下の処理を行う
  1. ファイルの読み込み
  2. 指定した秒数ごとにepochを切り取る
  3. 切り出したepochにタグをつける
  4. head　modelを計算
    - https://neuroimage.usc.edu/brainstorm/Tutorials/HeadModel
  5. センサーノイズの推定（共分散行列）
    - https://neuroimage.usc.edu/brainstorm/Tutorials/NoiseCovariance
  6. 電流源推定
  7. Scoutに当てはめ
  8. Phase locking valueの計算?
    - 
  9. アーティファクトの除去？
    - Snapshot: Sensors/MRI registration
4. 保存



