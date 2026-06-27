import MySQLdb

try:
    conn = MySQLdb.connect(host='localhost',user='root',passwd='1120',db='sysu',port=3306)
    cur = conn.cursor()
    count=cur.execute('select * from login')
    results=cur.fetchmany(count)
    for r in results:
        print r
    cur.close()
    conn.close()
except MySQLdb.Error,e:
    print "mysql error"
