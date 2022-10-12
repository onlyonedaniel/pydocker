FROM harbor.web.garenanow.com/library/sh-web-dev-python:3.7v2

COPY . /var/www/src
WORKDIR /var/www/src/pydocker

RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN /usr/local/bin/python -m pip install --upgrade pip && poetry install --no-dev

CMD ["/usr/local/bin/jupyter", "notebook", "--port", "8000", "--ip", "0.0.0.0", "--allow-root", "--no-browser"]