from selenium import webdriver as wd
import time

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from openpyxl import Workbook
from bs4 import BeautifulSoup

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
sites = [ 
'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000202',
'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000201',
'https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000203'
]

# 원하는 파일이름
files = ['makeup']

for test in range(len(sites)):

    #카테고리 이동
    driver.get(sites[test])


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
        colorCodeList = driver.find_elements(By.CSS_SELECTOR, "#content > section > div.pd_info div:nth-child(2) > div.color_chip_area.type_circle > ul > li")
        for element in colorCodeList:
            try:
                a = element.find_element(By.TAG_NAME, "a").get_attribute("style")
                colorList = a.split(":")
                element = colorList[1]
                colorCode += str(element)
                print('컬러: ' + str(element))
            except:
                continue
        
        print('상품코드: '+pid)
        print('상품명: '+name)
        print('가격: '+price)
        print('할인율: '+saleRate)
        print('나의 컬러: ' + colorCode.split(';')[0])
        print('컬러 코드리스트: ' + colorCode)

        ts.append([pid,name,price,saleRate,img1,img2,img3,img4,img5, colorCode.split(';')[0], colorCode])

    #엑셀만들기!
    wb = Workbook()
    ws = wb.active

    for data in ts :
        ws.append(data)

    wb.save('./'+files[test]+'.xlsx')