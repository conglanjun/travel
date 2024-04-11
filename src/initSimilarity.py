import numpy as np

data = np.loadtxt('./travel/static/travel/similarity.csv', delimiter=',', usecols=(1,2,3,4,5,6,7,8,9))
print(data)

# imdb id
listImgId = []
with open("./travel/static/travel/similarity.csv") as f:
    for row in f:
        listImgId.append(row.split(',')[0])

import scipy.spatial

kdt = scipy.spatial.cKDTree(data)
k = 10
dists, neighs = kdt.query(data, k+1)
# avg_dists = np.mean(dists[:, 1:], axis=1)
# print(avg_dists)

import pymysql

try:
    db = pymysql.connect(host='localhost', user='root', passwd='123456', port=3306, database='travel_recommend_db')
    print('connected successfully!')
except Exception as e:
    print(e)

cursor = db.cursor()
for index in range(len(listImgId)):
    sql = "select * from travel where imdb_id = '%s'" % (listImgId[index])
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        print(results)
        if len(results) > 0:
            row = results[0]
            for similarIndex in range(len(dists[0])):
                target = neighs[index][similarIndex]
                target_imdb_id = listImgId[target]
                sql = "select * from travel where imdb_id = '%s'" % (target_imdb_id)
                cursor.execute(sql)
                target_results = cursor.fetchall()
                if len(target_results) == 0:
                    continue
                target_row = target_results[0]
                if target_row[0] == row[0]:
                    continue
                sql = "select * from travel_travel_similarity where travel_source_id = %s and travel_target_id = %s" % (row[0], target_row[0])
                cursor.execute(sql)
                similarity_results = cursor.fetchall()
                if len(similarity_results) == 0:
                    similarity = 10 - dists[index][similarIndex]
                    sql = """
                        insert into travel_travel_similarity (similarity, travel_source_id, travel_target_id)
                        values (%s, %s, %s)
                        """ % (similarity, row[0], target_row[0])
                    cursor.execute(sql)
                    db.commit()
                    print('insert successfully!')
    except Exception as e:
        print(e)

db.close()