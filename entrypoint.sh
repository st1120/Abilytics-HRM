#!/bin/bash

echo "Waiting for database to be ready..."
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic --noinput
python3 manage.py createhorillauser --first_name Abilytics --last_name HRM --username abilytics --password 123 --email hr@abilytics.com --phone 8826659270
gunicorn --bind 0.0.0.0:8000 horilla.wsgi:application
