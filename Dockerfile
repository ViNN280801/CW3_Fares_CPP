FROM alpine as cw3_fares_cpp

RUN apk add build-base
WORKDIR /app
COPY . .

RUN gcc -c sort.cpp -o sort.o && \
    gcc -c main.cpp -o main.o && \
    gcc -lstdc++ -std=c++17 -Wall -Wpedantic -Wextra sort.o main.o -o main && \
    rm sort.o main.o

FROM alpine:latest

COPY --from=cw3_fares_cpp /app/sort /app/sort
WORKDIR /app
