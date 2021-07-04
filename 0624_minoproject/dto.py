class MemberDTO:
    def __init__(self, newmemno, newmname, newmid, newmpw, newbirth_date):
        self.memno=newmemno
        self.mname=newmname
        self.mid=newmid
        self.mpw=newmpw
        self.birth_date=newbirth_date

    def getMemno(self):
        return self.memno
    
    def setMemno(self, newmemno):
        self.memno=newmemno

    def getMname(self):
        return self.mname
    
    def setMname(self, newmname):
        self.mname=newmname

    def getMid(self):
        return self.mid
    
    def setMid(self, newmid):
        self.mid=newmid

    def getMpw(self):
        return self.mpw
    
    def setMpw(self, newmpw):
        self.mpw=newmpw

    def getBirth(self):
        return self.birth
    
    def setBirth(self, newbirth):
        self.birth=newbirth

class QuestionDTO:
    def __init__(self, newqsid, newtitle, newcontent, memno, newgrade):
        self.qsid=newqsid
        self.title=newtitle
        self.content=newcontent
        self.memno=memno
        self.grade=newgrade

    def getQsid(self):
        return self.qsid
    
    def setQsid(self, newqsid):
        self.qsid=newqsid

    def getTitle(self):
        return self.title
    
    def setTitle(self, newtitle):
        self.title=newtitle

    def getContent(self):
        return self.content
    
    def setContent(self, newcontent):
        self.content=newcontent

    def getGrade(self):
        return self.grade
    
    def setGrade(self, newgrade):
        self.grade=newgrade

class AnswerDTO:
    def __init__(self, newasid, qsid, newan_text, memno):
        self.asid=newasid
        self.qsid=qsid
        self.an_text=newan_text
        self.memno=memno

    def getAsid(self):
        return self.asid
    
    def setAsid(self, newasid):
        self.asid=newasid


    def getAn_text(self):
        return self.text
    
    def setAn_text(self, newan_text):
        self.text=newan_text

class BookDTO:
    def __init__(self, newb_title, newb_level, newb_company, newb_type, newb_object, newb_color):
        self.b_title=newb_title
        self.b_level=newb_level
        self.b_company=newb_company
        self.b_type=newb_type
        self.b_object=newb_object
        self.b_color=newb_color