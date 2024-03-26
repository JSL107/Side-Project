from selenium import webdriver as wd
import time

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from openpyxl import Workbook
from bs4 import BeautifulSoup
import openpyxl
import os.path

options = wd.ChromeOptions()
options.add_experimental_option("excludeSwitches", ["enable-logging"])
driver = wd.Chrome(options=options)
url = "https://www.hddfs.com/shop/dm/main.do"


driver.get(url)
driver.maximize_window()
# driver.find_element(By.TAG_NAME,'body').send_keys(Keys.PAGE_DOWN)
# element = driver.find_element(By.CLASS_NAME,"intro_logo").click

# 홈가기
sample = driver.find_element(By.CSS_SELECTOR, "#s_gohome > a")
driver.execute_script("arguments[0].click();", sample)

# 팝업닫기
l_popup = driver.find_elements(By.CLASS_NAME, "popup_close")
for popup in l_popup:
    driver.execute_script("arguments[0].click();", popup)
time.sleep(1)

# 로그인버튼 누르기
loginBtn = driver.find_element(By.CLASS_NAME, "menu_login_join")
driver.execute_script("arguments[0].click();", loginBtn)

# 팝업닫기
l_popup = driver.find_elements(By.CLASS_NAME, "popup_close")
for popup in l_popup:
    driver.execute_script("arguments[0].click();", popup)

time.sleep(1)
# 로그인
driver.switch_to.window(driver.window_handles[1])
custId = driver.find_element(By.CSS_SELECTOR, "#custId")
custId.send_keys("min077")
custId = driver.find_element(By.CSS_SELECTOR, "#custPwd")
custId.send_keys("vkdlsjf12!")
driver.find_element(By.ID, "btnLgin1").click()
driver.switch_to.window(driver.window_handles[0])

time.sleep(1)

# 이거의 길이만큼
sites = ['https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00020101',
         'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00020102',
         'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00020103',
         'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00020104',
         'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00020105',
         'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00020106',
         'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00020107',
         'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00020108']


# 원하는 파일이름
files = ['makeup_face']

