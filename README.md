## 210525_mini_project

### contributor : 

''' 
Iphone class have name, nuber, version(optional)
three method : update_version, calling, search_contact
'''
''' 
Iphone2 is inherited by Iphone and have name, nuber, version(optional)
additional method : message
'''
'''
Iphone3 is inherited by Iphone2 and have name, nuber, version(optional)
additional method : wifi
'''

### structure
class Iphone:

    def __init__(self, name, number, version=1.0): 인스턴스 변수 설정
    
    def update_version(self): 
        **객체.update_version()을 실행 시 version을 0.1 올려줌**
    
    def calling(self): 
        **전화번호를 입력(input함수 이용) 받아 '전화번호 + 에게 전화를 겁니다' 출력**
    
    def contact(self):
        with open('dataSet/contact.txt', 'r', encoding='utf-8') as contact_list:
            **파일 읽기를 통해 전화번호부를 읽고 검색하여 검색 내용을 포함하는 리스트를 출력**
            
class Iphone2(Iphone):

    def __init__(self, name, number, version=2.0): **Iphone 클래스를 상속 받습니다**
        
    def send_message(self): 
        **Iphone2의 새로운 기능으로 메시지 보내기 기능을 추가합니다.**
        **문자의 내용이 없을 시 '문자의 내용이 너무 짧다'를 출력합니다**
        **전화번호를 입력 받아 '문자를 보냈습니다'를 출력합니다**

class Iphone3(Iphone2):

    def __init__(self, name, number, version=3.0): **Iphone2 클래스를 상속 받습니다.**

    def wifi_check(self):
        **Iphone3의 새로운 기능으로 와이파이 접속 기능을 추가합니다**
        **와이파이 비밀번호를 입력합니다**
        **이미 존재하는 와이파이 비밀번호(1234)와 입력된 비밀번호가 같다면 '접속'을 출력합니다**
        **같지 않다면 '접속 실패'를 출력합니다.
    
