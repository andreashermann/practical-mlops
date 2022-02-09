FROM python:3.9.10
ADD Makefile .
ADD requirements.txt .
RUN make install
ADD main.py .
EXPOSE 8000
ENTRYPOINT python main.py