category = ''
for test in range(len(sites)):

    #카테고리 이동
    driver.get(sites[test])

    if test == 0:
        category = '베이스'
    if test == 1:
        category = '프라이머'
    if test == 2:
        category = 'BB크림/CC크림'
    if test == 3:
        category = '파운데이션'
    if test == 4:
        category = '컨실러'
    if test == 5:
        category = '쿠션팩트'
    if test == 6:
        category = '파우더팩트'
    if test == 7:
        category = '블러셔/셰딩/하이라이터'

    hrefli = []
    cnt = 0
    #스크롤 끝까지 내리기
    bh = driver.execute_script("return document.body.scrollHeight")
    while (True):
        time.sleep(1)
        driver.execute_script("window.scrollTo(0,document.body.scrollHeight)")
        time.sleep(1)

        ah = driver.execute_script("return document.body.scrollHeight")
        if ah == bh:
            break
        else:
            bh = ah

    #모든상품의 상세링크 li에 저장
    li = driver.find_elements(By.CSS_SELECTOR, "#content > section > div > div.product_list.goosMoreArea > ul > li")
    for i in li:
        a = i.find_element(By.TAG_NAME, "a").get_attribute("href")
        name = i.find_element(By.CSS_SELECTOR,"a > div.pro_i > p.tx_ex.goosNm").text
            
        hrefli.append(a)
        cnt += 1
        #print(str(cnt)+' '+name)


    count = 0
    ts = []
    for link in hrefli:
        print(count)
        count = count+1
        driver.get(link)
        time.sleep(0.5)
        #상품코드
        try:
            pid = driver.find_element(By.CSS_SELECTOR, "#content > section > div.pd_visual > div.summary_info > div.prd_no > ul > li:nth-child(1)").text
            pid = pid[6:]
        except:
            pid=''
        #상품명
        try:
            name = driver.find_element(By.CSS_SELECTOR, "#content > section > div.pd_visual > div.summary_info > div.tit > strong").text
        except:
            name=''
        #가격
        try:
            price = driver.find_element(By.CSS_SELECTOR,"#content > section > div.pd_visual > div.summary_info > div.price > ul > li:nth-child(2) > strong").text
            price = price[1:]
        except:
            price=''
        #할인율
        try:
            saleRate = driver.find_element(By.CSS_SELECTOR,"#content > section > div.pd_visual > div.summary_info > div.price > span > i").text
        except:
            saleRate = ''
        #이미지
        try:
            img1 = driver.find_element(By.CSS_SELECTOR,'#content > section > div.pd_visual > div.thumbnail_box > div.swiper-container.swiper_visual_thumbnail > div > div > img').get_attribute("src")   
            imglist=img1.split("&")
            img1=imglist[0]
        except:
            img1=''


        img2 = ''
        img3 = ''
        img4 = ''
        img5 = ''
        print('이미지1: '+str(img1))
        
        #이미지2
        try:
            img2 = driver.find_element(By.CSS_SELECTOR,"#content > section > div.pd_visual > div.thumbnail_box > div.swiper-container.swiper_visual_thumbnail.swiper-container-initialized.swiper-container-vertical > div > div.swiper-slide.swiper-slide-next > img").get_attribute("src")
            imglist=img2.split("&")
            img2=imglist[0]

        except:
            img2=''
        print('이미지2: '+str(img2))
        
        #이미지3
        try:
            img3 = driver.find_element(By.CSS_SELECTOR,"#content > section > div.pd_visual > div.thumbnail_box > div.swiper-container.swiper_visual_thumbnail.swiper-container-initialized.swiper-container-vertical > div > div:nth-child(3) > img").get_attribute("src")
            imglist=img3.split("&")
            img3=imglist[0]
        except:
            img3=''
        print('이미지3: '+str(img3))

        #이미지4
        try:
            img4 = driver.find_element(By.CSS_SELECTOR,"#content > section > div.pd_visual > div.thumbnail_box > div.swiper-container.swiper_visual_thumbnail.swiper-container-initialized.swiper-container-vertical > div > div:nth-child(4) > img").get_attribute("src")
            imglist=img4.split("&")
            img4=imglist[0]
        except:
            img4=''
        print('이미지4: '+str(img4))
        #이미지5
        try:
            img5 = driver.find_element(By.CSS_SELECTOR,"#content > section > div.pd_visual > div.thumbnail_box > div.swiper-container.swiper_visual_thumbnail.swiper-container-initialized.swiper-container-vertical > div > div:nth-child(5) > img").get_attribute("src")
            imglist=img5.split("&")
            img5=imglist[0]
        except:
            img5=''
        print('이미지5: '+str(img5))
        
        #bs4 초기화
        soup = BeautifulSoup(driver.page_source, 'html.parser')
        
        colorCode = ''
        colorLink = ''
        colorCodeList = driver.find_elements(By.CSS_SELECTOR, "#content > section > div.pd_info div:nth-child(2) > div.color_chip_area.type_circle > ul > li")
        for element in colorCodeList:
            try:
                a = element.find_element(By.TAG_NAME, "a").get_attribute("style")
                link = element.find_element(By.TAG_NAME, "a").get_attribute("href")
                colorList = a.split(":")
                element = colorList[1]
                colorCode += str(element)
                colorLink += str(link)
                print('컬러: ' + str(element))
                print('링크: ' + str(link))
            except:
                continue

        detailInfo = ''
        volume = ''
        specifications = ''
        period_of_use = ''
        useIt = ''
        manufacturer = ''
        components = ''
        testing = ''
        warning = ''
        certificate = ''
        phone_num = ''
        madeIn = ''

        # 상세정보
        try:      
            driver.find_element(By.CLASS_NAME, "call_panel_c").click()     
            time.sleep(1)
            screen = driver.find_element(By.CSS_SELECTOR, "div.pro_notice > div:nth-child(1)")
            box = screen.find_element(By.CSS_SELECTOR, "div.box")
            table = box.find_element(By.TAG_NAME, "table")
            tbody = table.find_element(By.TAG_NAME, "tbody")
            rows = tbody.find_elements(By.TAG_NAME, "tr")
            for index, elem in enumerate(rows):
                if index == 0:
                    volume = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('내용물의 용량 또는 중량: ' + volume)
                if index == 1:
                    specifications = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('제품 주요 사양: ' + specifications)
                if index == 2:
                    period_of_use = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('사용기한 또는 개봉 후 사용기간(소비기한 포함): ' + period_of_use)
                if index == 3:
                    userIt = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('사용방법: ' + userIt)
                if index == 4:
                    manufacturer = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('화장품제조업자: ' + manufacturer)
                if index == 5:
                    components = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('전성분: ' + components)
                if index == 6:
                    testing = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('기능성 화장품에 따른 심사 또는 보고 유무: ' + testing)
                if index == 7:
                    warning = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('사용할 때의 주의 사항: ' + warning)
                if index == 8:
                    certificate = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('품질보증기준: ' + certificate)
                if index == 9:
                    phone_num = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('소비자 상담관련 전화번호: ' + phone_num)
                if index == 10:
                    madeIn = elem.find_element(By.TAG_NAME, "td").get_attribute("textContent")
                    print('원산지: ' + madeIn)
            # useIt = driver.find_element(By.CSS_SELECTOR, "#container > section > div.productdetail_box > div.panel > div.productdetail_03 > div.pro_notice > div.screen.open > div.box > table > tbody > tr:nth-child(4) > td")
            # warning = driver.find_element(By.CSS_SELECTOR, "#container > section > div.productdetail_box > div.panel > div.productdetail_03 > div.pro_notice > div.screen.open > div.box > table > tbody > tr:nth-child(8) > td")
            # madeIn = driver.find_element(By.CSS_SELECTOR, "#container > section > div.productdetail_box > div.panel > div.productdetail_03 > div.pro_notice > div.screen.open > div.box > table > tbody > tr:nth-child(11) > td")

        except Exception as e:
            continue
            
        print('중량: ' + str(volume))
        print('사용법: ' + useIt)
        print('경고: ' + warning)
        print('원산지: ' + madeIn)
        
        print('상품코드: '+pid)
        print('상품명: '+name)
        print('가격: '+price)
        print('할인율: '+saleRate)
        print('나의 컬러: ' + colorCode.split(';')[0])
        print('컬러 코드리스트: ' + colorCode)

        ts.append([pid,name, category, price,saleRate,img1,img2,img3,img4,img5, colorCode.split(';')[0], colorCode, colorLink, volume, specifications, period_of_use,
        useIt, manufacturer, components, testing, warning, certificate, phone_num, madeIn])

    if os.path.isfile('./makeup_face.xlsx'):
        wb = openpyxl.load_workbook('./makeup_face.xlsx')
    else:
    #엑셀만들기!
        wb = Workbook()
    ws = wb.active

    for data in ts :
        ws.append(data)

    wb.save('./'+files[0]+'.xlsx')