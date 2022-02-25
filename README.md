# scripts

## grep_fasta
特定のシーケンス名を持った配列を抽出するスクリプト。検索したいシーケンス名（">"以降の文字列）をリスト化してください。
```
$ grep_fasta.sh input.fasta list.txt
```
## get-SNPs
ゲノムにリードをマッピングしてSNPをカウントするスクリプト

## 依存
- samtool
- bbtool

## Usage
```
$ . get_SNPs.sh ref.fa PE_R1.fq PE_R2.fq
```
## blastp_batch
- 複数のfastaファイルに対してblastpが実行されます。(dbは指定済)

## Usage
```
source blastp_batch.sh <input_dir>
```
- input_dir:複数のfastaファイルが格納されたディレクトリ
## Recursive_Pilon
**Pilonを使用したpolishingを再帰的に15回行うスクリプト**
## installation
```
#pilon==1.23をダウンロード（2020 1/30時点最新）
$ wget https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar

#実行権を付与
$ chmod u+x pilon-1.23.jar

$ pip install -r requirements.txt #condaでのinstallも可
```
## Usage
```
$ . Recur_Pilon.sh FASTA_file FASTQ_file1 FASTQ_file2
```
## Update予定
- thread数と再帰回数を指定可能にする(option化)
- 再帰回数を自動指定にする(polish箇所がなくなるまで再帰的に処理させる)

## 参考
- Pilon公式サイト  
http://software.broadinstitute.org/software/pilon/  
- 上坂一馬さんのサイト  
http://kazumaxneo.hatenablog.com/entry/2017/10/01/222036 
