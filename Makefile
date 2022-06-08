# путь к python
ENV=venv/bin/python
# путь к .sql файлу откуда будет происходить восстановление из бэкапа
DB_BACKUP_DIR=backup
DB_RESTORE_FILE=$(shell ls -1r $(DB_BACKUP_DIR)/*.sql | head -n1)

run-makemigrations:
	# создать миграции
	$(ENV) manage.py makemigrations

run-migrate:
	# применить миграции
	$(ENV) manage.py migrate

run-db-create:
	# создаёт бд и роль xyz_user
	psql -c "CREATE DATABASE xyz;"
	psql -c "CREATE USER xyz_user WITH PASSWORD 'xyz_password';"
	psql -c "GRANT ALL PRIVILEGES ON DATABASE xyz TO xyz_user;"
	psql -c "ALTER USER xyz_user CREATEDB;"

run-db-restore: run-db-create
	# создаёт бд и восстанавливает дамп из .sql файла 
	psql -f $(DB_RESTORE_FILE) xyz

run-test:
	# запустить тесты
	$(ENV) manage.py test

run-venv-requirements:
	# создает окружение и устанавливает туда зависимости
	\
	virtualenv venv; \
	. venv/bin/activate; \
	pip install -r requirements.txt;

create-superuser:
	echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@myproject.com', 'password')" | $(ENV) manage.py shell

run-server:
	$(ENV) manage.py runserver

run-start: run-venv-requirements run-db-restore run-makemigrations run-migrate run-test create-superuser run-server
	# первый запуск проекта