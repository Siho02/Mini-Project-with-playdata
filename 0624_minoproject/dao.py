import cx_Oracle
from dto import * 
import json
import collections

class MemberDAO:
    def memid(self, user_pw):  

        data=''
        try:
            conn=cx_Oracle.connect(user="MYMATH2", password="1234", dsn="xe")
            cur=conn.cursor()

            try:
                cur.execute("select mid from member where mpw=:mpw", mpw=user_pw)
                row=cur.fetchone()
                data=row[0]

            except Exception as e:
                print(e) 

        except Exception as e:
            print(e) 

        finally:
            cur.close() 
            conn.close()

        return data


class QuestionDAO:
    def questall(self):  

        data=[]
        try:
            conn=cx_Oracle.connect(user="MYMATH2", password="1234", dsn="xe")
            cur=conn.cursor()

            try:
                cur.execute("select qsid, grade, title, mname from q_table, member where q_table.memno=member.memno") 
                rows=cur.fetchall()

                v=[]
                for row in rows:
                    d=collections.OrderedDict()
                    d['qsid']=row[0]
                    d['grade']=row[1]
                    d['title']=row[2]
                    d['mname']=row[3]
                    v.append(d)

                data=json.dumps(v, ensure_ascii=False)

            except Exception as e:
                print(e) 

        except Exception as e:
            print(e) 

        finally:
            cur.close() 
            conn.close()

        return data


    def questone(self, qsid):  

        data=''
        try:
            conn=cx_Oracle.connect(user="MYMATH2", password="1234", dsn="xe")
            cur=conn.cursor()

            try:
                cur.execute("select title, content, mname from q_table, member where q_table.memno=member.memno and qsid=:qsid", qsid=qsid) 
                row=cur.fetchone() 
                data='{"title":"' + row[0] + '", "content":"' + row[1] + '", "mname":"' + row[2] + '"}'

            except Exception as e:
                print(e) 

        except Exception as e:
            print(e) 

        finally:
            cur.close() 
            conn.close()

        return data


    def questinsert(self, dto):

        conn=cx_Oracle.connect(user="MYMATH2", password="1234", dsn="xe")
        cur=conn.cursor()

        try:
            cur.execute("insert into q_table values (:qsid, :grade, :title, :memno, :content)", \
                empno=dto.getEmpno(), ename=dto.getEname(), sal=dto.getSal()) 
            conn.commit()
        except Exception as e:
            print(e) 

        finally:
            cur.close() 
            conn.close()
