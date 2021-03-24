# README

Simple Dockerfile repository to keep track of: <https://hub.docker.com/repository/docker/arthurcgc/waf-modsecurity>
This Docker Image is intended to work alongside project: <https://github.com/arthurcgc/WAF> which imports this image as the base image of all nginx resources created

## Why does this image exist?

This image expands owasp/modsecurity:nginx adding curl which is required while working with: <https://github.com/tsuru/nginx-operator>
The only other addition is the Core Rule Set(CRS) from <https://coreruleset.org/installation/> that is mounted inside the container at: ```/usr/local/waf-conf```
Alongside the set of rules from CRS two other configuration files are mounted: ```crs-setup.conf``` and ```modsecurity-recommended.conf```

### About the configuration files

* modsecurity-recommended.conf
    is responsible of configuring the RuleEngine of ModSecurity, that means, how ModSecurity behaves i.e: should ModSecurity parse request bodies? Should ModSecurity block a request body that is too large? How should ModSecurity handle file uploads, where, when and how do we keep them?

* crs-setup.conf
    The configuration directives/settings in this file are used to control the OWASP ModSecurity CRS.
    The CRS assumes that modsecurity.conf has been loaded. It is bundled with ModSecurity.
    The order of file inclusion in your webserver configuration should always be:
    1. modsecurity.conf
    2. crs-setup.conf (this file)
    3. rules/*.conf (the CRS rule files)

* rules/*.conf
    These rules define the CRS. As of CRS 3.3.x(which we are using) CRS made it easy to edit it's rules, the basic principle is that the rules shouldn't be edited at all, apart from REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf and RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf, these files should be used when we want to exclude or edit any rule behavior.
    One side-note is the REQUEST-912-DOS-PROTECTION.conf, it should be edited and the user should define the variables explicited inside the conf file so that any DOS protection rule should work.
