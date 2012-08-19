import os, sys
import cgi
import cgitb; cgitb.enable()

uploadDir = "./"

def saveFile(field, uploadDir):
	form = cgi.FieldStorage()
	
	if not form.has_key(field): return
	
	fileitem = form[field]
	if not fileitem.file: return
	
	fout = file (os.path.join(uploadDir, fileitem.filename), 'wb')
	while 1:
		chunk = fileitem.file.read(65536)
		if not chunk: break
		fout.write(chunk)
	
	fout.close()

saveFile("filething", uploadDir)
