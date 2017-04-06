# vintage 설정

## ESC 눌렀을 때, `Window-Space` 자동 입력

* ST2 기준임
* Data/Packages/Vintage/vintage.py 파일을 다음과 같이 수정
```python
#... 생략 ...

class ExitInsertMode(sublime_plugin.TextCommand):
    def run_(self, args):
        edit = self.view.begin_edit(self.name(), args)
        try:
            self.run(edit)
        finally:
            self.view.end_edit(edit)

        # Call after end_edit(), to ensure the final entry in the glued undo
        # group is 'exit_insert_mode'.
        import ctypes
        ctypes.windll.user32.keybd_event(0x5b, 0, 0, 0) # Win'key is down
        ctypes.windll.user32.keybd_event(0x20, 0, 0, 0) # Space'key is down
        ctypes.windll.user32.keybd_event(0x20, 0, 0x0002, 0) # Space'key is up
        ctypes.windll.user32.keybd_event(0x5b, 0, 0x0002, 0) # Win'key is up
        self.view.run_command('glue_marked_undo_groups')

#... 생략 ...
```


## 참고자료

* [원본 vintage.py 파일](./vintage.py)
* [수정된 vintage.py 파일](./vintage_updated.py)