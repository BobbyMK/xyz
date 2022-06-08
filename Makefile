# путь к python
ENV=testvenv/bin/python
# путь к .sql файлу откуда будет происходить восстановление из бэкапа
DB_BACKUP_DIR=backup
DB_RESTORE_FILE=$(shell ls -1r $(DB_BACKUP_DIR)/*.json | head -n1)

run-makemigrations:
	# создать миграции
	$(ENV) manage.py makemigrations

run-migrate:
	# применить миграции
	$(ENV) manage.py migrate

run-db-create:
	# создаёт бд и роль bobby
	psql -c "CREATE DATABASE xyz1;"
	psql -c "CREATE USER bobby WITH PASSWORD '79759';"
	psql -c "GRANT ALL PRIVILEGES ON DATABASE xyz1 TO bobby;"
	psql -c "ALTER USER bobby CREATEDB;"

run-db-restore: run-db-create
	# создаёт бд и восстанавливает дамп из .json файла
	psql -f $(DB_RESTORE_FILE) xyz1

run-test:
	# запустить тесты
	$(ENV) manage.py test

run-venv-requirements:
	# создает окружение и устанавливает туда зависимости
	\
	virtualenv testvenv; \
	source testvenv/bin/activate; \
	pip install -r requirements.txt; \

run-server:
	$(ENV) manage.py runserver

run-start: run-venv-requirements run-db-restore run-makemigrations run-migrate run-test run-server
	# первый запуск проекта