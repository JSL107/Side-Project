#!/usr/bin/env python
# coding: utf-8

# In[1]:


# import the necessary packages
from imutils import face_utils
import numpy as np
import imutils
import dlib
import cv2
import matplotlib.pyplot as plt

from sklearn.cluster import KMeans
from mpl_toolkits.mplot3d import Axes3D
from skimage import io
from itertools import compress

from colormath.color_objects import LabColor, sRGBColor, HSVColor
from colormath.color_conversions import convert_color

from scipy.spatial import distance
import copy
import math
import operator


# ### 묶은 코드 (detect_face)

# In[2]:


class DetectFace:
    def __init__(self, image):
        # initialize dlib's face detector (HOG-based)
        # and then create the facial landmark predictor
        self.detector = dlib.get_frontal_face_detector()
        self.predictor = dlib.shape_predictor('C:\\Dev\\flask\\personal_color\\res\\shape_predictor_68_face_landmarks.dat')

        #face detection part
        self.img = cv2.imread(image)
        self.img = imutils.resize(self.img, width=500)
        
#         cv2.imshow("img", self.img)
#         cv2.waitKey(0)
#         cv2.destroyAllWindows()
        #if self.img.shape[0]>500:
        #    self.img = cv2.resize(self.img, dsize=(0,0), fx=0.8, fy=0.8)

        # init face parts
        self.mouth = []
        self.right_eyebrow = []
        self.left_eyebrow = []
        self.right_eye = []
        self.left_eye = []
        self.left_cheek = []
        self.right_cheek = []
        self.nose = []
        self.jaw = []

        # detect the face parts and set the variables
        self.detect_face_part()
    
    # return type : np.array
    def detect_face_part(self):
        face_parts = [[],[],[],[],[],[],[],[],[]]
        rect = self.detector(cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY), 1)[0]

        # determine the facial landmarks for the face region, then
        # convert the landmark (x, y)-coordinates to a NumPy array
        shape = self.predictor(cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY), rect)
        shape = face_utils.shape_to_np(shape)

        idx = 0
        # loop over the face parts individually
        for (name, (i, j)) in face_utils.FACIAL_LANDMARKS_IDXS.items():
            face_parts[idx] = shape[i:j]
            idx += 1
#             print(name)

        self.mouth = self.extract_face_part(face_parts[0])
        self.right_eyebrow = self.extract_face_part(face_parts[2])
        self.left_eyebrow = self.extract_face_part(face_parts[3])
        self.left_eye = self.extract_face_part(face_parts[4])
        self.right_eye = self.extract_face_part(face_parts[5])
        self.nose = self.extract_face_part(face_parts[6])
        self.jaw = self.extract_face_part(face_parts[7])
        # Cheeks are detected by relative position to the face landmarks
        self.left_cheek = self.img[shape[29][1]:shape[33][1], shape[4][0]:shape[48][0]]
        self.right_cheek = self.img[shape[29][1]:shape[33][1], shape[54][0]:shape[12][0]]        
        
#         cv2.imshow("mouth", self.mouth)
#         cv2.waitKey(0)
#         cv2.destroyAllWindows()
        
    def extract_face_part(self, face_part_points):
        (x, y, w, h) = cv2.boundingRect(face_part_points)
        crop = self.img[y:y+h, x:x+w]
        adj_points = np.array([np.array([p[0]-x, p[1]-y]) for p in face_part_points])

        # Create an mask
        mask = np.zeros((crop.shape[0], crop.shape[1]))
        cv2.fillConvexPoly(mask, adj_points, 1)
        mask = mask.astype(np.bool)
        crop[np.logical_not(mask)] = [255, 0, 0]

        return crop


# ### 묶은 코드 (color_extract)

# In[3]:


