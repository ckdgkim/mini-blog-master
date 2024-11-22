# 1. Node 20 버전의 Alpine 이미지로 시작
FROM node:20.17.0-alpine

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 패키지 파일 복사 및 설치
COPY package.json ./
RUN npm install

# 4. 애플리케이션 코드 복사  
# comment
#  이렇게 작성하면 어떤 어떤 파일이 /app 으로 copy 될까? 정확히 넘겨야 하는 내용만 copy해야 하지 않을까 ? 만들어진 이미지 사이즈는 얼마일까 ? 
# 이미지 사이즈는 몇백 메가 도 크다. 줄일 수 있을만큼 경량화 해야 한다. node_modules 가 이미지에 포함되어서는 안된다. 
# 보통 Dockerfile 로 첫글자 대문자로 작성하는데 ???
COPY . .   
# 5. 개발 서버를 사용하여 애플리케이션 실행
EXPOSE 3000
CMD ["npm", "start"]
