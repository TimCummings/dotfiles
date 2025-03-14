# This is my attempt to replicate Wezterm's awesome Quick Select Mode
# https://wezterm.org/quickselect.html
from kitty.clipboard import set_clipboard_string
import re

# List of regular expressions to match against
PATTERNS = [
    r'\[[^]]*\]\(([^)]+)\)', # markdown_url
    r'(?:https?://|git@|git://|ssh://|ftp://|file://)\S+', # url
    r'--- a/(\S+)', # diff_a
    r'\+\+\+ b/(\S+)', # diff_b
    r'sha256:([0-9a-f]{64})', # docker
    r'(?:[.\w\-@~]+)?(?:/+[.\w\-@]+)+', # path
    r'#[0-9a-fA-F]{6}', # color
    r'[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}', # uuid
    r'Qm[0-9a-zA-Z]{44}', # ipfs
    r'[0-9a-f]{7,40}', # sha
    r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', # ip
    r'[A-f0-9:]+:+[A-f0-9:]+[%\w\d]+', # ipv6
    r'0x[0-9a-fA-F]+', # address
    r'[0-9]{4,}', # number
]

# This function is responsible for finding all matching text.
# `extra_cli_args` are any extra arguments passed on the command line when invoking the kitten.
def mark(text, args, Mark, extra_cli_args, *a):
    combined_pattern = '|'.join(PATTERNS)
    for idx, m in enumerate(re.finditer(combined_pattern, text)):
        start, end = m.span()
        mark_text = text[start:end].replace('\n', '').replace('\0', '')
        yield Mark(idx, start, end, mark_text, {})


# This function is responsible for performing some action on the selected text.
# `matches` is a list of the selected entries and `groupdicts` contains
# the arbitrary data associated with each entry in `mark()` above
def handle_result(args, data, target_window_id, boss, extra_cli_args, *a):
    matches, groupdicts = [], []
    for m, g in zip(data['match'], data['groupdicts']):
        if m:
            matches.append(m), groupdicts.append(g)
    for word, match_data in zip(matches, groupdicts):
        w = boss.window_id_map.get(target_window_id)
        if w is not None:
            set_clipboard_string(word)
