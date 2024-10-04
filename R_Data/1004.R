# 시계열 데이터 그래프 애니메이션
# 전세계 국가(핀란드, 대한민국, 베트남)에 대한 연도별 기대수명과 국내총생산(GDP)와의 관계 분석

# 데이터 필터링, 정렬, 변환, 요약 패키지
install.packages("dplyr")
# 예제 데이터셋 패키지로, 세계 여러 나라의 경제적, 사회적 지표(예: GDP, 기대 수명, 인구 등) 데이터를 포함
install.packages("gapminder")

# 설치된 패키지 사용 명령어: library
library(dplyr)
library(gapminder)

# 예제 데이터셋 확인
gapminder


# 전세계 국가 중에서 3개국(핀란드, 대한민국, 베트남) 데이터만 필터링해서 추출
df = gapminder %>% filter(country=="Finland" | country=="Korea, Rep." | country=="Vietnam")

# 전체 행 확인
print(df, n=Inf)

# 시계열 데이터 그래프
# x축 : 1인당 총생산, y축 : 기대수명
# 애니메이션 설정 추가

# 그래프 축 설정(size=pop에서 pop는 인구, 인구에 따른 점 크기 변형), 애니메이션 추가
anim = ggplot(df, aes(x=gdpPercap, y=lifeExp, size=pop, color = country)) + 
  # 그래프 포인트 설정, 투명도 50% 설정
  geom_point(alpha=0.5) + 
  # 값이 가장 작은 것은 5, 가장 큰 것은 15로 설정
  scale_size(range = c(5, 15)) + 
  # 연도가 frame에 나타나는 시간으로 대체
  labs(title = "연도: {frame_time}", x = "1인당 GDP", y = "기대수명") + 
  # 애니메이션 추가 시 필요 코드
  transition_time(year) +  # 시간(연도)에 따라 애니메이션 변화
  shadow_wake(0.5) # 과거 프레임 출력

# 애니메이션 실행, 한 번만 실행(width, height는 애니메이션 그래프 크기, loop=FALSE는 반복 제거)
animate(anim, width=500, height=400, duration = 10, renderer = gifski_renderer(loop = FALSE))
  

  



#===========================================================================

# 그림 애니메이션 : 양궁

# magick 패키지 설치
install.packages("magick")

# 설치된 magick 패키지 사용
library(magick)

# 스크립트와 동일 폴더에 있는 이미지를 읽어오기
bg = image_read("C:/Users/AISW-509-189/Desktop/R_Data/background.png") # 배경이미지
target = image_read("C:/Users/AISW-509-189/Desktop/R_Data/target.png") # 과녘판 이미지
arrow = image_read("C:/Users/AISW-509-189/Desktop/R_Data/arrow.png") # 화살

# 이미지 출력
print(bg)
print(target)
print(arrow)

# 이미지 크기 변경
bg = image_scale(bg, "600x300!")
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")

# 이미지 출력
print(bg)
print(target)
print(arrow)

# 이미지 회전
arrow = image_rotate(image_background(arrow, "none"), -11)
print(arrow)

# 이미지 합성 : 배경 + 과녘판
bg2 = image_composite(bg, target, offset = geometry_point(450, 80))
print(bg2)

# 화살 위치 초기화
x = 0
y = 220

# 반복문을 사용하여 화살이 움직이는 애니메이션 설정
# 반복문이 수행될 때마다 x축의 값은 20 증가시키고 y축의 값은 -4

while(TRUE){
  
  # 화살 이미지 위치 (x, y)
  position = geometry_point(x, y)
  
  # 이미지 합성 : bg2(배경 + 과녘판) + arrow(화살)
  img = image_composite(bg2, arrow, offset = position)
  
  print(img)
  
  #초 단위
  Sys.sleep(0.1)
  
  # x축의 값이 400이 되면 반복문 빠져나간다.
  if(x==400)
    break
  x = x + 20
  y = y -4
  
  
}


# 그림 애니메이션을 이용하여 직선이 아닌 포물선으로 날아가도록 수정해보세요.
# 초기 각도와 화실이 움직이는 속력, 중력에 대한 곡선 현태는 검색하여 임의로 설정해 자연스럽게 보이도록 하세요.

arrow = image_rotate(image_background(arrow, "none"), -130)
print(arrow)

# 화살 위치 초기화
x = 0
y = 130

# 반복문을 사용하여 화살이 움직이는 애니메이션 설정
# 반복문이 수행될 때마다 x축의 값은 20 증가시키고 y축의 값은 변화

while(TRUE){
  
  # 화살 이미지 위치 (x, y)
  position = geometry_point(x, y)
  
  # 이미지 합성 : bg2(배경 + 과녘판) + arrow(화살)
  img = image_composite(bg2, arrow, offset = position)
  
  print(img)
  
  # 초 단위
  Sys.sleep(0.1)
  
  # x축의 값이 400이 되면 반복문 빠져나간다.
  if(x == 400){
    arrow = image_rotate(image_background(arrow, "none"), -22)
    break
  }
  
  # 화살이 목표에 도달한 후 상향으로 바뀌는 경우
  if(x >= 250){
    x = x + 20
    y = y + 5
  } else {
    x = x + 20
    y = y - 3
  }
  
  # x가 250이 되었을 때 각도를 11도로 변경
  if (x >= 250 && x < 270) {
    arrow = image_rotate(image_background(arrow, "none"), 11)
  }
  
  # 현재 위치를 출력
  print(position)
}






