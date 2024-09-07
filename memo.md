## raindrop.io のブックマークを waybackpy でwebarchive化
ブックマークしたwebページが現時点で存在する(status code: 200)<br>
        archive.orgにそのページがすでに登録されている → do nothing<br>
        archive.orgに登録がない → 登録<br>
ブックマークしたwebページが現時点で存在しない(status code: 404)<br>
        archive.orgにそのページがすでに登録されている → そのページをブックマーク<br>
        archive.orgに登録がない → do nothing<br>
その他のstatus code → do nothing

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
```
