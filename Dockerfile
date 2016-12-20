################################
# Dockerfile: thedcg/gentoo:latest

# ベース
FROM gentoo/stage3-amd64:latest

################################
# Dockerfile

# 管理者
MAINTAINER Lemures Lemniscati <lemures.lemniscati@gmail.com>

# アップデート
ADD http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2 /
RUN date --iso-8601=ns\
 && mkdir -p /usr/portage/distfiles /usr/portage/metadata /usr/portage/packages\
 && bzcat /portage-latest.tar.bz2 | tar -xf - -C /usr\
 && rm -f /portage-latest.tar.bz2\
# && emerge --sync\
# && emerge --metadata\
 && emerge --update --deep @world\
 && emerge app-portage/gentoolkit\
 && date --iso-8601=ns

# 終了
