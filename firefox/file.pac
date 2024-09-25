function FindProxyForURL (url, host) {
  if (
    host === 'fuskator.com' ||
    host === 'rutracker.org' ||
    host === 'www.deviantart.com' ||
    host === 'www.imagefap.com' ||
    shExpMatch(host, '*.ggpht.com') ||
    shExpMatch(host, '*.wixmp.com')
  ) {
    return 'SOCKS5 127.0.0.1:9150'
  } else {
    return 'DIRECT'
  }
}
