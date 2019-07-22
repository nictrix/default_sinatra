#!/usr/bin/env sh
  
echo
echo "APP ENVIRONMENT: ${APP_ENV}"
echo

if [[ "${APP_ENV}" == "production" ]]; then
  with_or_without='without'; \
else
  with_or_without='with'; \
fi

bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` \
  --retry 3 --${with_or_without}=development,test
code=$?;

if [[ $code != 0 ]]; then exit $code; fi

apk del --no-cache --update build-base \
                            linux-headers \
                            git
