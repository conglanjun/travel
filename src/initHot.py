import pymysql

try:
    db = pymysql.connect(host='localhost', user='root', passwd='123456', port=3306, database='travel_recommend_db')
    print('connected successfully!')
except Exception as e:
    print(e)

cursor = db.cursor()
sql = """
    select travel_id, avg(score) as avg_score from travel_rating group by travel_id order by avg_score desc
"""
cursor.execute(sql)
results = cursor.fetchall()
print(results)

for row in results:
    sql = """
        select * from travel_hot where travel_id = %s
    """ % (row[0])
    cursor.execute(sql)
    results = cursor.fetchall()
    if len(results) > 0:
        continue
    sql = """
        insert into travel_hot (rating_number, travel_id) values (%s, %s)
    """ % (row[1], row[0])
    cursor.execute(sql)
    db.commit()
    print('insert successfully!')