class DominantColors:
    
    CLUSTERS = None
    IMAGE = None
    COLORS = None
    LABELS = None
    
    def __init__(self, image, clusters=3):
        self.CLUSTERS = clusters
        img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        self.IMAGE = img.reshape((img.shape[0] * img.shape[1], 3))

        #using k-means to cluster pixels
        kmeans = KMeans(n_clusters = self.CLUSTERS)
        kmeans.fit(self.IMAGE)

        #the cluster centers are our dominant colors.
        self.COLORS = kmeans.cluster_centers_
        self.LABELS = kmeans.labels_
        
    def rgb_to_hex(self, rgb):
        return '#%02x%02x%02x' % (int(rgb[0]), int(rgb[1]), int(rgb[2]))
    
        # Return a list in order of color that appeared most often.
    def getHistogram(self):
        numLabels = np.arange(0, self.CLUSTERS+1)
        #create frequency count tables
        (hist, _) = np.histogram(self.LABELS, bins = numLabels)
        hist = hist.astype("float")
        hist /= hist.sum()

        colors = self.COLORS
        #descending order sorting as per frequency count
        colors = colors[(-hist).argsort()]
        hist = hist[(-hist).argsort()]
        for i in range(self.CLUSTERS):
            colors[i] = colors[i].astype(int)
#             print(colors[i])
#             print(colors[i][2])
#             print(type(colors[i]))
        # Blue mask 제거
        fil = [colors[i][2] < 250 and colors[i][0] > 10 for i in range(self.CLUSTERS)]
        colors = list(compress(colors, fil))
        return colors, hist
    
    def plotHistogram(self):
        colors, hist = self.getHistogram()
        #creating empty chart
        chart = np.zeros((50, 500, 3), np.uint8)
        start = 0

        #creating color rectangles
        for i in range(len(colors)):
            end = start + hist[i] * 500
            r,g,b = colors[i]
            #using cv2.rectangle to plot colors
            cv2.rectangle(chart, (int(start), 0), (int(end), 50), (r,g,b), -1)
            start = end

        #display chart
#         plt.figure()
#         plt.axis("off")
#         plt.imshow(chart)
#         plt.show()

        return colors


# ### 묶은 코드 (tone_analysis)

# In[4]:


def is_warm(lab_b, a):
    '''
    파라미터 lab_b = [skin_b, hair_b, eye_b]
    a = 가중치 [skin, hair, eye]
    질의색상 lab_b값에서 warm의 lab_b, cool의 lab_b값 간의 거리를
    각각 계산하여 warm이 가까우면 1, 반대 경우 0 리턴
    '''
    # standard of skin, eyebrow, eye
    warm_b_std = [11.6518, 11.71445, 3.6484]
    cool_b_std = [4.64255, 4.86635, 0.18735]

    warm_dist = 0
    cool_dist = 0

    body_part = ['skin', 'eyebrow', 'eye']
    for i in range(3):
        warm_dist += abs(lab_b[i] - warm_b_std[i]) * a[i]
        #print(body_part[i],"의 warm 기준값과의 거리")
        #print(abs(lab_b[i] - warm_b_std[i]))
        cool_dist += abs(lab_b[i] - cool_b_std[i]) * a[i]
        #print(body_part[i],"의 cool 기준값과의 거리")
        #print(abs(lab_b[i] - cool_b_std[i]))
    if(warm_dist <= cool_dist):
        return 1 #warm
    else:
        return 0 #cool

def is_spr(hsv_s, a):
    '''
    파라미터 hsv_s = [skin_s, hair_s, eye_s]
    a = 가중치 [skin, hair, eye]
    질의색상 hsv_s값에서 spring의 hsv_s, fall의 hsv_s값 간의 거리를
    각각 계산하여 spring이 가까우면 1, 반대 경우 0 리턴
    '''
    #skin, hair, eye
    spr_s_std = [18.59296, 30.30303, 25.80645]
    fal_s_std = [27.13987, 39.75155, 37.5]

    spr_dist = 0
    fal_dist = 0

    body_part = ['skin', 'eyebrow', 'eye']
    for i in range(3):
        spr_dist += abs(hsv_s[i] - spr_s_std[i]) * a[i]
