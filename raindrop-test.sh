# collectionId: -1 は未整理フォルダの識別子
# ゴミ箱を除く全項目のコレクションの識別子は0
# $RAINDROP_TEST_TOKEN はユーザーが取得した自分用のraindrop test token, 事前に環境変数として設定しておく

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
auth="Authorization: Bearer $RAINDROP_TEST_TOKEN"
root='https://api.raindrop.io/rest/v1'

curl -s "$root/raindrops/-1?page=0&perpage=30" -H $auth | jq -r '.items[].link'
# 未整理フォルダの最初のページの30項目を取得し、そこからURLを取得
# pageクエリーは0 index(0から始まる)

get_link | grep -vFf $ARCHIVIST_IGNORE_URL_FILE # ignore.conf ファイルに記載されたURL(ドメイン)は対象としない

curl -sL "https://archive.org/wayback/available?url=foobar.com/article.html" | jq -e '.archived_snapshots.closest.available' > /dev/null
# stdout は true または null なので、-e オプション(exit status)をつけると $?(終了ステータス) は 0(true) or 1(null)
curl -sL "https://archive.org/wayback/available?url=foobar.com/article.html" | jq -r '.archived_snapshots.closest.available // "null"'
# 別の書き方. null は文字列として出力される

curl -s "$root/user/stats" -H $auth | jq '.items[] | select(._id==-1) | .count'
# 未整理フォルダの項目数を表示

curl -s "$root/user/stats" -H $auth | jq '.items[] | select(._id==-1) | .count' | awk '{print $1"/30"}' | bc
# 全項目数を30で割った数が工程の繰り返し回数になる(1...x+1 または 0...x)
