function FindProxyForURL (url, host) {
  if (
    host === 'fuskator.com' ||
    host === 'pornxp.com' ||
    host === 'rutracker.org' ||
    host === 'seasonvar.ru' ||
    host === 'spankbang.com' ||
    host === 'www.eporner.com' ||
    host === 'www.imagefap.com' ||
    host === 'www.xv-ru.com' ||
    host === 'www.xvideos.com' ||
    host === 'xhamster.com' ||
    shExpMatch(host, '*.ggpht.com') ||
    shExpMatch(host, '*.intporn.com') ||
    shExpMatch(host, '*.pornxp.cc') ||
    shExpMatch(host, '*.spankbang.com') ||
    shExpMatch(host, '*.wixmp.com') ||
    shExpMatch(host, '*.xhamster.com')
  ) {
    return 'SOCKS5 127.0.0.1:9150'
  } else {
    return 'DIRECT'
  }
}
