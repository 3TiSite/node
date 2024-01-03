#!/usr/bin/env python

import os
import sqlparse
import re
from os.path import dirname, join

DUMP = join(dirname(__file__), 'dump')

R_AUTOINC = re.compile(r'AUTO_INCREMENT=\d+')

# 遍历指定目录及其子目录下的所有文件
for dirpath, dirnames, filenames in os.walk(DUMP):
  for filename in filenames:
    # 检查文件是否为SQL文件
    if filename.endswith('.sql'):
      filepath = os.path.join(dirpath, filename)

      # 读取文件内容
      with open(filepath, 'r') as f:
        sql_text = f.read()

      # 使用sqlparse库移除注释
      out = sqlparse.format(sql_text, strip_comments=True).split('\n')
      li = []
      for line in out:
        i = line.strip()
        if not i:
          continue
        if i == ';':
          continue
        i = i.replace(' ENGINE=InnoDB ', ' ').replace(
            ' DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci',
            '').replace(' DEFINER="avnadmin"@"%" ', ' ')
        i = R_AUTOINC.sub('', i)
        # p = i.find(' ENGINE=InnoDB ')
        # if p > 0:
        #   i = i[:p] + ';'
        li.append(i)

      # 写回文件
      with open(filepath, 'w') as f:
        f.write('\n'.join(li))
