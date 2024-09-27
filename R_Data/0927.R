#원 그래프
city = c("서울", "부산", "대구", "인천", "광주", "대전", "울산")
pm25 = c(18, 21, 21, 17, 8, 11, 25)

df = data.frame(지역=city, 초미세먼지농도=pm25)

df

# 그래프 배경 설정
ggplot(df, aes(x="", y=초미세먼지농도, fill=지역)) + 
  #그래프 바 설정
  geom_bar(stat="identity", color="black") + 
  #원형으로 변경
  coord_polar(theta = "y") + 
  # 그래프별 값을 그래프에 넣기
  geom_text(aes(label=초미세먼지농도), color="white", position = position_stack(vjust = 0.5)) + 
  #그래프 배경 제거
  theme_void() + 
  #제목 추가
  labs(title ="주요 도시별 초미세먼지 농도") + 
  #제목 설정
  theme(plot.title = element_text(hjust = 0.5, size = 17, face = "bold")) +
  #그래프 색을 개별로 변경
  scale_fill_manual(values = c("red", "orange", "yellow", "darkgreen", 'blue', 'navy', 'purple'))
  

# 히스토그램
# 다수의 data가 있는 경우 특정 값이 나타나는 빈도수를 출력하는 그래프

quakes
# 지진강도별 지진 발생횟수
#배경 추가
ggplot(data = quakes, aes(x=mag)) + 
  #히스토그램 막대 추가
  geom_histogram(col='black', fill='pink') + 
  # 제목, 라벨 추가
  labs(title="지진 강도의 분포", x="지진강도", y="빈도수")

# 계급의 수(기본: 30개)
# Sturges 공식 사용

# 해당 데이터에 Sturges 공식 적용
k = nclass.Sturges(quakes$mag)


# Sturges 공식을 사용한 지진강도별 지진 발생횟수 
#배경 추가
ggplot(data = quakes, aes(x=mag)) + 
  #히스토그램 막대 추가(계급 수 bins 사용)
  geom_histogram(col='black', fill='pink', bins = k) + 
  # 제목, 라벨 추가
  labs(title="지진 강도의 분포", x="지진강도", y="빈도수")


#확률 밀도 그래프
ggplot(data = quakes, aes(x=mag)) + 
  geom_density(alpha = 0.2, fill='black') #alpha는 불투명 정도



# Sturges 공식과 확률 밀도 그래프를 사용한 지진강도별 지진 발생횟수 
#배경 추가
ggplot(data = quakes, aes(x=mag)) + 
  #히스토그램 막대 추가(계급 수 bins 사용), 히스토그램에 y축으로 확률 밀도도 추가
  geom_histogram(aes(y=..density..), col='black', fill='pink', bins = k) + 
  #확률밀도 그래프 추가
  geom_density(alpha = 0.2, fill='black')
  # 제목, 라벨 추가
  labs(title="지진 강도의 분포", x="지진강도", y="빈도수")
  

# 박스 플롯
  
  #배경 추가
ggplot(data = quakes, aes(y=mag)) + 
  #박스 플롯 추가
  geom_boxplot(col='red', fill='gold') + 
  # 제목, 라벨 추가
  labs(title="지진 강도의 분포", x="피지섬", y="지진강도")
  
  
  