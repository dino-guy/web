import cgi
import mysql.connector
print("Content-Type:text/html\r\n\r\n")
print("<html>")
print("<body>")
print("<h1>Admission sucessful</h1>")

form=cgi.FeildStorage()
EName=form.getvalue("Name")
EAdmission=form.getvalue("Admission")
EFees=form.getvalue("Fees")

db=mysql.connector.connect(
    hostel="localhost",
    user="root",
    password="",
    database="collage"
)
mycursor=db.cursor()
sql="insert into student(Name,Admission,Fees)value(%s,%s,%s,%s)"
value=(EName,EAdmission,EFees,)
mycursor.execute(sql,value)
db.commit()
print("</body>")
print("</html>")