# 필요한 패키지 설치 및 로드
install.packages("chromote")
library(chromote)

# Chromote 세션 시작
b <- ChromoteSession$new()

# 웹사이트 열기
b$Page$navigate("https://www.example.com")

# 페이지가 완전히 로드되도록 대기
Sys.sleep(5)  # 5초 대기 (필요에 따라 시간을 조정)

# JavaScript로 로드된 요소의 텍스트 가져오기
result <- b$Runtime$evaluate("document.querySelector('h1').innerText")

# 리스트에서 결과 값 추출
element_text <- result$result$value

# 결과 출력
print(element_text)

# Chromote 세션 종료
b$close()