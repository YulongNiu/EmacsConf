# Emacs Configure for Data Analysis #

I am working some data analysis, and Emacs brings me a lot of fun. Please enjoy my Emacs configure.

**Platform**:

* Emacs > 24.5.1

* Fedora 22

**Files:**
* `init.el`: Emacs configure, you may want to change it according to the platform like `.emacs`. For the folders `custom` and `snippets`, please copy them to `.emacs.d`

* `custom`: Sorted configure files for separated task (mainly about program languages).

* `snippets`: Addtional YASnippet templates.




## 1. C ##

Use [helm](https://github.com/emacs-helm/helm) and [CEDET](http://cedet.sourceforge.net/).

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




