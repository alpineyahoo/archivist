# collectionId: -1 は未整理フォルダの識別子
# ゴミ箱を除く全項目のコレクションの識別子は0
# $RAINDROP_TEST_TOKEN はユーザーが取得した自分用のraindrop test token, 事前に環境変数として設定しておく

auth="Authorization: Bearer $RAINDROP_TEST_TOKEN"
root='https://api.raindrop.io/rest/v1'

curl -s "$root/raindrops/-1?page=0&perpage=30" -H $auth | jq -r '.items[].link'
# 未整理フォルダの最初のページの30項目を取得し、そこからURLを取得
# pageクエリーは0 index(0から始まる)
curl -s "$root/user/stats" -H $auth | jq '.items[] | select(._id==-1) | .count'
# 未整理フォルダの項目数を表示
curl -s "$root/user/stats" -H $auth | jq '.items[] | select(._id==-1) | .count' | awk '{print $1"/30"}' | bc
# 全項目数を30で割った数が工程の繰り返し回数になる(1...x+1 または 0...x)
