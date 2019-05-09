FROM python:3.7 AS builder

RUN apt-get update && apt-get install patchelf -y

WORKDIR /build

COPY ./app/requirements.txt /build/requirements.txt
RUN pip install -U pip PyInstaller staticx --no-cache-dir && \
    pip install -r requirements.txt --no-cache-dir

COPY ./app /build
RUN python -OO -m PyInstaller main.py \
    --distpath /build \
    --noconfirm \
    --onefile
RUN mkdir /dist && staticx /build/main /dist/main
RUN mkdir /empty

FROM scratch
COPY --from=builder /dist /app/.
COPY --from=builder /empty /tmp
ENTRYPOINT ["/app/main"]
