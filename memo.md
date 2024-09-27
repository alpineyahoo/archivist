## raindrop.io のブックマークを waybackpy でwebarchive化
- ブックマークしたwebページが現時点で存在する(status code: 200)
    - archive.orgにそのページがすでに登録されている → do nothing
    - archive.orgに登録がない → 登録
- ブックマークしたwebページが現時点で存在しない(status code: 404)
    - archive.orgにそのページがすでに登録されている → そのページをブックマーク
    - archive.orgに登録がない → do nothing
- その他のstatus code → do nothing

## コードブロック
```sh
curl -sLI $URL -o /dev/null -w '%{http_code}\n'
$URL: httpbin.org/status/200 # 帰り値: 200
      httpbin.org/status/404 # 404
      httpbin.org/status/418 # 418
      httpie.io/hello # 200
      example.com # 200
      google.com # 200
      qiita.com/nunulk/items/fae163ce7977821f4448 # 404
      $(pbpaste) # ?

waybbackpy -u $URL -n 2> /dev/null | grep http

$URL, 帰り値, $?

      google.com
      https://web.archive.org/web/XXX/https://www.google.com/
      0

      foobarhogehoge.com
      帰り値なし
      1

wc -l < $raindrop_csv_file | tr -d ' ' # 行数カウント
sed -n 100,110p $raindrop_csv_file | cut -d, -f5 # 100行目から110行目までを抜き出し、url項目だけを表示
num=38697 && bc -e "$num/10; $num%10" # ブックマーク合計数を10で割った商と余り
sort -u file.csv | sponge file.csv
```
