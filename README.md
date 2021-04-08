[![Image pulls](https://img.shields.io/docker/pulls/131hub/postfix)](https://hub.docker.com/r/131hub/postfix)
[![Image version](https://img.shields.io/docker/v/131hub/postfix)](https://hub.docker.com/r/131hub/postfix)
[![Image size](https://img.shields.io/docker/image-size/131hub/postfix)](https://hub.docker.com/r/131hub/postfix)



# Motivation

[`131hub/postfix`](https://hub.docker.com/r/131hub/postfix) is a **docker image** bringing simple postfix container.



### How to run it

The following env variables need to be passed to the container:

* `SMTP_SERVER` Server address of the SMTP server to use.
* `SMTP_PORT` (Optional, Default value: 587) Port address of the SMTP server to use.
* `SMTP_USERNAME` (Optional) Username to authenticate with.
* `SMTP_PASSWORD` (Mandatory if `SMTP_USERNAME` is set) Password of the SMTP user. If `SMTP_PASSWORD_FILE` is set, not needed.
* `SERVER_HOSTNAME` Server hostname for the Postfix container. Emails will appear to come from the hostname's domain.

The following env variable(s) are optional.
* `SMTP_HEADER_TAG` This will add a header for tracking messages upstream. Helpful for spam filters. Will appear as "RelayTag: ${SMTP_HEADER_TAG}" in the email headers.

* `SMTP_NETWORKS` Setting this will allow you to add additional, comma seperated, subnets to use the relay. Used like
    -e SMTP_NETWORKS='xxx.xxx.xxx.xxx/xx,xxx.xxx.xxx.xxx/xx'

* `SMTP_PASSWORD_FILE` Setting this to a mounted file containing the password, to avoid passwords in env variables. Used like
    -e SMTP_PASSWORD_FILE=/secrets/smtp_password
    -v $(pwd)/secrets/:/secrets/
* `ALWAYS_ADD_MISSING_HEADERS` This is related to the [always\_add\_missing\_headers](http://www.postfix.org/postconf.5.html#always_add_missing_headers) Postfix option (default: `no`). If set to `yes`, Postfix will always add missing headers among `From:`, `To:`, `Date:` or `Message-ID:`.

* `OVERWRITE_FROM` This will rewrite the from address overwriting it with the specified address for all email being relayed. Example settings:
    OVERWRITE_FROM=email@company.com
    OVERWRITE_FROM="Your Name" <email@company.com>

#### A note about using gmail as a relay

Gmail by default [does not allow email clients that don't use OAUTH 2](http://googleonlinesecurity.blogspot.co.uk/2014/04/new-security-measures-will-affect-older.html)
for authentication (like Thunderbird or Outlook). First you need to enable access to "Less secure apps" on your
[google settings](https://www.google.com/settings/security/lesssecureapps).

Also take into account that email `From:` header will contain the email address of the account being used to
authenticate against the Gmail SMTP server(SMTP_USERNAME), the one on the email will be ignored by Gmail unless you [add it as an alias](https://support.google.com/mail/answer/22370).



# Credits
* [131](https://github.com/131);
* [juanluisbaptiste/docker-postfix's inspiration](https://github.com/juanluisbaptiste/docker-postfix)
* Alexandre Ellert tips
