import vim
import yaml
from omnipytent import *
from omnipytent.terminal import (
    TerminalWaitForOutputCommand,
    TerminalWaitForOutputCommand,
)
from omnipytent.execution import ShellCommandExecuter
from omnipytent.execution import ShellCommandExecuter
import json

from omnipytent.util import other_windows, vim_repr
from omnipytent.async_execution import AsyncCommand


class Terminal(ShellCommandExecuter):
    def __init__(self, job_id, buffer):
        self.job_id = job_id
        self.buffer = buffer

    if bool(int(vim.eval('exists("*term_start")'))):  # Vim 8

        @staticmethod
        def __start(command):
            job_id = FN.term_start(
                command,
                dict(
                    curwin=1,
                    out_cb=FN["omnipytent#_vimJobChannelCallbackStdout"],
                    err_cb=FN["omnipytent#_vimJobChannelCallbackStderr"],
                    exit_cb=FN["omnipytent#_vimJobExitCallback"],
                ),
            )
            return job_id

        def write(self, text):
            # FN won't work - term_sendkeys's result is weird
            vim.command("call term_sendkeys(%s, %s)" % (self.job_id, vim_repr(text)))
            for window in vim.windows:
                if window.buffer != self.buffer:
                    continue
                if window.valid:
                    with other_windows(window):
                        # Unlike Neovim's, with Vim 8's terminal you need to enter
                        # insert mode inside the terminal after sending the keys.
                        vim.command(r'call feedkeys("a\<C-\>\<C-n>G", "n")')

        @property
        def alive(self):
            return FN.string(FN.term_getjob.raw_call(self.job_id)).endswith(" run")

    elif bool(int(vim.eval('exists("*termopen")'))):  # Neovim

        @staticmethod
        def __start(command):
            callback = FN["omnipytent#_nvimJobCallback"]
            job_id = FN.termopen(
                command,
                dict(
                    on_stdout=callback,
                    on_stderr=callback,
                    on_exit=callback,
                ),
            )
            FN.feedkeys("a", "n")
            try:
                vim.command("normal! G")
                vim.command(r'call feedkeys("a\<C-\>\<C-n>G", "n")')
            except:
                pass
            return job_id

        def write(self, text):
            FN.jobsend(self.job_id, text)

        @property
        def alive(self):
            try:
                FN.jobsend(self.job_id, "")
            except Exception:
                return False
            else:
                return True

    def send_raw(self, text):
        self.write(text + "\n")

    try:
        __start
    except NameError:
        pass
    else:

        @classmethod
        def start(cls, command):
            return cls(cls.__start(command), vim.current.buffer)

    def wait_for_prompt(self, target):
        return TerminalWaitForOutputCommand(self, target, allow_partial=True)

    def wait_for_prompt_regex(self, target):
        return TerminalWaitForOutputCommand(
            self, re.compile(target), allow_partial=True
        )


@ShellCommandExecuter
def TERMINAL_PANEL_WITHOUT_AUTOCLOSE(command, size=5, vertical=False):
    vim.command("redraw")  # Release 'Press ENTER or type command to continue'
    old_win_view = vim.eval("winsaveview()")
    vertical = "vertical " if vertical else ""
    vim.command(vertical + "botright new")
    vim.command(vertical + "call winrestview(%s)" % (old_win_view,))
    vim.command(vertical + "resize %s" % (size,))
    return Terminal.start(command)
