#instalação da lib: pip install -U(caso já esteja instalado atualizar) psycopg2

import psycopg2

#caso eu queira passar a conn por string tenho q tirar as vírgulas e trocar database por dbname

db_conn="""host='host'
        dbname='database'
        user='user'
        password='senha'
        """



def delete_account_by_email(email):

    #""" é uma forma de utilizar string multilines
    query = f"""DELETE FROM accounts  
        WHERE email = '{email}';
        """

    conn = psycopg2.connect(
        host='host',
        database='database',
        user='user',
        password='senha'
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()