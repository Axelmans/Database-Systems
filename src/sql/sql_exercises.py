import sqlite3

conn = sqlite3.connect('../../database.db')
cursor = conn.cursor()

def reset():
    pass

def setup():
    with open('spj_2021.sql', 'r', encoding='utf-8') as file:
        sql_script = file.read()
        cursor.executescript(sql_script)
    return

def a_1():
    pass

def a_2():
    query = 'select sname, city from supplier'
    cursor.execute(query)
    return cursor.fetchall()

def a_3():
    query = 'select * from shipment where qty >= 500'
    cursor.execute(query)
    return cursor.fetchall()

def a_4():
    query = 'select * from project where city = \'London\''
    cursor.execute(query)
    return cursor.fetchall()

def a_5():
    query = 'select * from shipment where jnum = \'J7\' and qty >= 200'
    cursor.execute(query)
    return cursor.fetchall()

def a_6():
    query = 'select * from part where pname like \'C%\' and weight >= 15 and city != \'Paris\''
    cursor.execute(query)
    return cursor.fetchall()

def a_7():
    query = 'select city, sum(weight) as total_weight from part group by city'
    cursor.execute(query)
    return cursor.fetchall()

def a_8():
    query = 'select * from supplier where city = \'London\' order by status'
    cursor.execute(query)
    return cursor.fetchall()

def a_9():
    query = ('select snum, jnum, sum(qty) as total_quantity from shipment '
             'where pnum != \'P1\' group by snum having sum(qty) > 1000')
    cursor.execute(query)
    return cursor.fetchall()

def a_10():
    query = 'select s.* from shipment s join project p on s.jnum = p.jnum where p.jname = \'Tape\' and s.qty >= 200'
    cursor.execute(query)
    return cursor.fetchall()

def a_11():
    query = 'select pname from part where city = \'London\''
    cursor.execute(query)
    return cursor.fetchall()

def a_12():
    query = ('select s.snum, s.pnum, s.jnum, (s.qty * p.weight) as shipped_weight from shipment s '
             'join part p on s.pnum = p.pnum join project j on s.jnum = j.jnum where j.city = \'Paris\'')
    cursor.execute(query)
    return cursor.fetchall()

def a_13():
    query = ('select pr.jname, sum(pa.weight * s.qty) as total_weight from project pr '
             'join shipment s on pr.jnum = s.jnum join part pa on s.pnum = pa.pnum group by pr.jname ')
    cursor.execute(query)
    return cursor.fetchall()

def a_14():
    query = ('select p1.pnum as part1, p2.pnum as part2, p1.city from part p1 '
             'join part p2 on p1.city = p2.city where p1.pnum < p2.pnum')
    cursor.execute(query)
    return cursor.fetchall()

if __name__ == '__main__':
    reset()
    print("Question A.2: " + str(a_2()))
    print("Question A.3: " + str(a_3()))
    print("Question A.4: " + str(a_4()))
    print("Question A.5: " + str(a_5()))
    print("Question A.6: " + str(a_6()))
    print("Question A.7: " + str(a_7()))
    print("Question A.8: " + str(a_8()))
    print("Question A.9: " + str(a_9()))
    print("Question A.10: " + str(a_10()))
    print("Question A.11: " + str(a_11()))
    print("Question A.12: " + str(a_12()))
    print("Question A.13: " + str(a_13()))
    print("Question A.14: " + str(a_14()))
    setup()
