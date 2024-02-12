from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
TEMPLATES_DIRS = BASE_DIR/"templates"
STATIC_DIR = BASE_DIR/'static'


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
import environ

env = environ.Env()
environ.Env.read_env()

SECRET_KEY =env('SECRET_KEY')
#

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

#allowing all hosts to connect
ALLOWED_HOSTS = ["*"]


#cros 
CORS_ORIGIN_ALLOW_ALL= True
CORS_ALLOW_METHODS = [
'DELETE',
'GET',
'OPTIONS',
'PATCH',
'POST',
'PUT',
]

CORS_ALLOWED_ORIGIN_REGEXES = [
r"^https://\w+\.domain\.com$",
]

CORS_ALLOW_HEADERS = [
    "accept",
    "accept-encoding",
    "authorization",
    "content-type",
    "dnt",
    "origin",
    "user-agent",
    "x-csrftoken",
    "x-requested-with",
    "BearerToken",
    "JWT",
]


# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'newsapp',
    'rest_framework',
    'newseditorapp',
    'corsheaders',
    "rest_framework.authtoken",
    "django_apscheduler",
    'paypal.standard.ipn',
]

APSCHEDULER_DATETIME_FORMAT = "N j, Y, f:s a"  # Default

SCHEDULER_DEFAULT = True

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    "corsheaders.middleware.CorsMiddleware",
]

ROOT_URLCONF = 'AdaequareProject.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [TEMPLATES_DIRS],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'AdaequareProject.wsgi.application'

REST_FRAMEWORK={
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
        #'rest_framework.authentication.SessionAuthentication',
        #'rest_framework.authentication.BasicAuthentication',
    ),
    "DEFAULT_PERMISSION_CLASSES":("rest_framework.permission.IsAuthenticated",),

}


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'newsdb',
        'USER': 'root',
        'PASSWORD': 'India@1234',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = [STATIC_DIR]

#email settings
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = "mkcgudjango@gmail.com"
EMAIL_HOST_PASSWORD ="nzxrcpktavtoqrjg"

# Custom setting. To email
RECIPIENT_ADDRESS = 'mkcpjcgu@gmail.com'

#rest framework pagination settings_dict
REST_FRAMEWORK={
    'DEFAULT_PAGINATION_CLASS':'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE':100,
}

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# we are specifying after login where it need to login to the specific redirecting page

#login_url="/accounts/login/"
LOGIN_URL = "/accounts/login/"
LOGIN_REDIRECT_URL = "/newseditor/newssearch"


#JWT Token setting
import datetime
JWT_AUTH={
"JWT_ALLOW_REFRESH":True,
'JWT_AUTH_HEADER_PREFIX': 'JWT',
'JWT_EXPIRATION_DELTA': datetime.timedelta(seconds=300),
'JWT_REFRESH_EXPIRATION_DELTA': datetime.timedelta(days=7),
}


#Paypal settings

PAYPAL_TEST = True
PAYPAL_RECEIVER_EMAIL='sb-vkkps18062460@business.example.com'


#django Logger
import os
import logging
import logging.config
LOGGING = {
    "version":1,
    #Django
    'django':{
            "handlers":['file','console'],
            'level': 'DEBUG',
            #'level': os.getenv('DJANGO_LOG_LEVEL', 'DEBUG'),
        },
    #Handlers
    "handlers":{
        'file':{
            'level':'INFO',
            'class':'logging.FileHandler',
            'filename':'./logs/debug3.log',
            'formatter':'simple',
        },
    #console
    'console': {
            "class": "logging.StreamHandler",
           "level": "DEBUG",
            },
    },
    #formatters
    'formatters': {
        'simple': {
            'format': '{levelname} {asctime} {module} {process:d} {thread:d} {message}',
            'style': '{',
        },
    },
}
