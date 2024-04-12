import pymysql

listImgId = []
with open("./travel/static/travel/similarity.csv") as f:
    for row in f:
        listImgId.append(row.split(','))

try:
    db = pymysql.connect(host='localhost', user='root', passwd='123456', port=3306, database='travel_recommend_db')
    print('connected successfully!')
except Exception as e:
    print(e)

cursor = db.cursor()
for index in range(len(listImgId)):
    sql = "select * from travel where imdb_id = '%s'" % (listImgId[index][0])
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        print(results)
        if len(results) == 0:
            continue
        row = results[0]
        for indexGenre in range(1, len(listImgId[index])):
            if int(listImgId[index][indexGenre]) > 0:
                sql = """
                    select * from travel_genre where travel_id = %s and genre_id = %s
                """ % (row[0], indexGenre)
                cursor.execute(sql)
                results = cursor.fetchall()
                if len(results) > 0:
                    continue
                sql = """
                    insert into travel_genre (travel_id, genre_id) values (%s, %s)
                """ % (row[0], indexGenre)
                cursor.execute(sql)
                db.commit()
                print('insert successfully!')
    except Exception as e:
        print(e)