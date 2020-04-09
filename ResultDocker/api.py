#!/bin/python3
from http.server import HTTPServer, BaseHTTPRequestHandler
import os
import json
from io import BytesIO

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'TEST!')

    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        body = self.rfile.read(content_length)
        self.send_response(200)
        self.end_headers()
        response = BytesIO()
        response.write(b'This is POST request. ')
        response.write(b'Received: ')
        response.write(body)
        self.wfile.write(response.getvalue())
        print("test")
        loaded_json=json.loads(body)
        for x in loaded_json:
            print("%s: %d" % (x, loaded_json[x]))
        #st=body
	#str1="echo "
	#str2=str+" > pwd"
	#os.system(str2)


httpd = HTTPServer(('0.0.0.0', 8080), SimpleHTTPRequestHandler)
httpd.serve_forever()
