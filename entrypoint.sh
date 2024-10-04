#!/bin/bash

echo "Waiting for database to be ready..."
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic --noinput
python3 manage.py createhorillauser --first_name Abilytics --last_name Inc --username abilytics --password 123 --email hrm@abilytics.com --phone 1234567890
gunicorn --bind 0.0.0.0:8000 horilla.wsgi:application
