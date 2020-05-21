# exec.vim

Execute the current file and pipe the output into another buffer for convenient
viewing.

Basically it opens a split and named `__out__` and does the equivalent of
```
$ ./<current_buffer> 2&>1 __out__
```

## Installation

```
Plug '3uclidian/exec.vim'
```
