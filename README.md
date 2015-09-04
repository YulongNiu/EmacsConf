# Emacs Configure for Data Analysis #

I am working some data analysis, and Emacs brings me a lot of fun. I combine R, Python, C/C++ in my daily work, so the configures are mainly about these languages. Please enjoy my Emacs configure.

**Platform**:

* Emacs > 24.5.1

* Fedora 22

* Path of `init.el`: `~/.emacs`

* Path of `.emacs.d`: `~/.emacs.d/`

**Files:**
* `init.el`: Emacs configure files, you may want to change it according to the platform like `.emacs`. For the folders `custom` and `snippets`, please copy them to `.emacs.d`

* `custom`: Sorted configure files for separated topics.

* `snippets`: Addtional YASnippet templates.

## 0 Replace with your configure ##

### 1. `init.el` ###

* C/C++ headers path

``` Emacs Lisp
...

'(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/5.1.1/" "/usr/include/c++/5.1.1/x86_64-redhat-linux/" "/usr/include/c++/5.1.1/backward/")))
    '(ess-roxy-str "##'")

...
```

Get the headers path

``` bash
$ gcc -xc -E -v -
$ gcc -xc++ -E -v -
```

* ESS Roxygen


``` Emacs Lisp
...

     ("examples" . "")
     ("author" . "Yulong Niu \\email{niuylscu@@gmail.com}"))))
     '(ess-user-full-name "Yulong Niu")

...
```


## 1. C ##

Use [helm](https://github.com/emacs-helm/helm) and [CEDET](http://cedet.sourceforge.net/). 

### Install system packages ###

``` bash
# dnf install cmake clang llvm
```

### 1.1 CEDET ###

Install the lastest CEDET.

``` bash
git clone http://git.code.sf.net/p/cedet/git ~/.emacs.d/cedet
cd ~/.emacs.d/cedet
make
cd contrib
make
```






References:

* [C/C++ Development Environment for Emacs](https://tuhdo.github.io/c-ide.html) 




