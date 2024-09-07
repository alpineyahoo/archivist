## raindrop.io のブックマークを waybackpy でwebarchive化
ブックマークしたwebページが現時点で存在する(status code: 200)
        archive.orgにそのページがすでに登録されている → do nothing
        archive.orgに登録がない → 登録
ブックマークしたwebページが現時点で存在しない(status code: 404)
        archive.orgにそのページがすでに登録されている → そのページをブックマーク
        archive.orgに登録がない → do nothing
その他のstatus code → do nothing
