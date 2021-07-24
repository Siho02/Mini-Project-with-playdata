from selenium import webdriver 
from bs4 import BeautifulSoup 
import time
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
import numpy as np



class Crawling():
    def crawl_exel():
        browser = webdriver.Chrome('c:/driver/chromedriver.exe')
        results = []
        try:
            for page in range(1,11):
                url = f"https://youtube-rank.com/board/bbs/board.php?bo_table=youtube&page={page}" 
                browser.get(url)
                time.sleep(2)
                html = browser.page_source
                soup = BeautifulSoup(html, 'html.parser')
                channel_list = soup.select('form > table > tbody > tr')
                for channel in channel_list:
                    title = channel.select('h1 > a')[0].text.strip() 
                    category = channel.select('p.category')[0].text.strip()
                    subscriber = channel.select('.subscriber_cnt')[0].text 
                    view = channel.select('.view_cnt')[0].text
                    video = channel.select('.video_cnt')[0].text
                    data = [title, category, subscriber, view, video]
                    results.append(data)
        except Exception as e:
            print("페이지 파싱 에러", e)
        finally:
            time.sleep(3)
            browser.quit()
            df = pd.DataFrame(results)
            df.columns = ['title', 'category', 'subscriber', 'view', 'video']
            df.to_excel('./youtube_rank.xlsx', index = False)


    def visual1():
        path = 'c:/Windows/Fonts/malgun.ttf'
        font_name = font_manager.FontProperties(fname = path).get_name()
        rc('font', family = font_name)

        df = pd.read_excel('./youtube_rank.xlsx')

        df['subscriber'] = df['subscriber'].str.replace('만', '0000')
        df['replaced_subscriber'] = df['subscriber'].astype('int64')
        pivot_df = df.pivot_table(index = 'category', values = 'replaced_subscriber', aggfunc = ['sum','count'])
        pivot_df.columns = ['subscriber_sum', 'category_count']
        pivot_df = pivot_df.reset_index()
        pivot_df = pivot_df.sort_values(by='subscriber_sum', ascending=False)
        plt.figure(figsize = (10, 10))
        plt.pie(pivot_df['subscriber_sum'], labels=pivot_df['category'], autopct='%1.1f%%')
        plt.savefig("./static/img/plot1.png")


    def visual2():
        # 카테고리별 평균 조회수
        path = 'c:/Windows/Fonts/malgun.ttf'
        font_name = font_manager.FontProperties(fname = path).get_name()
        rc('font', family = font_name)

        df = pd.read_excel('./youtube_rank.xlsx')

        # 데이터 전처리
        df['view'] = df['view'].str.replace('억', '')
        df['view'] = df['view'].str.replace('만', '0000')
        df['video'] = df['video'].str.replace('개', '')
        df['video'] = df['video'].str.replace(',', '')

        # 개수 / 조회수 0인 행 삭제 --> 데이터 996개
        df = df.replace('0', np.nan)
        df = df.dropna()
        df['view'] = df['view'].astype('int64')
        df['video'] = df['video'].astype('int64')

        # 평균 컬럼 형성
        df['avgview'] = df['view']//df['video']

        # pivot table 만들기
        pivot_df2 = df.pivot_table(index='category', values='avgview')
        pivot_df2 = pivot_df2.astype('int64')
        pivot_df2 = pivot_df2.sort_values(by='avgview', ascending=False).reset_index()
        
        # plot 만들기
        plt.figure(figsize = (10, 10))
        sns.catplot(x='avgview', y='category', data=pivot_df2, kind='bar')
        plt.savefig("./static/img/plot2.png")

    def visual3():
        path = 'c:/Windows/Fonts/malgun.ttf'
        font_name = font_manager.FontProperties(fname = path).get_name()
        rc('font', family = font_name)

        df = pd.read_excel('./youtube_rank.xlsx')

        df['view'] = df['view'].str.replace('억', '')
        df['view'] = df['view'].str.replace('만', '0000')
        df['replaced_view'] = df['view'].astype('int64')

        pivot_df = df.pivot_table(index = 'category', values = 'replaced_view', aggfunc = ['sum','count'])
        pivot_df.columns = ['view_sum', 'category_count']
        pivot_df = pivot_df.sort_values(by='category_count', ascending=False)
        pivot_df = pivot_df.reset_index()
        pivot_df = pivot_df.head(10)
        
        plt.figure(figsize = (10, 10))
        sns.catplot(x='category_count', y='category', data=pivot_df, kind='bar')
        plt.savefig("./static/img/plot3.png")


if __name__ == '__main__':
    # Crawling.crawl_exel()
    # Crawling.visual1()
    pass