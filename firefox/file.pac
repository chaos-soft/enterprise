function FindProxyForURL (url, host) {
  if (
    host === 'ayakamods.com' ||
    host === 'docs.godotengine.org' ||
    host === 'fitgirl-repacks.site' ||
    host === 'fuskator.com' ||
    host === 'languagetool.org' ||
    host === 'phun.org' ||
    host === 'pornxp.com' ||
    host === 'rutracker.org' ||
    host === 'seasonvar.ru' ||
    host === 'spankbang.com' ||
    host === 'www.deviantart.com' ||
    host === 'www.digitalocean.com' ||
    host === 'www.google.com' ||
    host === 'www.imagefap.com' ||
    host === 'www.kindgirls.com' ||
    host === 'www.pornbb.org' ||
    host === 'www.xvideos.com' ||
    host === 'www.youtube-nocookie.com' ||
    host === 'xhamster.com' ||
    host === 'youtube.com' ||
    host === 'yt3.googleusercontent.com' ||
    shExpMatch(host, '*.dafont.com') ||
    shExpMatch(host, '*.deviantart.net') ||
    shExpMatch(host, '*.eporner.com') ||
    shExpMatch(host, '*.ggpht.com') ||
    shExpMatch(host, '*.googlevideo.com') ||
    shExpMatch(host, '*.intporn.com') ||
    shExpMatch(host, '*.languagetool.org') ||
    shExpMatch(host, '*.phncdn.com') ||
    shExpMatch(host, '*.pornxp.cc') ||
    shExpMatch(host, '*.rutracker.cc') ||
    shExpMatch(host, '*.sb-cd.com') ||
    shExpMatch(host, '*.spankbang.com') ||
    shExpMatch(host, '*.wixmp.com') ||
    shExpMatch(host, '*.xhamster.com') ||
    shExpMatch(host, '*.xhcdn.com') ||
    shExpMatch(host, '*.xvideos-cdn.com') ||
    shExpMatch(host, '*.youtube.com') ||

    shExpMatch(host, '*.ytimg.com')
  ) {
    return 'SOCKS5 127.0.0.1:9150'
  } else {
    return 'DIRECT'
  }
}
