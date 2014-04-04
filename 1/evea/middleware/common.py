# -*- coding:utf-8 -*-

class CommonMiddleware(object):

    def process_request(self, request):
        
        url = request.path_info
        
        # 允许第三方工具通过将本站设为代理服务器来调用 evea API
        if url.startswith('https://api.eveonline.com/'):
            request.path_info = url.replace('https://api.eveonline.com', '', 1)
        
        return None

