from flask import Flask, render_template, jsonify, request
from flask_jwt_extended import *
from dao import *
from dto import *

app=Flask(__name__)

app.config.update( 
    DEBUG=True,
    JWT_SECRET_KEY="mymath"
)

jwt=JWTManager(app)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/booksurvey")
def survey():
    return render_template("booksurvey.html")    

@app.route("/login", methods=["POST"])
def login_proc():
    user_id=request.form.get("user_id")
    dao=MemberDAO()

    if user_id == dao.memid(request.form.get("user_pw")):
        return jsonify(
            result="200",
            access_token=create_access_token(identity=user_id)
        )

    else:
        return "존재하지 않는 사용자입니다."

@app.route("/qlist", methods=["GET"])
def qslist():
    dao=QuestionDAO()
    data=dao.questall()
    return render_template("qlist.html", data=data)

@app.route("/qsid1", methods=["GET"])
def qsno1():
    qsid=1
    dao=QuestionDAO()
    data=dao.questone(qsid)
    return render_template("qsid1.html", data=data)

@app.route("/qsid2", methods=["GET"])
def qsno2():
    qsid=2
    dao=QuestionDAO()
    data=dao.questone(qsid)
    return render_template("qsid2.html", data=data)

@app.route("/insertquestion", methods=["GET"])
def insertqs():
    return render_template("insertquestion.html")

@app.route("/insert", methods=["POST"])
def insert():
    dao = QuestionDAO()
    dto1 = MemberDTO(None, None, request.form.get("mid"), None, None)
    dto = QuestionDTO(request.form.get("title"), request.form.get("content"), request.form.get("memno"), request.form.get("grade"))
    dao.questinsert(dto1, dto)
    return render_template("insert.html")

if __name__ == '__main__':
    app.run(debug=True, host="127.0.0.1", port="5000")
