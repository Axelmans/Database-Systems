import sqlite3

conn = sqlite3.connect('spj_2021.db')
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

def print_answers():
    print(f"Question A.1: {a_1()}")
    print(f"Question A.2: {a_2()}")
    print(f"Question A.3: {a_3()}")
    print(f"Question A.4: {a_4()}")
    print(f"Question A.5: {a_5()}")
    print(f"Question A.6: {a_6()}")
    print(f"Question A.7: {a_7()}")
    print(f"Question A.8: {a_8()}")
    print(f"Question A.9: {a_9()}")
    print(f"Question A.10: {a_10()}")
    print(f"Question A.11: {a_11()}")
    print(f"Question A.12: {a_12()}")
    print(f"Question A.13: {a_13()}")
    print(f"Question A.14: {a_14()}")

if __name__ == '__main__':
    setup()
    print_answers()
