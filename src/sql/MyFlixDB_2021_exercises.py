import sqlite3

conn = sqlite3.connect('MyFlixDB_2021.db')
cursor = conn.cursor()

def reset():
    pass

def setup():
    with open('MyFlixDB_2021.sql', 'r', encoding='utf-8') as file:
        sql_script = file.read()
        cursor.executescript(sql_script)
    return

def b_1():
    sql = 'select full_names, gender, physical_address from members'
    cursor.execute(sql)
    return cursor.fetchall()

def b_2():
    sql = 'select membership_number, full_names, substr(date_of_birth, 1, 4) from members'
    cursor.execute(sql)
    return cursor.fetchall()

def b_3():
    sql = 'select title || \' (\' || year_released || \')\', director from movies'
    cursor.execute(sql)
    return cursor.fetchall()

def b_4():
    sql = 'select m1.full_names as member, m2.full_names as referred_by from members m1 join members m2 on m1.referred_by = m2.membership_number'
    cursor.execute(sql)
    return cursor.fetchall()

def b_5():
    sql = 'select m.full_names, mov.title from members m join movierentals movr on m.membership_number = movr.membership_number join movies mov on movr.movie_id = mov.movie_id'
    cursor.execute(sql)
    return cursor.fetchall()

def print_answers():
    print(f"Question B.1: {b_1()}")
    print(f"Question B.2: {b_2()}")
    print(f"Question B.3: {b_3()}")
    print(f"Question B.4: {b_4()}")
    print(f"Question B.5: {b_5()}")

if __name__ == '__main__':
    setup()
    print_answers()
