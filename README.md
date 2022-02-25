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
