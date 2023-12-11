FROM python:3.11
COPY . /opt/cd-album-list
WORKDIR /opt/cd-album-list
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"
RUN poetry --version
RUN poetry install --no-root
EXPOSE 8000
CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]