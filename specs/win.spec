# -*- mode: python -*-

"""
PyInstaller build specification for Windows.

This spec uses a dynamically resolved project root and disables encryption of
the resulting PYZ archive.
"""

import os

block_cipher = None

ROOT = os.path.abspath('.')


a = Analysis(['run.py'],
             pathex=['C:\\Users\\tester\\Desktop\\fqm'],
             binaries=[],
             datas=[(os.path.join(ROOT, 'arabic_reshaper', '*'), 'arabic_reshaper')],
             hiddenimports=[
                'app.gui', 'PyQt5', 'PyQt5.QtWidgets', 'email.mime.multipart', 'win32com.client',
                'email.mime.message', 'email.mime.text', 'email.mime.image', 'email.mime.audio',
                'sqlalchemy.sql.default_comparator', 'jinja2', 'logging.config'
            ],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data, cipher=None)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='main',
          debug=False,
          strip=False,
          upx=True,
          console=False ,
          icon='C:\\Users\\tester\\Desktop\\fqm\\static\\images\\favicon.ico')
