;----------------;
;;; JavaScript ;;;
;----------------;

(require 'flycheck)
(require 'web-beautify)
(require 'company-tern)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("^\.tern-project$" . json-mode))

(add-to-list 'company-backends 'company-tern)

(setq js2-highlight-level 3)
(setq-default js2-basic-offset 4)
(setq js-indent-level 4)
(setq jsx-indent-level 4)

;; js2-refactor config
(require 'js2-refactor)
(add-hook 'js2-mode-hook 'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; web-beautify settings
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

;;(eval-after-load 'js2-mode
;;  '(add-hook 'js2-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))


(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook (lambda ()
			   ;; (tern-mode)
			   (linum-mode 1)))

;; fix error when tern does not autorefresh (https://truongtx.me/2014/04/20/emacs-javascript-completion-and-refactoring/)
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

(provide 'js-settings)