#         print(body_part[i],"의 spring 기준값과의 거리")
#         print(abs(hsv_s[i] - spr_s_std[i]) * a[i])
        fal_dist += abs(hsv_s[i] - fal_s_std[i]) * a[i]
#         print(body_part[i],"의 fall 기준값과의 거리")
#         print(abs(hsv_s[i] - fal_s_std[i]) * a[i])

    if(spr_dist <= fal_dist):
        return 1 #spring
    else:
        return 0 #fall

def is_smr(hsv_s, a):
    '''
    파라미터 hsv_s = [skin_s, hair_s, eye_s]
    a = 가중치 [skin, hair, eye]
    질의색상 hsv_s값에서 summer의 hsv_s, winter의 hsv_s값 간의 거리를
    각각 계산하여 summer가 가까우면 1, 반대 경우 0 리턴
    '''
    #skin, eyebrow, eye
    smr_s_std = [12.5, 21.7195, 24.77064]
    wnt_s_std = [16.73913, 24.8276, 31.3726]
    a[1] = 0.5 # eyebrow 영향력 적기 때문에 가중치 줄임

    smr_dist = 0
    wnt_dist = 0

    body_part = ['skin', 'eyebrow', 'eye']
    for i in range(3):
        smr_dist += abs(hsv_s[i] - smr_s_std[i]) * a[i]
#         print(body_part[i],"의 summer 기준값과의 거리")
#         print(abs(hsv_s[i] - smr_s_std[i]) * a[i])
        wnt_dist += abs(hsv_s[i] - wnt_s_std[i]) * a[i]
#         print(body_part[i],"의 winter 기준값과의 거리")
#         print(abs(hsv_s[i] - wnt_s_std[i]) * a[i])

    if(smr_dist <= wnt_dist):
        return 1 #summer
    else:
        return 0 #winter


# ### personal_color

# In[5]:


def analysis(imgpath):
    #######################################
    #           Face detection            #
    #######################################
    df = DetectFace(imgpath)
    face = [df.left_cheek, df.right_cheek,
            df.left_eyebrow, df.right_eyebrow,
            df.left_eye, df.right_eye]

    #######################################
    #         Get Dominant Colors         #
    #######################################
    temp = []
    clusters = 4
    for f in face:
        dc = DominantColors(f, clusters)
        face_part_color, _ = dc.getHistogram()
        dc.plotHistogram()
        temp.append(np.array(face_part_color[0]))

    cheek = np.mean([temp[0], temp[1]], axis=0)
    eyebrow = np.mean([temp[2], temp[3]], axis=0)
    eye = np.mean([temp[4], temp[5]], axis=0)

    Lab_b, hsv_s = [], []
    color = [cheek, eyebrow, eye]
    for i in range(3):
        rgb = sRGBColor(color[i][0], color[i][1], color[i][2], is_upscaled=True)
        lab = convert_color(rgb, LabColor, through_rgb_type=sRGBColor)
        hsv = convert_color(rgb, HSVColor, through_rgb_type=sRGBColor)
        Lab_b.append(float(format(lab.lab_b,".2f")))
        hsv_s.append(float(format(hsv.hsv_s,".2f"))*100)

    # print('Lab_b[skin, eyebrow, eye]',Lab_b)
    # print('hsv_s[skin, eyebrow, eye]',hsv_s)

    #######################################
    #      Personal color Analysis        #
    #######################################
    Lab_weight = [30, 20, 5]
    hsv_weight = [10, 1, 1]
    if(is_warm(Lab_b, Lab_weight)):
        if(is_spr(hsv_s, hsv_weight)):
            tone = '봄웜톤(spring)'
        else:
            tone = '가을웜톤(fall)'
    else:
        if(is_smr(hsv_s, hsv_weight)):
            tone = '여름쿨톤(summer)'
        else:
            tone = '겨울쿨톤(winter)'
        # Print Result
    # print('{}의 퍼스널 컬러는 {}입니다.'.format(imgpath, tone))
    return tone


# In[ ]:




