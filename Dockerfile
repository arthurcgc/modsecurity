FROM owasp/modsecurity:nginx
# Necessary for nginx-operator healthcheck
RUN apt-get update && apt-get install -y curl

# ModSecurity configuration files
ADD modsecurity /usr/local/waf-conf