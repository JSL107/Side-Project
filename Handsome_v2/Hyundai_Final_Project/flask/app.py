from flask import Flask
from flask import request
import requests
from flask import jsonify, redirect
from personal_color import personal_color
import os
from face_makeup import makeup
from werkzeug.utils import secure_filename
import base64
import json
from PIL import Image
import io
from autocrop import Cropper
import random
import string

import argparse
from io import BytesIO
from flask import Flask, render_template, url_for
from werkzeug.utils import secure_filename
import joblib
import numpy as np
from flask_cors import CORS
import cv2
from tensorflow.keras.applications.vgg16 import VGG16
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.applications.vgg16 import preprocess_input, decode_predictions

from keras.models import load_model


app = Flask(__name__)

# Cross Origin Resource Sharing (CORS) 적용하기
CORS(app)
labels=[
    '로멘틱',
    '내추럴',
    '모던',
    '캐주얼',
    '클래식',
    '페미닌'
    ]

# 메인 페이지 라우팅
@app.route("/")
@app.route("/index")
def index():
    return flask.render_template('index.html')


# 데이터 예측 처리
@app.route('/predict', methods=['POST'])
def make_prediction():
    
    if request.method == 'POST':

        # 업로드 파일 처리 분기
        file = request.files['input_img']
        csrfName = request.form['csrfName']
        csrfToken = request.form[csrfName]
        if not file: return render_template('move.jsp', style="NoFiles")

        # 파일저장
        file.save(secure_filename(file.filename))

        # 입력 받은 이미지 예측
        path = './'+file.filename
        print(path)
        # 분류를 위한 이미지 불러오기
        image = Image.open(path)
        # 이미지 리사이징
        image = image.resize((224,224), resample=0)
        image = np.array(image)
        image = image.reshape((1, image.shape[0],image.shape[1],image.shape[2]))
        image = preprocess_input(image)
        
        # 클래스 예측
        output = model.predict(image)
        return render_template('move.jsp', style=labels[np.argmax(output)],csrfName=csrfName, csrfToken=csrfToken)
        # return style, 200

# 데이터 예측 처리
@app.route('/predict2', methods=['POST'])
def make_prediction2():
    
    if request.method == 'POST':

        # 업로드 파일 처리 분기
        file = request.files['input_img']
        
        if not file: return render_template('move.jsp', style="NoFiles")

        # 파일저장
        file.save("./file/" + secure_filename(file.filename))
        path = "./file/"+file.filename
        image = Image.open(path)
        # 이미지 리사이징 (모델의 사이즈와 일치시키기)
        image = image.resize((224,224), resample=0)
        image = np.array(image)
        image = image.reshape((1, image.shape[0],image.shape[1],image.shape[2]))
        image = preprocess_input(image)
        
        # 클래스 예측
        output = model.predict(image)
        # json으로 반환
        return  jsonify({"style" : labels[np.argmax(output)]})

@app.route('/color', methods=['GET', 'POST'])
def detect_personal():
    # imgpath = request.args.get('file') --- None 값 출력
    f = request.files['file']
    f.save('C:\\Dev\\flask\\files\\' + secure_filename(f.filename))
    try:
        tone = personal_color.analysis('C:\\Dev\\flask\\files\\' + f.filename)
        print(tone)
        return jsonify({"personalColor" : tone,
                        "fileName" : f.filename})
    except:
        return "얼굴을 인식할 수 없습니다."

@app.route('/img', methods=['GET', 'POST'])
def get_img():
    imgpath = request.form['fileName']
    imgpath = "C:\\Dev\\flask\\files\\" + imgpath
    print(imgpath)
    
    ## 얼굴 사진 crop 시작
    cropper = Cropper(height = 620, width = 520, face_percent = 10)

    # Get a Numpy array of the cropped image
    cropped_array = cropper.crop(imgpath)

    if cropped_array.any():
        cropped_image = Image.fromarray(cropped_array)
        img_name = "".join([random.choice(string.ascii_uppercase) for _ in range(10)]) + ".jpg"
        cropped_image.save(img_name)
        
    ## 얼굴 사진 crop 끝

    with open(img_name, "rb") as image_file:
        image_binary = image_file.read()
        encoded_string = base64.b64encode(image_binary).decode("utf8")
        print(encoded_string)

        image_dict = {
            "fileName" : img_name,
            "image": encoded_string
        }

        # image_json = json.dumps(image_dict)
        # print(image_json)

    # imgpath = req['fileName']
    # files = open("C:\\Dev\\flask\\files\\" + imgpath)
    # print(imgpath)
    return image_dict

@app.route('/makeup', methods=['GET', 'POST'])
def do_makeup():
    imgdata = request.form['image']
    # dataBytesIO = io.BytesIO(imgdata[23:])
    # image = Image.open(dataBytesIO)

    fileName = request.form['fileName']
    faceColor = request.form['faceColor']
    eyeColor = request.form['eyeColor']
    lipColor = request.form['lipColor']

    
    imgdata = base64.b64decode(str(imgdata))
    # imgpath = "C:\\Dev\\flask\\files\\origin_" + fileName
    imgpath = "C:\\Dev\\flask\\" + fileName

    img = Image.open(io.BytesIO(imgdata))
    img.save(imgpath, 'jpeg')

    makeup.main(imgpath, fileName, faceColor, eyeColor, lipColor)

    with open("C:\\Dev\\flask\\makeup_" + fileName, "rb") as image_file:
        image_binary = image_file.read()
        encoded_string = base64.b64encode(image_binary).decode("utf8")
        print(encoded_string)

        image_dict = {
            "image": encoded_string
        }
        
    return image_dict


@app.route('/mypage')
def mypage():
    return 'This is My Page!'

@app.route('/test', methods=['GET', 'POST'])
def test_get():
    # title_receive = request.args.get('makeup_video')
    title_receive = request.files['file']
    print(title_receive)
    return "hello spring to flask"

if __name__ == '__main__':
    # 모델 로드
    # ml/mod el.py 선 실행 후 생성
    #model = joblib.load('./model/model.pkl')
    model2 = VGG16(weights='imagenet')
    # model = load_model('kfashion_model.h5')
    model = load_model('model/keras_model7000-6-choice.h5')

    app.run('0.0.0.0', port=8000, debug=True)