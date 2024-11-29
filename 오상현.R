# 빵 속 건포도 개수 평균 변화 시뮬레이션

#목표: 매번 빵 속에 들어간 건포도의 개수를 시뮬레이션하여 평균 건포도 개수가 일정한 값을 유지하는지 확인.

#설정: 빵 하나에 들어가는 건포도 개수가 0부터 30까지 랜덤하게 정해지는 상황.



# 빵 속 건포도 개수 평균 변화 시뮬레이션 (0~30 건포도)
iteration = 1000          # 반복 횟수
prob = NULL               # 누적 평균 건포도 수를 저장할 벡터
total_raisins = 0         # 총 건포도 개수 저장 변수
average_raisins = mean(0:30) # 평균 건포도 개수 (수렴값: 15)

# 반복문: 빵 속 건포도 개수를 시뮬레이션
for (x in 1:iteration) {
  
  # 건포도 개수를 0~30 사이에서 랜덤하게 추출
  raisins = sample(0:30, 1, replace = T)
  
  # 총 건포도 개수 업데이트
  total_raisins = total_raisins + raisins
  
  # 현재까지의 평균값을 계산해 prob 벡터에 추가
  prob = c(prob, round(total_raisins / x, 2))
}

# 데이터 프레임으로 변환
df.raisins = data.frame("반복수" = 1:iteration, "누적평균건포도수" = prob)

# 그래프 생성
library(ggplot2)

ggplot(data = df.raisins, aes(x = 반복수, y = 누적평균건포도수, group = 1)) +
  geom_line(color = "blue", size = 1) +                  # 누적 평균 변화 선
  geom_point(size = 0.5) +                               # 누적 평균 변화 점
  geom_hline(yintercept = average_raisins, color = "red", linetype = "dashed") + # 평균값 기준선
  labs(title = "빵 속 건포도 개수의 평균 변화 (0~30 건포도)",
       x = "반복 수",
       y = "평균 건포도 수")
