#!/bin/python3
from http.server import HTTPServer, BaseHTTPRequestHandler
import os
import json
from io import BytesIO
from datetime import datetime

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
        #response = BytesIO()
        #response.write(b'This is POST request. ')
        #response.write(b'Received: ')
        #response.write(body)
        #self.wfile.write(response.getvalue())

        var=body.decode("utf-8")
        FMT = '%H:%M:%S'

        end = var.split('&')
        if end[0] == "FIN":
            f = open(end[1], "r")
            content = f.read()
            f.close()
            now = datetime.now()
            current_time = now.strftime(FMT)
            tdelta = datetime.strptime(current_time, FMT) - datetime.strptime(content, FMT)
            f = open("results.txt", "a+")
            f.write(str(tdelta)+end[2])
            os.remove(end[1])
        else:
            f = open(var, "w+")
            now = datetime.now()
            current_time = now.strftime(FMT)
            f.write(current_time)
            f.close()
            


httpd = HTTPServer(('0.0.0.0', 8080), SimpleHTTPRequestHandler)
httpd.serve_forever()
