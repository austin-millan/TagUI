set -ex
chrome_proxy_configuration=""
chrome_http_proxy_configuration=""
if [ -n "${http_proxy}" ]; then
  chrome_http_proxy_configuration="http=${http_proxy}"
  chrome_proxy_configuration=$(printf "%s%s;" $chrome_proxy_configuration $chrome_http_proxy_configuration)
fi

chrome_https_proxy_configuration=""
if [ -n "${https_proxy}" ]; then
  chrome_https_proxy_configuration="https=${https_proxy}"
  chrome_proxy_configuration=$(printf "%s%s;" $chrome_proxy_configuration $chrome_https_proxy_configuration)
fi

chrome_socks_proxy_configuration=""
if [ -n "${socks_proxy}" ]; then
  chrome_socks_proxy_configuration="socks=${socks_proxy}"
  chrome_proxy_configuration=$(printf "%s%s;" $chrome_proxy_configuration $chrome_socks_proxy_configuration)
fi

echo $chrome_proxy_configuration
if [[ -z "$chrome_proxy_configuration" ]]; then
  chrome_proxy_configuration=""
else
  chrome_proxy_configuration=$(printf "%sproxy-server=%s" "--" $chrome_proxy_configuration)
fi

echo $chrome_proxy_configuration